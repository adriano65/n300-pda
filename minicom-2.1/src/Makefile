# Makefile.in generated automatically by automake 1.4-p6 from Makefile.am

# Copyright (C) 1994, 1995-8, 1999, 2001 Free Software Foundation, Inc.
# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.


SHELL = /bin/sh

srcdir = .
top_srcdir = ..

prefix = /usr/local
exec_prefix = ${prefix}

bindir = ${exec_prefix}/bin
sbindir = ${exec_prefix}/sbin
libexecdir = ${exec_prefix}/libexec
datadir = ${prefix}/share
sysconfdir = /etc
sharedstatedir = ${prefix}/com
localstatedir = ${prefix}/var
libdir = ${exec_prefix}/lib
infodir = ${prefix}/info
mandir = ${prefix}/man
includedir = ${prefix}/include
oldincludedir = /usr/include

DESTDIR =

pkgdatadir = $(datadir)/minicom
pkglibdir = $(libdir)/minicom
pkgincludedir = $(includedir)/minicom

top_builddir = ..

ACLOCAL = /opt/N310/Linux/minicom-2.1/aux/missing aclocal-1.4
AUTOCONF = autoconf
AUTOMAKE = /opt/N310/Linux/minicom-2.1/aux/missing automake-1.4
AUTOHEADER = autoheader

INSTALL = /usr/bin/ginstall -c
INSTALL_PROGRAM = ${INSTALL} $(AM_INSTALL_PROGRAM_FLAGS)
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_SCRIPT = ${INSTALL}
transform = s,x,x,

NORMAL_INSTALL = :
PRE_INSTALL = :
POST_INSTALL = :
NORMAL_UNINSTALL = :
PRE_UNINSTALL = :
POST_UNINSTALL = :
host_alias = arm-none-linux-gnueabi
host_triplet = arm-none-linux-gnueabi
BUILD_INCLUDED_LIBINTL = no
CATALOGS =  cs.gmo es.gmo fr.gmo fi.gmo hu.gmo ja.gmo pl.gmo pt_BR.gmo ru.gmo
CATOBJEXT = .gmo
CC = arm-none-linux-gnueabi-gcc
CPP = arm-none-linux-gnueabi-gcc -E
DATADIRNAME = share
GENCAT = gencat
GLIBC21 = yes
GMOFILES =  cs.gmo es.gmo fr.gmo fi.gmo hu.gmo ja.gmo pl.gmo pt_BR.gmo ru.gmo
GMSGFMT = /usr/bin/msgfmt
INSTOBJEXT = .mo
INTLBISON = bison
INTLLIBS = 
INTLOBJS = 
INTL_LIBTOOL_SUFFIX_PREFIX = 
KEYSERV = 
LIBICONV = 
LIBOBJS = 
LIBPORT_GETOPT_LONG_DEP = 
MAKEINFO = makeinfo
MKINSTALLDIRS = aux/mkinstalldirs
MSGFMT = /usr/bin/msgfmt
PACKAGE = minicom
PATH_KERMIT = no
POFILES =  cs.po es.po fr.po fi.po hu.po ja.po pl.po pt_BR.po ru.po
POSUB = po
RANLIB = arm-none-linux-gnueabi-ranlib
U = 
USE_INCLUDED_LIBINTL = no
USE_NLS = yes
VERSION = 2.1

EXTRA_PROGRAMS = minicom.keyserv

bin_PROGRAMS = minicom runscript ascii-xfr 

bin_SCRIPTS = xminicom

minicom_SOURCES = minicom.c vt100.c config.c help.c updown.c 	util.c dial.c window.c wkeys.c ipc.c 	windiv.c sysdep1.c sysdep1_s.c sysdep2.c rwconf.c main.c 	file.c getsdir.c wildmat.c common.c


noinst_HEADERS = charmap.h configsym.h defmap.h 	getsdir.h intl.h keyboard.h minicom.h 	port.h vt100.h window.h sysdep.h rcsid.h


runscript_SOURCES = script.c sysdep1_s.c common.c port.h minicom.h

ascii_xfr_SOURCES = ascii-xfr.c

minicom_keyserv_SOURCES = keyserv.c wkeys.c sysdep2.c

AUTOMAKE_OPTIONS = dist-tarZ 1.0

MINICOM_LIBPORT = $(top_builddir)/lib/libport.a

LDADD = $(MINICOM_LIBPORT)

CFLAGS = -D_UWIN2P0 -march=armv4t -Wl,-strip-all -Wall -W

CPPFLAGS =   -I$(top_srcdir)/lib

minicom_LDADD =  $(MINICOM_LIBPORT)

runscript_LDADD = 

EXTRA_DIST = functions.c xminicom
mkinstalldirs = $(SHELL) $(top_srcdir)/aux/mkinstalldirs
CONFIG_HEADER = ../config.h
CONFIG_CLEAN_FILES = 
PROGRAMS =  $(bin_PROGRAMS)


DEFS = -DHAVE_CONFIG_H -I. -I$(srcdir) -I..
LDFLAGS = 
LIBS =   -lncurses
minicom_keyserv_OBJECTS =  keyserv.o wkeys.o sysdep2.o
minicom_keyserv_LDADD = $(LDADD)
minicom_keyserv_DEPENDENCIES =  $(top_builddir)/lib/libport.a
minicom_keyserv_LDFLAGS = 
minicom_OBJECTS =  minicom.o vt100.o config.o help.o updown.o util.o \
dial.o window.o wkeys.o ipc.o windiv.o sysdep1.o sysdep1_s.o sysdep2.o \
rwconf.o main.o file.o getsdir.o wildmat.o common.o
minicom_DEPENDENCIES =  $(top_builddir)/lib/libport.a
minicom_LDFLAGS = 
runscript_OBJECTS =  script.o sysdep1_s.o common.o
runscript_DEPENDENCIES = 
runscript_LDFLAGS = 
ascii_xfr_OBJECTS =  ascii-xfr.o
ascii_xfr_LDADD = $(LDADD)
ascii_xfr_DEPENDENCIES =  $(top_builddir)/lib/libport.a
ascii_xfr_LDFLAGS = 
SCRIPTS =  $(bin_SCRIPTS)

COMPILE = $(CC) $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
CCLD = $(CC)
LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@
HEADERS =  $(noinst_HEADERS)

DIST_COMMON =  Makefile.am Makefile.in


DISTFILES = $(DIST_COMMON) $(SOURCES) $(HEADERS) $(TEXINFOS) $(EXTRA_DIST)

TAR = tar
GZIP_ENV = --best
SOURCES = $(minicom_keyserv_SOURCES) $(minicom_SOURCES) $(runscript_SOURCES) $(ascii_xfr_SOURCES)
OBJECTS = $(minicom_keyserv_OBJECTS) $(minicom_OBJECTS) $(runscript_OBJECTS) $(ascii_xfr_OBJECTS)

all: all-redirect
.SUFFIXES:
.SUFFIXES: .S .c .o .s
$(srcdir)/Makefile.in: Makefile.am $(top_srcdir)/configure.in $(ACLOCAL_M4) 
	cd $(top_srcdir) && $(AUTOMAKE) --gnu --include-deps src/Makefile

Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
	cd $(top_builddir) \
	  && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status


mostlyclean-binPROGRAMS:

clean-binPROGRAMS:
	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)

distclean-binPROGRAMS:

maintainer-clean-binPROGRAMS:

install-binPROGRAMS: $(bin_PROGRAMS)
	@$(NORMAL_INSTALL)
	$(mkinstalldirs) $(DESTDIR)$(bindir)
	@list='$(bin_PROGRAMS)'; for p in $$list; do \
	  if test -f $$p; then \
	    echo "  $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`"; \
	     $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
	  else :; fi; \
	done

uninstall-binPROGRAMS:
	@$(NORMAL_UNINSTALL)
	list='$(bin_PROGRAMS)'; for p in $$list; do \
	  rm -f $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
	done

.c.o:
	$(COMPILE) -c $<

.s.o:
	$(COMPILE) -c $<

.S.o:
	$(COMPILE) -c $<

mostlyclean-compile:
	-rm -f *.o core *.core

clean-compile:

distclean-compile:
	-rm -f *.tab.c

maintainer-clean-compile:

minicom.keyserv: $(minicom_keyserv_OBJECTS) $(minicom_keyserv_DEPENDENCIES)
	@rm -f minicom.keyserv
	$(LINK) $(minicom_keyserv_LDFLAGS) $(minicom_keyserv_OBJECTS) $(minicom_keyserv_LDADD) $(LIBS)

minicom: $(minicom_OBJECTS) $(minicom_DEPENDENCIES)
	@rm -f minicom
	$(LINK) $(minicom_LDFLAGS) $(minicom_OBJECTS) $(minicom_LDADD) $(LIBS)

runscript: $(runscript_OBJECTS) $(runscript_DEPENDENCIES)
	@rm -f runscript
	$(LINK) $(runscript_LDFLAGS) $(runscript_OBJECTS) $(runscript_LDADD) $(LIBS)

ascii-xfr: $(ascii_xfr_OBJECTS) $(ascii_xfr_DEPENDENCIES)
	@rm -f ascii-xfr
	$(LINK) $(ascii_xfr_LDFLAGS) $(ascii_xfr_OBJECTS) $(ascii_xfr_LDADD) $(LIBS)

install-binSCRIPTS: $(bin_SCRIPTS)
	@$(NORMAL_INSTALL)
	$(mkinstalldirs) $(DESTDIR)$(bindir)
	@list='$(bin_SCRIPTS)'; for p in $$list; do \
	  if test -f $$p; then \
	    echo " $(INSTALL_SCRIPT) $$p $(DESTDIR)$(bindir)/`echo $$p|sed '$(transform)'`"; \
	    $(INSTALL_SCRIPT) $$p $(DESTDIR)$(bindir)/`echo $$p|sed '$(transform)'`; \
	  else if test -f $(srcdir)/$$p; then \
	    echo " $(INSTALL_SCRIPT) $(srcdir)/$$p $(DESTDIR)$(bindir)/`echo $$p|sed '$(transform)'`"; \
	    $(INSTALL_SCRIPT) $(srcdir)/$$p $(DESTDIR)$(bindir)/`echo $$p|sed '$(transform)'`; \
	  else :; fi; fi; \
	done

uninstall-binSCRIPTS:
	@$(NORMAL_UNINSTALL)
	list='$(bin_SCRIPTS)'; for p in $$list; do \
	  rm -f $(DESTDIR)$(bindir)/`echo $$p|sed '$(transform)'`; \
	done

tags: TAGS

ID: $(HEADERS) $(SOURCES) $(LISP)
	list='$(SOURCES) $(HEADERS)'; \
	unique=`for i in $$list; do echo $$i; done | \
	  awk '    { files[$$0] = 1; } \
	       END { for (i in files) print i; }'`; \
	here=`pwd` && cd $(srcdir) \
	  && mkid -f$$here/ID $$unique $(LISP)

TAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) $(LISP)
	tags=; \
	here=`pwd`; \
	list='$(SOURCES) $(HEADERS)'; \
	unique=`for i in $$list; do echo $$i; done | \
	  awk '    { files[$$0] = 1; } \
	       END { for (i in files) print i; }'`; \
	test -z "$(ETAGS_ARGS)$$unique$(LISP)$$tags" \
	  || (cd $(srcdir) && etags -o $$here/TAGS $(ETAGS_ARGS) $$tags  $$unique $(LISP))

mostlyclean-tags:

clean-tags:

distclean-tags:
	-rm -f TAGS ID

maintainer-clean-tags:

distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)

subdir = src

distdir: $(DISTFILES)
	@for file in $(DISTFILES); do \
	  d=$(srcdir); \
	  if test -d $$d/$$file; then \
	    cp -pr $$d/$$file $(distdir)/$$file; \
	  else \
	    test -f $(distdir)/$$file \
	    || ln $$d/$$file $(distdir)/$$file 2> /dev/null \
	    || cp -p $$d/$$file $(distdir)/$$file || :; \
	  fi; \
	done

info-am:
info: info-am
dvi-am:
dvi: dvi-am
check-am: all-am
check: check-am
installcheck-am:
installcheck: installcheck-am
install-exec-am: install-binPROGRAMS install-binSCRIPTS
install-exec: install-exec-am

install-data-am:
install-data: install-data-am

install-am: all-am
	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am
install: install-am
uninstall-am: uninstall-binPROGRAMS uninstall-binSCRIPTS
uninstall: uninstall-am
all-am: Makefile $(PROGRAMS) $(SCRIPTS) $(HEADERS)
all-redirect: all-am
install-strip:
	$(MAKE) $(AM_MAKEFLAGS) AM_INSTALL_PROGRAM_FLAGS=-s install
installdirs:
	$(mkinstalldirs)  $(DESTDIR)$(bindir) $(DESTDIR)$(bindir)


mostlyclean-generic:

clean-generic:

distclean-generic:
	-rm -f Makefile $(CONFIG_CLEAN_FILES)
	-rm -f config.cache config.log stamp-h stamp-h[0-9]*

maintainer-clean-generic:
mostlyclean-am:  mostlyclean-binPROGRAMS mostlyclean-compile \
		mostlyclean-tags mostlyclean-generic

mostlyclean: mostlyclean-am

clean-am:  clean-binPROGRAMS clean-compile clean-tags clean-generic \
		mostlyclean-am

clean: clean-am

distclean-am:  distclean-binPROGRAMS distclean-compile distclean-tags \
		distclean-generic clean-am

distclean: distclean-am

maintainer-clean-am:  maintainer-clean-binPROGRAMS \
		maintainer-clean-compile maintainer-clean-tags \
		maintainer-clean-generic distclean-am
	@echo "This command is intended for maintainers to use;"
	@echo "it deletes files that may require special tools to rebuild."

maintainer-clean: maintainer-clean-am

.PHONY: mostlyclean-binPROGRAMS distclean-binPROGRAMS clean-binPROGRAMS \
maintainer-clean-binPROGRAMS uninstall-binPROGRAMS install-binPROGRAMS \
mostlyclean-compile distclean-compile clean-compile \
maintainer-clean-compile uninstall-binSCRIPTS install-binSCRIPTS tags \
mostlyclean-tags distclean-tags clean-tags maintainer-clean-tags \
distdir info-am info dvi-am dvi check check-am installcheck-am \
installcheck install-exec-am install-exec install-data-am install-data \
install-am install uninstall-am uninstall all-redirect all-am all \
installdirs mostlyclean-generic distclean-generic clean-generic \
maintainer-clean-generic clean mostlyclean distclean maintainer-clean


# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
