# (C) Copyright 2013
# Gary Jennejohn, DENX Software Engineering, <gj@denx.de>
# David Mueller, ELSOFT AG, <d.mueller@elsoft.ch>
# Adriano Carosso, CxLabs, 
#
# ACER n310 PDA with S3C2440X (ARM920T) cpu
#
#
# N300 has 1 bank of 64 MB DRAM or 128 MB
#
# from 3000'0000 to 3400'0000
#
# Linux-Kernel is expected to be at 3000'8000, entry 3000'8000
# optionally with a ramdisk at 3080'0000
#
# we load ourself to 33F8'0000
#
# download area is 3300'0000
#

#Original smdk2440
#TEXT_BASE = 0x33F80000

# in Start.S we test if we run from flash or RAM comparing current pc to TEXT_BASE */
#TEXT_BASE = 0x30000000
#
#jumps over vector table ?
#TEXT_BASE = 0x30000100	

#TEXT_BASE = ? stack position ?
TEXT_BASE = 0x33F80000

# saw in pudn ...
#TEXT_BASE = 0x31F80000