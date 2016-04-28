message(STATUS "downloading...
     src='ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz'
     dst='/root/koreader/base/thirdparty/libffi/build/downloads/libffi-3.2.1.tar.gz'
     timeout='none'")




file(DOWNLOAD
  "ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz"
  "/root/koreader/base/thirdparty/libffi/build/downloads/libffi-3.2.1.tar.gz"
  SHOW_PROGRESS
  EXPECTED_HASH;MD5=83b89587607e3eb65c70d361f13bab43
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
