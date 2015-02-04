// gcc -o resetusb resetusb.c -lusb

#include <stdio.h>
#include <string.h>
//#include <sys/io.h>
#include <sys/io.h>
#include <linux/usb.h>

int main(void) {
      struct usb_bus *busses;
      usb_init();
      usb_find_busses();
      usb_find_devices();
      busses = usb_get_busses();
      struct usb_bus *bus;
      int c, i, a;
      /* ... */
      for (bus = busses; bus; bus = bus->next) {
        struct usb_device *dev;
        int val=0;
        usb_dev_handle *junk;
        for (dev = bus->devices; dev; dev = dev->next) {
          char iProduct[1024], bcdDeviceBuf[1024];
          if ((junk = usb_open ( dev )) == NULL) {
              printf("Can't open %p (%s)\n", dev, bcdDeviceBuf );
			}
          else {
//          usb_get_string_simple(junk,1,buf,1023);strcmp(buf,"u")
//          usb_get_string_simple(junk,2,buf,1023);
//            usb_get_string_simple(junk,3,buf,1023);
            if (usb_get_string_simple(junk,dev->descriptor.iProduct, iProduct, sizeof(iProduct)) ) {
            	strcpy(iProduct,"-");
        		}
            if (usb_get_string_simple(junk,dev->descriptor.bcdDevice, bcdDeviceBuf, sizeof(bcdDeviceBuf))<0) {
            	strcpy(bcdDeviceBuf,"-");
            	}
//            usb_get_string_simple(junk,dev->descriptor.iManufacturer, buf, sizeof(buf));
           	//if (strcmp(buf,"u")==0 ) val = usb_reset(junk);
           	//if (dev->descriptor.idProduct==0x5dc ) val = usb_reset(junk);		// reset usbasp
           	if (dev->descriptor.idProduct==0x5e1 ) val = usb_reset(junk);
            printf( "%04X:%04X, %d, "
            		"	bcdDeviceBuf=%s"
            		"	iProduct=%s\n", dev->descriptor.idVendor, dev->descriptor.idProduct, val,
            		bcdDeviceBuf,
            		iProduct );
            }
          usb_close(junk);
        }
      }
}
