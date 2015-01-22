#include <config.h>

#define __REGb(x) (*(volatile unsigned char *)(x))
#define __REGi(x) (*(volatile unsigned int *)(x))
#define NF_BASE  0x4e000000
#define NFCONF  __REGi(NF_BASE + 0x0)
#define NFCMD  __REGb(NF_BASE + 0x4)
#define NFADDR  __REGb(NF_BASE + 0x8)
#define NFDATA  __REGb(NF_BASE + 0xc)
#define NFSTAT  __REGb(NF_BASE + 0x10)

#define BUSY 1
inline void wait_idle(void) {
	    int i;

		    while(!(NFSTAT & BUSY))
				      for(i=0; i<10; i++);
}

#define NAND_SECTOR_SIZE 512
#define NAND_BLOCK_MASK  (NAND_SECTOR_SIZE - 1)

/* low level nand read function */
int
nand_read_ll(unsigned char *buf, unsigned long start_addr, int size)
{
	int i, j;

	if ((start_addr & NAND_BLOCK_MASK) || (size & NAND_BLOCK_MASK)) {
		return -1; /* invalid alignment */
	}

/* chip Enable */
	NFCONF &= ~0x800;
	for(i=0; i<10; i++);

	for(i=start_addr; i < (start_addr + size);) {
/* READ0 */
		NFCMD = 0;

/* Write Address */
		NFADDR = i & 0xff;
		NFADDR = (i >> 9) & 0xff;
		NFADDR = (i >> 17) & 0xff;
		NFADDR = (i >> 25) & 0xff;

		wait_idle();

		for(j=0; j < NAND_SECTOR_SIZE; j++, i++) {
			*buf = (NFDATA & 0xff);
			buf++;
		}
	}

/* chip Disable */
	NFCONF |= 0x800; /* chip disable */

	return 0;
}


