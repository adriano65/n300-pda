noinst_LIBRARIES = libport.a
noinst_HEADERS = libport.h getopt.h

libport_a_SOURCES =

libport_a_LIBADD = @LIBOBJS@ @LIBPORT_GETOPT_LONG_DEP@

AUTOMAKE_OPTIONS = dist-tarZ no-dependencies 1.0

# how to pull in getopt.o if we need to build getopt_long.o?
# can anyone tell me how to express that in automake speak, please...
getopt_long.o: getopt.o
