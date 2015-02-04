This is my studies on Acer-N300 PDA 
Special thaks to blondquirk@gmail.com for his precious work

My final goal is to wipe away windows-ce from this
beatiful platform and use u-boot + linux and angstrom
(then i got an android 2.2 filesystem...)

to load u-boot an harware mod is necessary and a jtag
to usb adapter openocd-compatible

If you don't have good soldering skills, better give up for now :-)

NOTE: the key to avoid jtag and solder is discover internal
format of superipl.nb0 file and use it as u-boot vector when
upgrading n300 firmware.