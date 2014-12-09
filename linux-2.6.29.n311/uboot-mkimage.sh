#!/bin/bash
case "$1" in
        dump)
		#arm-angstrom-linux-gnueabi-objdump -d arch/arm/boot/compressed/vmlinux >vmlinux.S
		arm-angstrom-linux-gnueabi-objdump -d vmlinux >vmlinux.S
                ;;
        zImage)
		./mkimage -n "Linux-2.6.29" -A arm -O linux -T kernel -C none -a 0x30008000 -e 0x30008000 -d arch/arm/boot/zImage uzImage
                ;;
        vmlin)
		gzip -f -9 vmlinux
		./mkimage -n "Linux-2.6.29" -A arm -O linux -T kernel -C gzip -a 0x30008000 -e 0x30008000 -d vmlinux.gz uvImage
                ;;
        uncompr)
		echo "Creating uncompressed uImage"
		./mkimage -n "Linux-2.6.29" -A arm -O linux -T kernel -C none -a 0x30008000 -e 0x30008000 -d arch/arm/boot/Image uImage
                ;;

        uncompr1)
		echo "Creating uncompressed uImage"
		make V=1 uImage
		./mkimage -n "Linux-2.6.29-n311" -A arm -O linux -T kernel -C none -a 0x30008000 -e 0x30008000 -d arch/arm/boot/zImage arch/arm/boot/uImage
                ;;

        orig)
		arm-angstrom-linux-gnueabi-objcopy -O binary -R .note -R .comment -S arch/arm/boot/compressed/vmlinux linux.bin 
		gzip -f -9 linux.bin
		./mkimage -n "Linux-2.6.29-n311" -A arm -O linux -T kernel -C gzip -a 0x30008000 -e 0x30008000 -d linux.bin.gz uImage
		NSIZE=`ls -s ./uImage | awk '{print $1}' `
		if [ "$NSIZE" -gt 2724 ]; then
			echo 
			echo "uImage is too BIG!!"
			exit 1
		fi
		rm linux.bin.gz
		#rm vmlinux
		rm vmlinux.o
                ;;
        orig-uncompre)
		arm-angstrom-linux-gnueabi-objcopy -O binary -R .note -R .comment -S arch/arm/boot/compressed/vmlinux linux.bin 
		./mkimage -n "Linux-2.6.29-n311" -A arm -O linux -T kernel -C none -a 0x30008000 -e 0x30008000 -d linux.bin uImage
		#rm vmlinux
		rm vmlinux.o
                ;;
        uzImage)
		./mkimage -n "Linux-2.6.29" -A arm -O linux -T kernel -C none -a 0x30008000 -e 0x30008000 -d arch/arm/boot/zImage uzImage
		#mmcinit; fatload mmc 0:1 31000000 uzmage; bootm 31000000
		;;
        *)
		echo "usage: $(basename $0) dump | zImage | vmlin | uncompr | orig | ecc ecc"
		;;
esac


