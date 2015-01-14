
EXTRA_PROGRAMS = minicom.keyserv

bin_PROGRAMS = minicom runscript ascii-xfr @KEYSERV@

bin_SCRIPTS = xminicom

minicom_SOURCES = minicom.c vt100.c config.c help.c updown.c \
	util.c dial.c window.c wkeys.c ipc.c \
	windiv.c sysdep1.c sysdep1_s.c sysdep2.c rwconf.c main.c \
	file.c getsdir.c wildmat.c common.c
	
noinst_HEADERS = charmap.h configsym.h defmap.h \
	getsdir.h intl.h keyboard.h minicom.h \
	port.h vt100.h window.h sysdep.h rcsid.h

runscript_SOURCES = script.c sysdep1_s.c common.c port.h minicom.h

ascii_xfr_SOURCES = ascii-xfr.c

minicom_keyserv_SOURCES = keyserv.c wkeys.c sysdep2.c

AUTOMAKE_OPTIONS = dist-tarZ 1.0

MINICOM_LIBPORT = $(top_builddir)/lib/libport.a

LDADD = $(MINICOM_LIBPORT)

CFLAGS = @CFLAGS@ -Wall -W

CPPFLAGS = @CPPFLAGS@  -I$(top_srcdir)/lib

minicom_LDADD = @INTLLIBS@ $(MINICOM_LIBPORT)

runscript_LDADD = @INTLLIBS@

EXTRA_DIST = functions.c xminicom

