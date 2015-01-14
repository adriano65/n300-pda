
EXTRA_DIST = ABOUT-NLS AUTHORS COPYING ChangeLog FILE_ID.DIZ \
	     INSTALL NEWS README aux/[a-z]* minicom.spec

SUBDIRS = doc extras man intl po lib src

#AUTOMAKE_OPTIONS = dist-tarZ no-dependencies 1.0
AUTOMAKE_OPTIONS = dist-tarZ 1.0

ctags:
	ctags --globals -l c src/*.c

## make rpms
rpm:	Makefile
	$(MAKE) dist
	rpm -ta --clean $(PACKAGE)-$(VERSION).tar.gz

## make a Debian binary package
deb: configure
	dpkg-buildpackage -B -rfakeroot -tc -uc

## make a Debian source package
deb-src: configure
	dpkg-buildpackage -S -i -rfakeroot -tc -uc -us
