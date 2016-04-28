# Makefile for program source directory in GNU NLS utilities package.
# Copyright (C) 1995, 1996, 1997 by Ulrich Drepper <drepper@gnu.ai.mit.edu>
#
# This file file be copied and used freely without restrictions.  It can
# be used in projects which are not available under the GNU Public License
# but which still want to provide support for the GNU gettext functionality.
# Please note that the actual code is *not* freely available.
#
# - Modified by Owen Taylor <otaylor@redhat.com> to use GETTEXT_PACKAGE
#   instead of PACKAGE and to look for po2tbl in ./ not in intl/
#
# - Modified by jacob berkman <jacob@ximian.com> to install
#   Makefile.in.in and po2tbl.sed.in for use with glib-gettextize

GETTEXT_PACKAGE = glib20
PACKAGE = glib
VERSION = 2.48.0

SHELL = /bin/bash


srcdir = /root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/po
top_srcdir = /root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib
VPATH = /root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/po

prefix = /root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib-build
exec_prefix = ${prefix}
datarootdir = ${prefix}/share
datadir = ${datarootdir}
libdir = ${exec_prefix}/lib
localedir = $(libdir)/locale
gnulocaledir = $(datadir)/locale
gettextsrcdir = $(datadir)/glib-2.0/gettext/po
subdir = po

INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
MKINSTALLDIRS = mkdir -p

CC = arm-linux-gnueabi-gcc -static-libstdc++ -std=gnu89 -std=gnu89
GENCAT = @GENCAT@
GMSGFMT = /usr/bin/msgfmt
MSGFMT = /usr/bin/msgfmt
MSGFMT_OPTS = -c
XGETTEXT = /usr/bin/xgettext
MSGMERGE = msgmerge

DEFS = -DHAVE_CONFIG_H
CFLAGS = -O2 -ffast-math -pipe -fomit-frame-pointer  -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mthumb -mfloat-abi=softfp -fno-finite-math-only -fno-stack-protector -U_FORTIFY_SOURCE -fPIC
CPPFLAGS =  -pthread

INCLUDES = -I.. -I$(top_srcdir)/intl

COMPILE = $(CC) -c $(DEFS) $(INCLUDES) $(CPPFLAGS) $(CFLAGS) $(XCFLAGS)

SOURCES = 
POFILES =  af.po am.po an.po ar.po as.po ast.po az.po be.po be@latin.po bg.po bn.po bn_IN.po bs.po ca.po ca@valencia.po cs.po cy.po da.po de.po dz.po el.po en_CA.po en_GB.po en@shaw.po eo.po es.po et.po eu.po fa.po fi.po fr.po ga.po gd.po gl.po gu.po he.po hi.po hr.po hu.po hy.po id.po is.po it.po ja.po ka.po kk.po kn.po ko.po ku.po lt.po lv.po mai.po mg.po mk.po ml.po mn.po mr.po ms.po nb.po nds.po ne.po nl.po nn.po oc.po or.po pa.po pl.po ps.po pt.po pt_BR.po ro.po ru.po rw.po si.po sk.po sl.po sq.po sr.po sr@latin.po sr@ije.po sv.po ta.po te.po tg.po th.po tl.po tr.po ug.po tt.po uk.po vi.po wa.po xh.po yi.po zh_CN.po zh_HK.po zh_TW.po
GMOFILES =  af.gmo am.gmo an.gmo ar.gmo as.gmo ast.gmo az.gmo be.gmo be@latin.gmo bg.gmo bn.gmo bn_IN.gmo bs.gmo ca.gmo ca@valencia.gmo cs.gmo cy.gmo da.gmo de.gmo dz.gmo el.gmo en_CA.gmo en_GB.gmo en@shaw.gmo eo.gmo es.gmo et.gmo eu.gmo fa.gmo fi.gmo fr.gmo ga.gmo gd.gmo gl.gmo gu.gmo he.gmo hi.gmo hr.gmo hu.gmo hy.gmo id.gmo is.gmo it.gmo ja.gmo ka.gmo kk.gmo kn.gmo ko.gmo ku.gmo lt.gmo lv.gmo mai.gmo mg.gmo mk.gmo ml.gmo mn.gmo mr.gmo ms.gmo nb.gmo nds.gmo ne.gmo nl.gmo nn.gmo oc.gmo or.gmo pa.gmo pl.gmo ps.gmo pt.gmo pt_BR.gmo ro.gmo ru.gmo rw.gmo si.gmo sk.gmo sl.gmo sq.gmo sr.gmo sr@latin.gmo sr@ije.gmo sv.gmo ta.gmo te.gmo tg.gmo th.gmo tl.gmo tr.gmo ug.gmo tt.gmo uk.gmo vi.gmo wa.gmo xh.gmo yi.gmo zh_CN.gmo zh_HK.gmo zh_TW.gmo
DISTFILES = LINGUAS ChangeLog Makefile.in.in POTFILES.in $(GETTEXT_PACKAGE).pot \
$(POFILES) $(GMOFILES) $(SOURCES)

POTFILES = \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gaction.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gactiongroup.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gappinfo.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gapplication.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gapplicationcommandline.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gapplication-tool.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gasynchelper.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gasyncinitable.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gasyncresult.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gbufferedinputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gbufferedoutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gbytesicon.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gcancellable.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gcharsetconverter.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gcontenttype.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gcontenttype-win32.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gconverter.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gconverterinputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gconverteroutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gcredentials.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdatagrambased.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdatainputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdataoutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusaddress.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusauth.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusauthmechanism.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusauthmechanismsha1.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusauthobserver.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusdaemon.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusinterfaceskeleton.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusmessage.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusmethodinvocation.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusobject.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusobjectmanager.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusobjectmanagerclient.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusobjectskeleton.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusprivate.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusproxy.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbusserver.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdbus-tool.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdesktopappinfo.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdrive.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdtlsclientconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdtlsconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdtlsserverconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdummyfile.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gdummytlsbackend.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gemblem.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gemblemedicon.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfileattribute.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfile.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfileenumerator.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfileicon.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfileinfo.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfileinputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfileiostream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfilemonitor.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfilenamecompleter.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfileoutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfilterinputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gfilteroutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/ghttpproxy.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gicon.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/ginetaddress.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/ginetaddressmask.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/ginetsocketaddress.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/ginitable.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/ginputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gioerror.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/giomodule.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gioscheduler.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/giostream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/glib-compile-resources.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/glib-compile-schemas.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/glistmodel.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gloadableicon.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/glocalfile.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/glocalfileenumerator.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/glocalfileinfo.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/glocalfileinputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/glocalfilemonitor.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/glocalfileoutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/glocalvfs.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gmemoryinputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gmemoryoutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gmenumodel.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gmount.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gmountoperation.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gnativesocketaddress.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gnativevolumemonitor.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gnetworkaddress.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gnetworkmonitorbase.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gnetworkmonitor.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gnetworkmonitornetlink.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gnetworkmonitornm.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gnetworkservice.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/goutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gpermission.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gpollableinputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gpollableoutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gpollfilemonitor.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gpropertyaction.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gproxyaddress.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gproxyaddressenumerator.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gresolver.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gresource.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gresourcefile.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gresource-tool.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gseekable.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsettingsbackend.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsettings.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsettings-tool.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsimpleaction.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsimpleasyncresult.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsimpleiostream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsimpleproxyresolver.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocketaddress.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocket.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocketclient.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocketconnectable.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocketconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocketinputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocketlistener.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocketoutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocketservice.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocks4aproxy.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsocks5proxy.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gsubprocess.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gtask.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gtcpconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gtcpwrapperconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gtestdbus.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gthemedicon.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gthreadedresolver.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gthreadedsocketservice.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gtlscertificate.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gtlsclientconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gtlsconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gtlsfiledatabase.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gtlspassword.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gtlsserverconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gunionvolumemonitor.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gunixconnection.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gunixcredentialsmessage.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gunixinputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gunixmount.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gunixmounts.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gunixoutputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gunixsocketaddress.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gunixvolume.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gunixvolumemonitor.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gvfs.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gvolume.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gvolumemonitor.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gwin32appinfo.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gwin32inputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gwin32outputstream.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gzlibcompressor.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/gzlibdecompressor.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/tests/gdbus-daemon.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gio/win32/gwinhttpfile.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gatomic.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gbookmarkfile.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gconvert.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gdatetime.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gdir.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gfileutils.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/giochannel.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/giowin32.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gkeyfile.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/glib.py \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gmappedfile.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gmarkup.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/goption.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gregex.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gshell.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gspawn.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gspawn-win32.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gutf8.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/glib/gutils.c \
	/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib/gobject/gbinding.c

CATALOGS =  af.gmo am.gmo an.gmo ar.gmo as.gmo ast.gmo az.gmo be.gmo be@latin.gmo bg.gmo bn.gmo bn_IN.gmo bs.gmo ca.gmo ca@valencia.gmo cs.gmo cy.gmo da.gmo de.gmo dz.gmo el.gmo en_CA.gmo en_GB.gmo en@shaw.gmo eo.gmo es.gmo et.gmo eu.gmo fa.gmo fi.gmo fr.gmo ga.gmo gd.gmo gl.gmo gu.gmo he.gmo hi.gmo hr.gmo hu.gmo hy.gmo id.gmo is.gmo it.gmo ja.gmo ka.gmo kk.gmo kn.gmo ko.gmo ku.gmo lt.gmo lv.gmo mai.gmo mg.gmo mk.gmo ml.gmo mn.gmo mr.gmo ms.gmo nb.gmo nds.gmo ne.gmo nl.gmo nn.gmo oc.gmo or.gmo pa.gmo pl.gmo ps.gmo pt.gmo pt_BR.gmo ro.gmo ru.gmo rw.gmo si.gmo sk.gmo sl.gmo sq.gmo sr.gmo sr@latin.gmo sr@ije.gmo sv.gmo ta.gmo te.gmo tg.gmo th.gmo tl.gmo tr.gmo ug.gmo tt.gmo uk.gmo vi.gmo wa.gmo xh.gmo yi.gmo zh_CN.gmo zh_HK.gmo zh_TW.gmo
CATOBJEXT = .gmo
INSTOBJEXT = .mo

.SUFFIXES:
.SUFFIXES: .c .o .po .pox .gmo .mo .msg .cat

.c.o:
	$(COMPILE) $<

.po.pox:
	$(MAKE) $(GETTEXT_PACKAGE).pot
	$(MSGMERGE) $< $(srcdir)/$(GETTEXT_PACKAGE).pot -o $*.pox

.po.mo:
	$(MSGFMT) -o $@ $<

.po.gmo:
	$(AM_V_GEN) file=$(srcdir)/`echo $* | sed 's,.*/,,'`.gmo \
	  && rm -f $$file && $(GMSGFMT) $(MSGFMT_OPTS) -o $$file $<

.po.cat:
	sed -f ../intl/po2msg.sed < $< > $*.msg \
	  && rm -f $@ && $(GENCAT) $@ $*.msg


all: all-yes

all-yes: $(CATALOGS)
all-no:

$(srcdir)/$(GETTEXT_PACKAGE).pot: $(POTFILES)
	$(XGETTEXT) --default-domain=$(GETTEXT_PACKAGE) \
	  --msgid-bugs-address='http://bugzilla.gnome.org/enter_bug.cgi?product=glib&keywords=I18N+L10N&component=general' \
	  --add-comments --keyword=_ --keyword=N_ \
	  --keyword=C_:1c,2 \
	  --keyword=NC_:1c,2 \
	  --keyword=g_dcgettext:2 \
	  --keyword=g_dngettext:2,3 \
	  --keyword=g_dpgettext2:2c,3 \
	  --flag=N_:1:pass-c-format \
	  --flag=C_:2:pass-c-format \
	  --flag=NC_:2:pass-c-format \
	  --flag=g_dngettext:2:pass-c-format \
          --flag=g_strdup_printf:1:c-format \
          --flag=g_string_printf:2:c-format \
          --flag=g_string_append_printf:2:c-format \
          --flag=g_error_new:3:c-format \
          --flag=g_set_error:4:c-format \
          --flag=g_markup_printf_escaped:1:c-format \
          --flag=g_log:3:c-format \
          --flag=g_print:1:c-format \
          --flag=g_printerr:1:c-format \
          --flag=g_printf:1:c-format \
          --flag=g_fprintf:2:c-format \
          --flag=g_sprintf:2:c-format \
          --flag=g_snprintf:3:c-format \
          --flag=g_scanner_error:2:c-format \
          --flag=g_scanner_warn:2:c-format \
	  $(POTFILES) \
	&& test ! -f $(GETTEXT_PACKAGE).po \
	   || ( rm -f $(srcdir)/$(GETTEXT_PACKAGE).pot \
		&& mv $(GETTEXT_PACKAGE).po $(srcdir)/$(GETTEXT_PACKAGE).pot )

install: install-exec install-data
install-exec:
install-data: install-data-yes
install-data-no: all
install-data-yes: all
	$(MKINSTALLDIRS) $(DESTDIR)$(datadir); \
	catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  case "$$cat" in \
	    *.gmo) destdir=$(gnulocaledir);; \
	    *)     destdir=$(localedir);; \
	  esac; \
	  lang=`echo $$cat | sed 's/\$(CATOBJEXT)$$//'`; \
	  dir=$(DESTDIR)$$destdir/$$lang/LC_MESSAGES; \
	  $(MKINSTALLDIRS) $$dir; \
	  if test -r $$cat; then \
	    $(INSTALL_DATA) $$cat $$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT); \
	    echo "installing $$cat as $$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT)"; \
	  else \
	    $(INSTALL_DATA) $(srcdir)/$$cat $$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT); \
	    echo "installing $(srcdir)/$$cat as" \
		 "$$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT)"; \
	  fi; \
	  if test -r $$cat.m; then \
	    $(INSTALL_DATA) $$cat.m $$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m; \
	    echo "installing $$cat.m as $$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m"; \
	  else \
	    if test -r $(srcdir)/$$cat.m ; then \
	      $(INSTALL_DATA) $(srcdir)/$$cat.m \
		$$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m; \
	      echo "installing $(srcdir)/$$cat as" \
		   "$$dir/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m"; \
	    else \
	      true; \
	    fi; \
	  fi; \
	done
	if test "$(PACKAGE)" = "glib"; then \
	  $(MKINSTALLDIRS) $(DESTDIR)$(gettextsrcdir); \
	  $(INSTALL_DATA) $(srcdir)/Makefile.in.in \
			  $(DESTDIR)$(gettextsrcdir)/Makefile.in.in; \
	else \
	  : ; \
	fi

# Define this as empty until I found a useful application.
installcheck:

uninstall:
	catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  lang=`echo $$cat | sed 's/\$(CATOBJEXT)$$//'`; \
	  rm -f $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/$(GETTEXT_PACKAGE)$(INSTOBJEXT); \
	  rm -f $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m; \
	  rm -f $(DESTDIR)$(gnulocaledir)/$$lang/LC_MESSAGES/$(GETTEXT_PACKAGE)$(INSTOBJEXT); \
	  rm -f $(DESTDIR)$(gnulocaledir)/$$lang/LC_MESSAGES/$(GETTEXT_PACKAGE)$(INSTOBJEXT).m; \
	done
	if test "$(PACKAGE)" = "glib"; then \
	  rm -f $(DESTDIR)$(gettextsrcdir)/Makefile.in.in; \
	fi

check: all

dvi info tags TAGS ID:

mostlyclean:
	rm -f core core.* *.pox $(GETTEXT_PACKAGE).po *.old.po cat-id-tbl.tmp
	rm -fr *.o

clean: mostlyclean

distclean: clean
	rm -f Makefile Makefile.in POTFILES *.mo *.msg *.cat *.cat.m

maintainer-clean: distclean
	@echo "This command is intended for maintainers to use;"
	@echo "it deletes files that may require special tools to rebuild."
	rm -f $(GMOFILES)

distdir = ../$(GETTEXT_PACKAGE)-$(VERSION)/$(subdir)
dist distdir: $(DISTFILES)
	dists="$(DISTFILES)"; \
	for file in $$dists; do \
	  ln $(srcdir)/$$file $(distdir) 2> /dev/null \
	    || cp -p $(srcdir)/$$file $(distdir); \
	done

update-po: Makefile
	$(MAKE) $(GETTEXT_PACKAGE).pot
	tmpdir=`pwd`; \
	cd $(srcdir); \
	catalogs='$(CATALOGS)'; \
	for cat in $$catalogs; do \
	  cat=`basename $$cat`; \
	  lang=`echo $$cat | sed 's/\$(CATOBJEXT)$$//'`; \
	  echo "$$lang:"; \
	  if $(MSGMERGE) $$lang.po $(GETTEXT_PACKAGE).pot -o $$tmpdir/$$lang.new.po; then \
	    if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
	      rm -f $$tmpdir/$$lang.new.po; \
            else \
	      if mv -f $$tmpdir/$$lang.new.po $$lang.po; then \
	        :; \
	      else \
	        echo "msgmerge for $$lang.po failed: cannot move $$tmpdir/$$lang.new.po to $$lang.po" 1>&2; \
	        rm -f $$tmpdir/$$lang.new.po; \
	        exit 1; \
	      fi; \
	    fi; \
	  else \
	    echo "msgmerge for $$cat failed!"; \
	    rm -f $$tmpdir/$$lang.new.po; \
	  fi; \
	done

# POTFILES is created from POTFILES.in by stripping comments, empty lines
# and Intltool tags (enclosed in square brackets), and appending a full
# relative path to them
POTFILES: POTFILES.in
	( if test 'x$(srcdir)' != 'x.'; then \
	    posrcprefix='$(top_srcdir)/'; \
	  else \
	    posrcprefix="../"; \
	  fi; \
	  rm -f $@-t $@ \
	    && (sed -e '/^#/d' 						\
		    -e "s/^\[.*\] +//" 					\
		    -e '/^[ 	]*$$/d' 				\
		    -e "s@.*@	$$posrcprefix& \\\\@" < $(srcdir)/$@.in	\
		| sed -e '$$s/\\$$//') > $@-t \
	    && chmod a-w $@-t \
	    && mv $@-t $@ )

Makefile: Makefile.in.in ../config.status POTFILES
	cd .. \
	  && $(SHELL) ./config.status $(subdir)/$@.in

# Tell versions [3.59,3.63) of GNU make not to export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
