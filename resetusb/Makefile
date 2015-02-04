#
# Makefile for backLight
#
# --- some examples
#INSTALLDIR=/opt/N310/Linux/arm-2010.09/arm-none-linux-gnueabi/
#make ARCH=arm headers_check
#make ARCH=arm INSTALL_HDR_PATH=$INSTALLDIR/sysroot/usr headers_install
#make INSTALL_HDR_PATH=/opt/N310/Linux/arm-2010.09/arm-none-linux-gnueabi/sysroot/usr headers_install

CC=arm-none-linux-gnueabi-gcc
#/opt/N310/Linux/arm-2010.09/arm-none-linux-gnueabi/libc/usr/include
# -g for debugger
#CCOPTSDEB=-O -Wall -D_REENTRANT -g -Werror -DDEBUG
#CCOPTS=-O -Wall -D_REENTRANT -march=armv4t -Wl,-strip-all
CCOPTS=-O -Wall -D_REENTRANT -march=armv4t -Wl,-strip-all -I/opt/N310/Linux/linux-2.6.29.n311/include
#LIBTHREAD=/usr/lib/libpthread.a
LIBTHREAD=-lpthread

doall: resetusb
#doall: getmem getmems

clean:
	rm -f *.o resetusb


#####################################################################
# Linking

resetusb: resetusb.o 
	$(CC) $(CCOPTS) resetusb.o $(LIBTHREAD) -lm -o resetusb

# Compiling

resetusb.o: resetusb.c
	$(CC) $(CCOPTS) resetusb.c -c -o resetusb.o

