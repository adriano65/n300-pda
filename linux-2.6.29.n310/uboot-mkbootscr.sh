#!/bin/bash
./mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "boot_scr" -d boot.cmd boot.scr
