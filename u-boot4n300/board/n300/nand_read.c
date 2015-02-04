
//#include <config.h>
#include <common.h>
#include <s3c2440.h>
//#include <linux/mtd/nand_legacy.h>
#ifdef NAND_LLREAD_DEBUG
        #define DPRINTK(ARGS...)  printf("<%s>: ",__FUNCTION__);printf(ARGS)
#else
        #define DPRINTK( x... )
#endif

#define NAND_BLOCK_MASK         (SECTORSIZE - 1)	/* BE CAREFUL: See board/n300/nand_read.c */

#define __REGb(x) (*(volatile unsigned char *)(x))
#define __REGi(x) (*(volatile unsigned int *)(x))

#define NFCONF          __REGi(S3C2440_NAND_BASE + 0x0)
#define NFCONT          __REGi(S3C2440_NAND_BASE + 0x4)
#define NFCMD           __REGb(S3C2440_NAND_BASE + 0x8)
#define NFADDR          __REGb(S3C2440_NAND_BASE + 0xC)
#define NFDATA          __REGb(S3C2440_NAND_BASE + 0x10)
#define NFSTAT          __REGb(S3C2440_NAND_BASE + 0x20)

#define NF_nCE_LOW  	(NFCONT &= ~(1<<1))
#define NF_nCE_HIGH		(NFCONT |=  (1<<1))

/*
#define BUSY 4
inline void wait_idle(void) {
        while(!(NFSTAT & BUSY));
        NFSTAT |= BUSY;
}
*/

/*-----------------------------------------------------------------------
 * NAND and environment organization
 * 
 * SAMSUNG - K9F1208U0G		- 64M
 * SAMSUNG - K9F1G08U0M		- 128M
 * s3c2440-nand s3c2440-nand: NF_CONF is 0xb510
 */

/* low level nand read function */
#ifdef K9F1208U0G
	#define NAND_CLEAR_RB   (NFSTAT |=  (1<<2))
	#define NAND_DETECT_RB  { while(! (NFSTAT&(1<<2)) );}
int nand_read_ll(unsigned char *buf, unsigned long start_addr, int size) {
	int i, j;

	if ((start_addr & NAND_BLOCK_MASK) || (size & NAND_BLOCK_MASK)) {
		return -1; /* invalid alignment */
	  }

	NF_nCE_LOW;
	for(i=start_addr; i < (start_addr + size);) {
		NAND_CLEAR_RB;
		NFCMD = 0;		//NAND_CMD_READ0;
		/* Write Address */
		NFADDR = i & 0xff;
		NFADDR = (i >> 9) & 0xff;
		NFADDR = (i >> 17) & 0xff;
		NFADDR = (i >> 25) & 0xff;

		NAND_DETECT_RB;

		for(j=0; j < SECTORSIZE; j++, i++) {
				*buf = (NFDATA & 0xff);
				buf++;
			}
		}
	NF_nCE_HIGH;
	return 0;
}

#else
	#include <linux/mtd/nand.h>

	//#define NAND_CLEAR_RB   (NFSTAT |=  (1<<2))
	//#define NAND_DETECT_RB  { while(! (NFSTAT&(1<<2)) );}
	
	#define NAND_WAIT_RB  { while(! (NFSTAT & (1<<0)) );}
	
int nand_read_ll(unsigned char *buf, unsigned long start_addr, int size) {
	int i, j;

	DPRINTK("\n");	
	if ((start_addr & NAND_BLOCK_MASK) || (size & NAND_BLOCK_MASK)) {
	puts("invalid alignment\n");
		return -1;
		}

	NF_nCE_LOW;
	//NFCMD = 0xFF;		// Reset Command
	//NAND_WAIT_RB;		

	DPRINTK("start_addr 0x%08x, size 0x%08x, SECTORSIZE 0x%08x\n", start_addr, size, SECTORSIZE);	
	for(i=start_addr; i < (start_addr + size); ) {
		NFCMD = NAND_CMD_READ0;
		NAND_WAIT_RB;		
		//DPRINTK("NAND_CMD_READ0 ( NFCMD == 0x%08x)\n", NFCMD);
		/* Write Address */
		NFADDR = i & 0xff;
		NFADDR = (i >> 9) & 0xff;
		NFADDR = (i >> 17) & 0xff;
		NFADDR = (i >> 25) & 0xff;
		
		NFCMD = NAND_CMD_READSTART;
		NAND_WAIT_RB;		
		
		for(j=0; j < SECTORSIZE; j++, i++) {
			*buf = (NFDATA & 0xff);
			buf++;
			NAND_WAIT_RB;
			}
		}
		
	NF_nCE_HIGH;
	//buf[4]=0xAA;
	return 0;
}
#endif


