//#include <config.h>
#include <common.h>
#include <s3c2440.h>


#define __REGb(x) (*(volatile unsigned char *)(x))
#define __REGi(x) (*(volatile unsigned int *)(x))

#define NFCONF          __REGi(S3C2440_NAND_BASE + 0x0)
#define NFCONT          __REGi(S3C2440_NAND_BASE + 0x4)
#define NFCMD           __REGb(S3C2440_NAND_BASE + 0x8)
#define NFADDR          __REGb(S3C2440_NAND_BASE + 0xC)
#define NFDATA          __REGb(S3C2440_NAND_BASE + 0x10)
#define NFSTAT          __REGb(S3C2440_NAND_BASE + 0x20)

#define NAND_CHIP_ENABLE  (NFCONT &= ~(1<<1))
#define NAND_CHIP_DISABLE (NFCONT |=  (1<<1))
#define NAND_CLEAR_RB     (NFSTAT |=  (1<<2))
#define NAND_DETECT_RB    { while(! (NFSTAT&(1<<2)) );}

#define BUSY 4
inline void wait_idle(void) {
        while(!(NFSTAT & BUSY));
        NFSTAT |= BUSY;
}

#define NAND_SECTOR_SIZE        512
#define NAND_BLOCK_MASK         (NAND_SECTOR_SIZE - 1)

/* low level nand read function */
int
nand_read_ll(unsigned char *buf, unsigned long start_addr, int size)
{
	int i, j;

	if ((start_addr & NAND_BLOCK_MASK) || (size & NAND_BLOCK_MASK)) {
		return -1; /* invalid alignment */
	}

       NAND_CHIP_ENABLE;

	      for(i=start_addr; i < (start_addr + size);) {
                /* READ0 */
                NAND_CLEAR_RB;
                NFCMD = 0;

                /* Write Address */
                NFADDR = i & 0xff;
                NFADDR = (i >> 9) & 0xff;
                NFADDR = (i >> 17) & 0xff;
                NFADDR = (i >> 25) & 0xff;

                NAND_DETECT_RB;

                for(j=0; j < NAND_SECTOR_SIZE; j++, i++) {
                        *buf = (NFDATA & 0xff);
                        buf++;
                }
        }
        NAND_CHIP_DISABLE;
        return 0;

}


