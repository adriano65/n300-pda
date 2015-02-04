#!/bin/sh	
./configure --host=arm-none-linux-gnueabi --with-included-popt --disable-ipv6 CFLAGS="-static -march=armv4t"
