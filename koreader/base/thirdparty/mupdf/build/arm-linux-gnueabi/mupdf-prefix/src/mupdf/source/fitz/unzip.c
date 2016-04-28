#include "mupdf/fitz.h"

#include <zlib.h>

#if !defined (INT32_MAX)
#define INT32_MAX 2147483647L
#endif

#define ZIP_LOCAL_FILE_SIG 0x04034b50
#define ZIP_DATA_DESC_SIG 0x08074b50
#define ZIP_CENTRAL_DIRECTORY_SIG 0x02014b50
#define ZIP_END_OF_CENTRAL_DIRECTORY_SIG 0x06054b50

#define ZIP64_END_OF_CENTRAL_DIRECTORY_LOCATOR_SIG 0x07064b50
#define ZIP64_END_OF_CENTRAL_DIRECTORY_SIG 0x06064b50
#define ZIP64_EXTRA_FIELD_SIG 0x0001

#define ZIP_ENCRYPTED_FLAG 0x1

/*
 * Note that the crypt.h in minizip uses unsigned long pointer to pcrc_32_tab
 * it will cause problem on x86_64 machine. While the crypt.h in zlib-1.2.8
 * contrib minizip uses z_crc_t pointer which is determined to unsigned int
 * pointer on 64 bit machine.
 */
#include "contrib/minizip/crypt.h"  // from zlib-1.2.8

#include "aes/fileenc.h"            // from minizip-g0b46a2b

#define AES_METHOD          (99)
#define AES_PWVERIFYSIZE    (2)
#define AES_MAXSALTLENGTH   (16)
#define AES_AUTHCODESIZE    (10)
#define AES_HEADERSIZE      (11)
#define AES_KEYSIZE(mode)   (64 + (mode * 64))

#define KEY_LENGTH(mode)        (8 * (mode & 3) + 8)
#define SALT_LENGTH(mode)       (4 * (mode & 3) + 4)
#define MAC_LENGTH(mode)        (10)

struct zip_entry
{
	char *name;
	int offset, csize, usize;
	int crypted;
};

struct fz_archive_s
{
	char *directory;
	fz_stream *file;
	int count;
	struct zip_entry *table;

	int crypted;
	char password[128];
	unsigned long keys[3];     /* keys defining the pseudo-random sequence */
	const z_crc_t *pcrc_32_tab;
	unsigned long aes_encryption_mode;
	unsigned long aes_compression_method;
	unsigned long aes_version;
	fcrypt_ctx aes_ctx;
};

static inline int zip_toupper(int c)
{
	if (c >= 'a' && c <= 'z')
		return c - 'a' + 'A';
	return c;
}

static int zip_strcasecmp(const char *a, const char *b)
{
	while (zip_toupper(*a) == zip_toupper(*b))
	{
		if (*a++ == 0)
			return 0;
		b++;
	}
	return zip_toupper(*a) - zip_toupper(*b);
}

static int case_compare_entries(const void *a_, const void *b_)
{
	const struct zip_entry *a = a_;
	const struct zip_entry *b = b_;
	return zip_strcasecmp(a->name, b->name);
}

static struct zip_entry *lookup_zip_entry(fz_context *ctx, fz_archive *zip, const char *name)
{
	int l = 0;
	int r = zip->count - 1;
	while (l <= r)
	{
		int m = (l + r) >> 1;
		int c = zip_strcasecmp(name, zip->table[m].name);
		if (c < 0)
			r = m - 1;
		else if (c > 0)
			l = m + 1;
		else
			return &zip->table[m];
	}
	return NULL;
}

static void read_zip_dir_imp(fz_context *ctx, fz_archive *zip, int start_offset)
{
	fz_stream *file = zip->file;
	int sig;
	int offset, count;
	int namesize, metasize, commentsize;
	int i;
	int general;

	fz_seek(ctx, file, start_offset, 0);

	sig = fz_read_int32_le(ctx, file);
	if (sig != ZIP_END_OF_CENTRAL_DIRECTORY_SIG)
		fz_throw(ctx, FZ_ERROR_GENERIC, "wrong zip end of central directory signature (0x%x)", sig);

	(void) fz_read_int16_le(ctx, file); /* this disk */
	(void) fz_read_int16_le(ctx, file); /* start disk */
	(void) fz_read_int16_le(ctx, file); /* entries in this disk */
	count = fz_read_int16_le(ctx, file); /* entries in central directory disk */
	(void) fz_read_int32_le(ctx, file); /* size of central directory */
	offset = fz_read_int32_le(ctx, file); /* offset to central directory */

	/* ZIP64 */
	if (count == 0xFFFF || offset == 0xFFFFFFFF)
	{
		int64_t offset64, count64;

		fz_seek(ctx, file, start_offset - 20, 0);

		sig = fz_read_int32_le(ctx, file);
		if (sig != ZIP64_END_OF_CENTRAL_DIRECTORY_LOCATOR_SIG)
			fz_throw(ctx, FZ_ERROR_GENERIC, "wrong zip64 end of central directory locator signature (0x%x)", sig);

		(void) fz_read_int32_le(ctx, file); /* start disk */
		offset64 = fz_read_int64_le(ctx, file); /* offset to end of central directory record */
		if (offset64 > INT32_MAX)
			fz_throw(ctx, FZ_ERROR_GENERIC, "zip64 files larger than 2 GB aren't supported");

		fz_seek(ctx, file, offset64, 0);

		sig = fz_read_int32_le(ctx, file);
		if (sig != ZIP64_END_OF_CENTRAL_DIRECTORY_SIG)
			fz_throw(ctx, FZ_ERROR_GENERIC, "wrong zip64 end of central directory signature (0x%x)", sig);

		(void) fz_read_int64_le(ctx, file); /* size of record */
		(void) fz_read_int16_le(ctx, file); /* version made by */
		(void) fz_read_int16_le(ctx, file); /* version to extract */
		(void) fz_read_int32_le(ctx, file); /* disk number */
		(void) fz_read_int32_le(ctx, file); /* disk number start */
		count64 = fz_read_int64_le(ctx, file); /* entries in central directory disk */
		(void) fz_read_int64_le(ctx, file); /* entries in central directory */
		(void) fz_read_int64_le(ctx, file); /* size of central directory */
		offset64 = fz_read_int64_le(ctx, file); /* offset to central directory */

		if (count == 0xFFFF)
		{
			if (count64 > INT32_MAX)
				fz_throw(ctx, FZ_ERROR_GENERIC, "zip64 files larger than 2 GB aren't supported");
			count = count64;
		}
		if (offset == 0xFFFFFFFF)
		{
			if (offset64 > INT32_MAX)
				fz_throw(ctx, FZ_ERROR_GENERIC, "zip64 files larger than 2 GB aren't supported");
			offset = offset64;
		}
	}

	zip->count = count;
	zip->table = fz_malloc_array(ctx, count, sizeof *zip->table);
	memset(zip->table, 0, count * sizeof *zip->table);

	fz_seek(ctx, file, offset, 0);

	for (i = 0; i < count; i++)
	{
		sig = fz_read_int32_le(ctx, file);
		if (sig != ZIP_CENTRAL_DIRECTORY_SIG)
			fz_throw(ctx, FZ_ERROR_GENERIC, "wrong zip central directory signature (0x%x)", sig);

		(void) fz_read_int16_le(ctx, file); /* version made by */
		(void) fz_read_int16_le(ctx, file); /* version to extract */
		general = fz_read_int16_le(ctx, file); /* general */
		(void) fz_read_int16_le(ctx, file); /* method */
		(void) fz_read_int16_le(ctx, file); /* last mod file time */
		(void) fz_read_int16_le(ctx, file); /* last mod file date */
		(void) fz_read_int32_le(ctx, file); /* crc-32 */
		if (general & ZIP_ENCRYPTED_FLAG) {
			zip->crypted = 1;
			zip->table[i].crypted = 1;
		} else {
			zip->table[i].crypted = 0;
		}
		zip->table[i].csize = fz_read_int32_le(ctx, file);
		zip->table[i].usize = fz_read_int32_le(ctx, file);
		namesize = fz_read_int16_le(ctx, file);
		metasize = fz_read_int16_le(ctx, file);
		commentsize = fz_read_int16_le(ctx, file);
		(void) fz_read_int16_le(ctx, file); /* disk number start */
		(void) fz_read_int16_le(ctx, file); /* int file atts */
		(void) fz_read_int32_le(ctx, file); /* ext file atts */
		zip->table[i].offset = fz_read_int32_le(ctx, file);

		zip->table[i].name = fz_malloc(ctx, namesize + 1);
		fz_read(ctx, file, (unsigned char*)zip->table[i].name, namesize);
		zip->table[i].name[namesize] = 0;

		while (metasize > 0)
		{
			int type = fz_read_int16_le(ctx, file);
			int size = fz_read_int16_le(ctx, file);
			if (type == ZIP64_EXTRA_FIELD_SIG)
			{
				int sizeleft = size;
				if (zip->table[i].usize == 0xFFFFFFFF && sizeleft >= 8)
				{
					zip->table[i].usize = fz_read_int64_le(ctx, file);
					sizeleft -= 8;
				}
				if (zip->table[i].csize == 0xFFFFFFFF && sizeleft >= 8)
				{
					zip->table[i].csize = fz_read_int64_le(ctx, file);
					sizeleft -= 8;
				}
				if (zip->table[i].offset == 0xFFFFFFFF && sizeleft >= 8)
				{
					zip->table[i].offset = fz_read_int64_le(ctx, file);
					sizeleft -= 8;
				}
				fz_seek(ctx, file, sizeleft - size, 1);
			}
			fz_seek(ctx, file, size, 1);
			metasize -= 4 + size;
		}
		if (zip->table[i].usize < 0 || zip->table[i].csize < 0 || zip->table[i].offset < 0)
			fz_throw(ctx, FZ_ERROR_GENERIC, "zip64 files larger than 2 GB are not supported");

		fz_seek(ctx, file, commentsize, 1);
	}

	qsort(zip->table, count, sizeof *zip->table, case_compare_entries);
}

static void read_zip_dir(fz_context *ctx, fz_archive *zip)
{
	fz_stream *file = zip->file;
	unsigned char buf[512];
	int size, back, maxback;
	int i, n;

	fz_seek(ctx, file, 0, SEEK_END);
	size = fz_tell(ctx, file);

	maxback = fz_mini(size, 0xFFFF + sizeof buf);
	back = fz_mini(maxback, sizeof buf);

	while (back < maxback)
	{
		fz_seek(ctx, file, size - back, 0);
		n = fz_read(ctx, file, buf, sizeof buf);
		for (i = n - 4; i > 0; i--)
		{
			if (!memcmp(buf + i, "PK\5\6", 4))
			{
				read_zip_dir_imp(ctx, zip, size - back + i);
				return;
			}
		}
		back += sizeof buf - 4;
	}

	fz_throw(ctx, FZ_ERROR_GENERIC, "cannot find end of central directory");
}

static int read_zip_entry_header(fz_context *ctx, fz_archive *zip, struct zip_entry *ent)
{
	fz_stream *file = zip->file;
	int sig, general, method, namelength, extralength;
	int i, headerid, datasize, crc32, modtime, chk;

	unsigned char source[12];
	unsigned char crcbyte;

	fz_seek(ctx, file, ent->offset, 0);

	sig = fz_read_int32_le(ctx, file);
	if (sig != ZIP_LOCAL_FILE_SIG)
		fz_throw(ctx, FZ_ERROR_GENERIC, "wrong zip local file signature (0x%x)", sig);

	(void) fz_read_int16_le(ctx, file); /* version */
	general = fz_read_uint16_le(ctx, file); /* general */
	method = fz_read_uint16_le(ctx, file);
	modtime = fz_read_uint16_le(ctx, file); /* file time */
	(void) fz_read_int16_le(ctx, file); /* file date */
	crc32 = fz_read_uint32_le(ctx, file); /* crc-32 */
	(void) fz_read_int32_le(ctx, file); /* csize */
	(void) fz_read_int32_le(ctx, file); /* usize */
	namelength = fz_read_int16_le(ctx, file);
	extralength = fz_read_int16_le(ctx, file);

	fz_seek(ctx, file, namelength, 1);
	if (general & ZIP_ENCRYPTED_FLAG) {
		if (method == AES_METHOD) {
			while (extralength > 0) {
				headerid = fz_read_uint16_le(ctx, file);
				datasize = fz_read_uint16_le(ctx, file);
				if (headerid == 0x9901) {
					zip->aes_version = fz_read_int16_le(ctx, file);
					(void) fz_read_int16_le(ctx, file); /* "AE" */
					zip->aes_encryption_mode = fz_read_byte(ctx, file);
					zip->aes_compression_method = fz_read_int16_le(ctx, file);
				}
				extralength -= 2 + 2 + datasize;
			}
			if (zip->aes_encryption_mode) {
				unsigned char passverifyread[AES_PWVERIFYSIZE];
				unsigned char passverifycalc[AES_PWVERIFYSIZE];
				unsigned char saltvalue[AES_MAXSALTLENGTH];
				unsigned int saltlength;
				saltlength = SALT_LENGTH(zip->aes_encryption_mode);
				fz_read(ctx, file, saltvalue, saltlength);
				fz_read(ctx, file, passverifyread, AES_PWVERIFYSIZE);
				fcrypt_init(zip->aes_encryption_mode, zip->password, strlen(zip->password),
					saltvalue, passverifycalc, &zip->aes_ctx);
				for (i = 0; i < AES_PWVERIFYSIZE; i++) {
					if (passverifyread[i] != passverifycalc[i]) {
						return -1;
					}
				}
			}
		} else {
			fz_seek(ctx, file, extralength, 1);
			zip->pcrc_32_tab = (const z_crc_t*)get_crc_table();
			init_keys(zip->password, zip->keys, zip->pcrc_32_tab);
			fz_read(ctx, file, source, 12);
			for (i = 0; i < 12; i++) {
				crcbyte = zdecode(zip->keys, zip->pcrc_32_tab, source[i]);
			}
			if (general & 0x8) {
				chk = modtime;  // WTF? This is undocumented in the APPNOTE!
			} else {
				chk = crc32 >> 16;
			}
			if (chk >> 8 != crcbyte) {
				return -1;
			}
		}
	} else {
		fz_seek(ctx, file, extralength, 1);
	}

	return method;
}

static fz_stream *open_zip_entry(fz_context *ctx, fz_archive *zip, struct zip_entry *ent)
{
	fz_stream *file = zip->file;
	int method = read_zip_entry_header(ctx, zip, ent);
	if (method == AES_METHOD) {
		method = zip->aes_compression_method;
	}
	if (method == 0)
		return fz_open_null(ctx, file, ent->usize, fz_tell(ctx, file));
	if (method == 8)
		return fz_open_flated(ctx, file, -15);
	fz_throw(ctx, FZ_ERROR_GENERIC, "unknown zip method: %d", method);
}

static fz_buffer *read_zip_entry(fz_context *ctx, fz_archive *zip, struct zip_entry *ent)
{
	fz_stream *file = zip->file;
	fz_buffer *ubuf;
	unsigned char *cbuf;
	int method;
	int i;
	z_stream z;
	int code;

	method = read_zip_entry_header(ctx, zip, ent);
	if (method == AES_METHOD) {
		method = zip->aes_compression_method;
	}

	ubuf = fz_new_buffer(ctx, ent->usize + 1); /* +1 because many callers will add a terminating zero */
	ubuf->len = ent->usize;

	if (method == 0)
	{
		fz_try(ctx)
		{
			fz_read(ctx, file, ubuf->data, ent->usize);
			if (ent->crypted) {
				if (zip->aes_encryption_mode) {
					fcrypt_decrypt(ubuf->data, ent->usize, &zip->aes_ctx);
				} else {
					for(i = 0; i < ent->usize; ++i)
						ubuf->data[i] = zdecode(zip->keys,zip->pcrc_32_tab, ubuf->data[i]);
				}
			}
		}
		fz_catch(ctx)
		{
			fz_drop_buffer(ctx, ubuf);
			fz_rethrow(ctx);
		}
		return ubuf;
	}

	if (method == 8)
	{
		cbuf = fz_malloc(ctx, ent->csize);
		fz_try(ctx)
		{
			fz_read(ctx, file, cbuf, ent->csize);

			if (ent->crypted) {
				if (zip->aes_encryption_mode) {
					fcrypt_decrypt(cbuf, ent->csize, &zip->aes_ctx);
				} else {
					for(i = 0; i < ent->csize; ++i) {
						cbuf[i] = zdecode(zip->keys, zip->pcrc_32_tab, cbuf[i]);
					}
				}
			}
			z.zalloc = (alloc_func) fz_malloc_array;
			z.zfree = (free_func) fz_free;
			z.opaque = ctx;
			z.next_in = cbuf;
			z.avail_in = ent->csize;
			z.next_out = ubuf->data;
			z.avail_out = ent->usize;

			code = inflateInit2(&z, -15);
			if (code != Z_OK)
			{
				fz_throw(ctx, FZ_ERROR_GENERIC, "zlib inflateInit2 error: %s", z.msg);
			}
			code = inflate(&z, Z_FINISH);
			if (code != Z_STREAM_END)
			{
				inflateEnd(&z);
				fz_throw(ctx, FZ_ERROR_GENERIC, "zlib inflate error: %s", z.msg);
			}
			code = inflateEnd(&z);
			if (code != Z_OK)
			{
				fz_throw(ctx, FZ_ERROR_GENERIC, "zlib inflateEnd error: %s", z.msg);
			}
		}
		fz_always(ctx)
		{
			fz_free(ctx, cbuf);
		}
		fz_catch(ctx)
		{
			fz_drop_buffer(ctx, ubuf);
			fz_rethrow(ctx);
		}
		return ubuf;
	}

	fz_drop_buffer(ctx, ubuf);
	fz_throw(ctx, FZ_ERROR_GENERIC, "unknown zip method: %d", method);
}

int
fz_archive_needs_password(fz_context *ctx, fz_archive *zip)
{
	return zip->crypted;
}

int
fz_archive_authenticate_password(fz_context *ctx, fz_archive *zip, const char *password)
{
	int i;
	fz_strlcpy(zip->password, password, sizeof zip->password);
	for (i = 0; i < zip->count; ++i) {
		if (zip->table[i].crypted) {
			return read_zip_entry_header(ctx, zip, &zip->table[i]) != -1;
		}
	}
	return 1;
}

int
fz_has_archive_entry(fz_context *ctx, fz_archive *zip, const char *name)
{
	if (zip->directory)
	{
		char path[2048];
		FILE *file;
		fz_strlcpy(path, zip->directory, sizeof path);
		fz_strlcat(path, "/", sizeof path);
		fz_strlcat(path, name, sizeof path);
		file = fz_fopen(path, "rb");
		if (file)
			fclose(file);
		return file != NULL;
	}
	else
	{
		return lookup_zip_entry(ctx, zip, name) != NULL;
	}
}

fz_stream *
fz_open_archive_entry(fz_context *ctx, fz_archive *zip, const char *name)
{
	if (zip->directory)
	{
		char path[2048];
		fz_strlcpy(path, zip->directory, sizeof path);
		fz_strlcat(path, "/", sizeof path);
		fz_strlcat(path, name, sizeof path);
		return fz_open_file(ctx, path);
	}
	else
	{
		struct zip_entry *ent = lookup_zip_entry(ctx, zip, name);
		if (!ent)
			fz_throw(ctx, FZ_ERROR_GENERIC, "cannot find zip entry: '%s'", name);
		return open_zip_entry(ctx, zip, ent);
	}
}

fz_buffer *
fz_read_archive_entry(fz_context *ctx, fz_archive *zip, const char *name)
{
	if (zip->directory)
	{
		char path[2048];
		fz_strlcpy(path, zip->directory, sizeof path);
		fz_strlcat(path, "/", sizeof path);
		fz_strlcat(path, name, sizeof path);
		return fz_read_file(ctx, path);
	}
	else
	{
		struct zip_entry *ent = lookup_zip_entry(ctx, zip, name);
		if (!ent)
			fz_throw(ctx, FZ_ERROR_GENERIC, "cannot find zip entry: '%s'", name);
		return read_zip_entry(ctx, zip, ent);
	}
}

int
fz_count_archive_entries(fz_context *ctx, fz_archive *zip)
{
	return zip->count;
}

const char *
fz_list_archive_entry(fz_context *ctx, fz_archive *zip, int idx)
{
	if (idx < 0 || idx >= zip->count)
		return NULL;
	return zip->table[idx].name;
}

void
fz_drop_archive(fz_context *ctx, fz_archive *zip)
{
	int i;
	if (zip)
	{
		fz_free(ctx, zip->directory);
		fz_drop_stream(ctx, zip->file);
		for (i = 0; i < zip->count; ++i)
			fz_free(ctx, zip->table[i].name);
		fz_free(ctx, zip->table);
		fz_free(ctx, zip);
	}
}

fz_archive *
fz_open_directory(fz_context *ctx, const char *dirname)
{
	fz_archive *zip = fz_malloc_struct(ctx, fz_archive);
	zip->directory = fz_strdup(ctx, dirname);
	return zip;
}

fz_archive *
fz_open_archive_with_stream(fz_context *ctx, fz_stream *file)
{
	fz_archive *zip;

	zip = fz_malloc_struct(ctx, fz_archive);
	zip->file = fz_keep_stream(ctx, file);
	zip->count = 0;
	zip->table = NULL;

	fz_try(ctx)
	{
		read_zip_dir(ctx, zip);
	}
	fz_catch(ctx)
	{
		fz_drop_archive(ctx, zip);
		fz_rethrow(ctx);
	}

	return zip;
}

fz_archive *
fz_open_archive(fz_context *ctx, const char *filename)
{
	fz_stream *file;
	fz_archive *zip;

	file = fz_open_file(ctx, filename);

	fz_try(ctx)
		zip = fz_open_archive_with_stream(ctx, file);
		zip->aes_compression_method = 0;
		zip->aes_encryption_mode = 0;
		zip->aes_version = 0;
	fz_always(ctx)
		fz_drop_stream(ctx, file);
	fz_catch(ctx)
		fz_rethrow(ctx);

	return zip;
}
