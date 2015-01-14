#!/bin/sh
#./configure --host=arm-none-linux-gnueabi --sysconfdir=/etc --disable-history --with-ncurses CFLAGS="-D_UWIN2P0 -static -march=armv4t -Wl,-strip-all"
./configure --host=arm-none-linux-gnueabi --sysconfdir=/etc --disable-history --with-ncurses CFLAGS="-D_UWIN2P0 -march=armv4t -Wl,-strip-all"
