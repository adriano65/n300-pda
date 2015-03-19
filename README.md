This is my studies on Acer-N300 PDA 
Special thaks to blondquirk@gmail.com for his precious work

My final goal is to completely substitute windows-ce from this
beatiful platform and use u-boot + linux and angstrom root filesystem
(then i got an android 2.2 filesystem...)

Instructions:
1) Prepare an SD with three formatted partitions (first MUST be FAT32 type, swap adn ext3)
2) Copy the kernel images in first partition
3) Boot normally then launch haret.exe from SD (first partition) 
4) When the linux-system is up, log in as root
5) launch - flashcp /boot/u-boot.nand-64M-300M-2 /dev/mtd0

If you don't have good soldering skills, better give up for now :-)

