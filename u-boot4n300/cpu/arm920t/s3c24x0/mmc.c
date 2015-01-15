/*
 * u-boot S3C2410 MMC/SD card driver
 * (C) Copyright 2006 by OpenMoko, Inc.
 * Author: Harald Welte <laforge@openmoko.org>
 *
 * based on u-boot pxa MMC driver and linux/drivers/mmc/s3c2410mci.c
 * (C) 2005-2005 Thomas Kleffel
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */


#include <config.h>
#include <common.h>
#include <asm/arch/gpio.h>
#include <mmc.h>
#include <asm/errno.h>
#include <asm/io.h>
#include <s3c2440.h>
#include <part.h>
#include <fat.h>


#define CONFIG_MMC_WIDE

static S3C2440_SDI *sdi;

static block_dev_desc_t mmc_dev;

block_dev_desc_t * mmc_get_dev(int dev)
{
	return ((block_dev_desc_t *)&mmc_dev);
}

#if defined(CONFIG_MMC) && defined(CONFIG_MMC_S3C)
/*
 * FIXME needs to read cid and csd info to determine block size
 * and other parameters
 */
static uchar mmc_buf[MMC_BLOCK_SIZE];
static mmc_csd_t mmc_csd;
static int mmc_ready = 0;
static int wide = 0;

/* MMC_DEFAULT_RCA should probably be just 1, but this may break other code
   that expects it to be shifted. */
static u_int16_t rca = MMC_DEFAULT_RCA >> 16;

int mmc_init(int verbose) {
 	int retries, rc = -ENODEV;
	int is_sd = 0;
	u_int32_t *resp;
	S3C24X0_CLOCK_POWER * const clk_power = S3C24X0_GetBase_CLOCK_POWER();
	block_dev_desc_t *mmc_blkdev_p = &mmc_dev;

	sdi = S3C2440_GetBase_SDI();

	ulong nPCLK=get_PCLK();
	pr_debug("mmc_init(PCLK=%u)\n", nPCLK);
	
	/*
	*  pin config
	s3c2410_gpio_cfgpin(S3C2410_GPE5, S3C2410_GPE5_SDCLK);
	s3c2410_gpio_cfgpin(S3C2410_GPE6, S3C2410_GPE6_SDCMD);
	s3c2410_gpio_cfgpin(S3C2410_GPE7, S3C2410_GPE7_SDDAT0);
	s3c2410_gpio_cfgpin(S3C2410_GPE8, S3C2410_GPE8_SDDAT1);
	s3c2410_gpio_cfgpin(S3C2410_GPE9, S3C2410_GPE9_SDDAT2);
	s3c2410_gpio_cfgpin(S3C2410_GPE10, S3C2410_GPE10_SDDAT3);
	* power on
	s3c2410_gpio_cfgpin(S3C2410_GPA17, S3C2410_GPIO_OUTPUT);
	s3c2410_gpio_setpin(S3C2410_GPA17, (int)to);
	delay(20000);
	* power off
	s3c2410_gpio_setpin(S3C2410_GPE5, 0);
	s3c2410_gpio_cfgpin(S3C2410_GPE5, S3C2410_GPE5_OUTP);
	*/
	
	// -- linux running data
	//gpio->GPECON = 0xa02aaaaa;			// 0x56000040
	//gpio->GPACON = 0x01fde7ff;			// 0 == output
	//gpio->GPADAT = 0x00041800;			// 0 == output
	//udelay(10000);
	
	
	S3C2440_GPIO_PULLUP (GPEUP_, 6, GPIO_PULLUP_ENABLE);
    S3C2440_GPIO_PULLUP (GPEUP_, 7, GPIO_PULLUP_ENABLE);
    S3C2440_GPIO_PULLUP (GPEUP_, 8, GPIO_PULLUP_ENABLE);
    S3C2440_GPIO_PULLUP (GPEUP_, 9, GPIO_PULLUP_ENABLE);
    S3C2440_GPIO_PULLUP (GPEUP_, 10, GPIO_PULLUP_ENABLE);

    /* Enable special function for SDCMD, SDCLK and SDDAT pins */
    S3C2440_GPIO_CONFIG (GPECON_, 5, GPIO_FUNCTION);
    S3C2440_GPIO_CONFIG (GPECON_, 6, GPIO_FUNCTION);
    S3C2440_GPIO_CONFIG (GPECON_, 7, GPIO_FUNCTION);
    S3C2440_GPIO_CONFIG (GPECON_, 8, GPIO_FUNCTION);
    S3C2440_GPIO_CONFIG (GPECON_, 9, GPIO_FUNCTION);
    S3C2440_GPIO_CONFIG (GPECON_, 10, GPIO_FUNCTION);	
	
	S3C24X0_GPIO * const gpio = S3C24X0_GetBase_GPIO();
	gpio->GPADAT &= ~(1<<17);			// 0x56000000
	//gpio->GPADAT |= (1<<17);
	gpio->GPACON &= ~(1<<17);			// 0 == output
	// see gpio.c -> s3c2410_gpio_cfgpin(S3C2410_GPA17, S3C2410_GPIO_OUTPUT);
	
	sdi->SDICON = S3C2440_SDICON_SDRESET;
	clk_power->CLKCON |= (1 << 9);

	sdi->SDIBSIZE = 512;
	
	//sdi->SDIPRE = 0x05;  /* SDCLK = PCLK / (SDIPRE+1) = 11MHz */
	//int mmc_clk=nPCLK/25000000L - 1;  
	int mmc_clk=nPCLK/15000000L - 1;  
	//int mmc_clk=nPCLK/11000000L - 1;  
	//int mmc_clk=nPCLK/196000L - 1;  
	sdi->SDIPRE = mmc_clk;
	
	sdi->SDIDTIMER = 0x007fffff;
	
	sdi->SDIIMSK = 0x0;
	sdi->SDICON = S3C2410_SDICON_FIFORESET|S3C2410_SDICON_CLOCKTYPE;	
	//sdi->SDICON = S3C2410_SDICON_CLOCKTYPE | S3C2410_SDICON_BYTEORDER;
	//sdi->SDICON = S3C2410_SDICON_CLOCKTYPE;
	
	udelay(125000); /* FIXME: 74 SDCLK cycles */

	mmc_csd.c_size = 0;
	
	/* reset */
	retries = 10;
	resp = mmc_cmd(MMC_CMD_RESET, 0, 0);

	mmc_dev.if_type = IF_TYPE_UNKNOWN;
	pr_debug("Probing for SDHC ...\n");

	/* Send supported voltage range (SD cards 1.x do not answer to CMD8) */
	resp = mmc_cmd(MMC_CMD_IF_COND, ((1 << 8) | 0xAA), CMD_F_RESP_R7);
	if (!resp[0]) {
	  /* ARC: No answer let's try SD 1.x */
	  pr_debug("mmc: No answer to CMD8 trying SD\n");
	  mmc_blkdev_p->if_type = IF_TYPE_SD;
	  }
	else {
	  /* ARC: probably an SDHC card */
	  mmc_blkdev_p->if_type = IF_TYPE_SDHC;
	  pr_debug("mmc: SD 2.0 or later card found\n");

	  /* Check if the card supports this voltage */
	  if (resp[0] != ((1 << 8) | 0xAA)) {
		pr_debug("mmc: Invalid voltage range\n");
		return -ENODEV;
		}
	  }

	/* ARC: HC (30) bit set according to response to CMD8 command */
	pr_debug("mmc: Sending ACMD41 %s HC set\n", ((mmc_blkdev_p->if_type == IF_TYPE_SDHC) ? "with" : "without"));

	printf("trying to detect SD Card...\n");
	while (retries--) {
		udelay(100000);
		resp = mmc_cmd(MMC_CMD_APP_CMD, 0x00000000, CMD_F_RESP);
		resp = mmc_cmd(SD_CMD_APP_SEND_OP_COND, (mmc_blkdev_p->if_type == IF_TYPE_SDHC)? (0x00300000 | (1<<30)) : 0x00300000, CMD_F_RESP);

		if (resp[0] & MMC_IS_SD_CARD) {
		  is_sd = 1;
		  pr_debug("mmc: SD/SDHC Card detected\n");
		  break;
		  }
		}

	/* ARC: check for HC bit, if its not set sd card is SD */
	if (is_sd && (resp[0] & 0xc0000000) == 0x80000000) {
		mmc_dev.if_type = IF_TYPE_SD;
	  }

	if (retries == 0 && !is_sd) {
		retries = 10;
		printf("failed to detect SD Card, trying MMC\n");
		
		mmc_blkdev_p->if_type = IF_TYPE_MMC;
		//sdi->SDIPRE = nPCLK/195000L - 1;		
		sdi->SDICON |= S3C2440_SDICON_MMCCLOCK ;
		
		resp = mmc_cmd(MMC_CMD_SEND_OP_COND, 0x00ffc000, CMD_F_RESP);
		while (retries-- && resp && !(resp[4] & 0x80)) {
			debug("resp %x %x\n", resp[0], resp[1]);
			udelay(50);
			resp = mmc_cmd(MMC_CMD_SEND_OP_COND, 0x00ffff00, CMD_F_RESP);
			}
		}

	/* try to get card id */
	resp = mmc_cmd(MMC_CMD_ALL_SEND_CID, 0, CMD_F_RESP|CMD_F_RESP_LONG);
	if (resp) {
		if (!is_sd) {
			/* TODO configure mmc driver depending on card attributes */
			mmc_cid_t *cid = (mmc_cid_t *)resp;

			if (verbose)
				print_mmc_cid(cid);
			sprintf((char *) mmc_dev.vendor,
				"Man %02x%02x%02x Snr %02x%02x%02x",
				cid->id[0], cid->id[1], cid->id[2],
				cid->sn[0], cid->sn[1], cid->sn[2]);
			sprintf((char *) mmc_dev.product,"%s",cid->name);
			sprintf((char *) mmc_dev.revision,"%x %x",
				cid->hwrev, cid->fwrev);
		}
		else {
			struct sd_cid *cid = (struct sd_cid *) resp;

			if (verbose) print_sd_cid(cid);
			sprintf((char *) mmc_dev.vendor,
			    "Man %02 OEM %c%c \"%c%c%c%c%c\"",
			    cid->mid, cid->oid_0, cid->oid_1,
			    cid->pnm_0, cid->pnm_1, cid->pnm_2, cid->pnm_3,
			    cid->pnm_4);
			sprintf((char *) mmc_dev.product, "%d",
			    cid->psn_0 << 24 | cid->psn_1 << 16 |
			    cid->psn_2 << 8 | cid->psn_3);
			sprintf((char *) mmc_dev.revision, "%d.%d",
			    cid->prv >> 4, cid->prv & 15);
		}

		/* fill in device description */
		if (mmc_dev.if_type == IF_TYPE_UNKNOWN)	mmc_dev.if_type = IF_TYPE_MMC;
		mmc_dev.part_type = PART_TYPE_DOS;
		mmc_dev.dev = 0;
		mmc_dev.lun = 0;
		mmc_dev.type = 0;
		/* FIXME fill in the correct size (is set to 2GByte) */
		mmc_dev.blksz = MMC_BLOCK_SIZE;
		mmc_dev.lba =  0x400000;
		mmc_dev.removable = 0;
		mmc_dev.block_read = mmc_bread;

		/* MMC exists, get CSD too */
		resp = mmc_cmd(SD_CMD_SEND_RELATIVE_ADDR, MMC_DEFAULT_RCA, CMD_F_RESP);
		if (is_sd)
			rca = ((resp[0] & 0xffff0000) >> 16);
			//rca = resp[0] >> 16;

		resp = mmc_cmd(MMC_CMD_SEND_CSD, rca<<16, CMD_F_RESP|CMD_F_RESP_LONG);
		if (resp) {
			mmc_csd_t *csd = (mmc_csd_t *)resp;
			memcpy(&mmc_csd, csd, sizeof(csd));
			rc = 0;
			mmc_ready = 1;
			/* FIXME add verbose printout for csd */
			printf("READ_BL_LEN=%u, C_SIZE_MULT=%u, C_SIZE=%u\n", csd->read_bl_len, csd->c_size_mult1, csd->c_size);
			printf("size = %uMB\n", mmc_size(csd)/1024/1024);
			}
	}

	resp = mmc_cmd(MMC_CMD_SELECT_CARD, rca<<16, CMD_F_RESP);

	if (verbose)
	  printf("SD Card detected RCA: 0x%x type: %s\n",
	              rca, ((mmc_dev.if_type == IF_TYPE_SDHC) ? "SDHC" : ((mmc_dev.if_type == IF_TYPE_SD) ? "SD" : "MMC")));

#ifdef CONFIG_MMC_WIDE
	if (is_sd) {
		resp = mmc_cmd(MMC_CMD_APP_CMD, rca<<16, CMD_F_RESP);
		resp = mmc_cmd(SD_CMD_APP_SET_BUS_WIDTH, 0x02, CMD_F_RESP);
		wide = 1;
	}
#endif

	fat_register_device(&mmc_dev, 1); /* see fs/fat.c - partitions start counting with 1 */

	return rc;
}


u_int32_t *mmc_cmd(ushort opcode, ulong arg, ushort flags) {
	static u_int32_t resp[5];

	u_int32_t ccon, csta;
	u_int32_t csta_rdy_bit = S3C2410_SDICMDSTAT_CMDSENT;

	memset(resp, 0, sizeof(resp));

	#if defined(MMC_DEBUG)
	char sCmd[100]="undef";
	switch (opcode) {
	  case MMC_CMD_RESET:
		sprintf(sCmd,"MMC_CMD_RESET (%u)", opcode);
		break;
	  case MMC_CMD_IF_COND:
		sprintf(sCmd,"MMC_CMD_IF_COND (%u)", opcode);
		break;
	  case SD_CMD_SEND_RELATIVE_ADDR:
		sprintf(sCmd,"SD_CMD_SEND_RELATIVE_ADDR (%u)", opcode);
		break;
	  case MMC_CMD_SEND_CSD:
		sprintf(sCmd,"MMC_CMD_SEND_CSD (%u)", opcode);
		break;		
	  case SD_CMD_APP_SEND_OP_COND:
		sprintf(sCmd,"SD_CMD_APP_SEND_OP_COND (%u)", opcode);
		break;
	  case MMC_CMD_APP_CMD:
		sprintf(sCmd,"MMC_CMD_APP_CMD (%u)", opcode);
		break;
	  case SD_CMD_APP_SET_BUS_WIDTH:
		sprintf(sCmd,"SD_CMD_APP_SET_BUS_WIDTH (%u)", opcode);
		break;
	  case MMC_CMD_ALL_SEND_CID:
		sprintf(sCmd,"MMC_CMD_ALL_SEND_CID (%u)", opcode);
		break;
	  case MMC_CMD_SELECT_CARD:
		sprintf(sCmd,"MMC_CMD_SELECT_CARD (%u)", opcode);
		break;
	  case MMC_CMD_READ_BLOCK:
		sprintf(sCmd,"MMC_CMD_READ_BLOCK (%u)", opcode);
		break;
	  case MMC_CMD_SET_BLOCKLEN:
		sprintf(sCmd,"MMC_CMD_SET_BLOCKLEN (%u)", opcode);
		break;
	  case MMC_CMD_STOP_TRANSMISSION:
		sprintf(sCmd,"MMC_CMD_STOP_TRANSMISSION (%u)", opcode);
		break;
		
	  default:
		sprintf(sCmd,"opcode %u", opcode);
		break;
	  }
	pr_debug("mmc_cmd %s arg=0x%08x flags=%x\n", sCmd, arg, flags);
	#endif
	
	/* resets all registry */
	sdi->SDICSTA = 0xffffffff;
	sdi->SDIDSTA = 0xffffffff;
//	sdi->SDIDSTA = 0xff8;
	sdi->SDIFSTA = 0xffffffff;		// fifo

	sdi->SDICARG = arg;

	ccon = opcode & S3C2410_SDICMDCON_INDEX;
	ccon |= S3C2410_SDICMDCON_SENDERHOST|S3C2410_SDICMDCON_CMDSTART;

	if (flags & CMD_F_RESP) {
	  ccon |= S3C2410_SDICMDCON_WAITRSP;
	  csta_rdy_bit = S3C2410_SDICMDSTAT_RSPFIN; /* 1 << 9 */
	  }

	if (flags & CMD_F_RESP_LONG)
		ccon |= S3C2410_SDICMDCON_LONGRSP;

	sdi->SDICCON = ccon;		// command control

	while (1) {
		csta = sdi->SDICSTA;
		if (csta & csta_rdy_bit) {
		  break;
		  }
		if (csta & S3C2410_SDICMDSTAT_CMDTIMEOUT) {
			printf("csta==0x%08x ---> MMC CMD Timeout\n", csta );
			sdi->SDICSTA |= S3C2410_SDICMDSTAT_CMDTIMEOUT;		//resets TMO bit
			break;
		  }
	  }
	#if defined(MMC_DEBUG)
	csta&=~(S3C2410_SDICMDSTAT_INDEX);
	if (csta & S3C2410_SDICMDSTAT_CRCFAIL) { pr_debug("mmc_csta (0x%08x) S3C2410_SDICMDSTAT_CRCFAIL (0x%08x)\n", csta, S3C2410_SDICMDSTAT_CRCFAIL); }
	if (csta & S3C2410_SDICMDSTAT_CMDSENT)	{ pr_debug("mmc_csta (0x%08x) S3C2410_SDICMDSTAT_CMDSENT (0x%08x)\n", csta, S3C2410_SDICMDSTAT_CMDSENT); }
	if (csta & S3C2410_SDICMDSTAT_CMDTIMEOUT)	{ pr_debug("mmc_csta (0x%08x) S3C2410_SDICMDSTAT_CMDTIMEOUT (0x%08x)\n", csta, S3C2410_SDICMDSTAT_CMDTIMEOUT); }
	if (csta & S3C2410_SDICMDSTAT_RSPFIN) { pr_debug("mmc_csta (0x%08x) S3C2410_SDICMDSTAT_RSPFIN (0x%08x)\n", csta, S3C2410_SDICMDSTAT_RSPFIN); }
	if (csta & S3C2410_SDICMDSTAT_XFERING) { pr_debug("mmc_csta (0x%08x) S3C2410_SDICMDSTAT_XFERING (0x%08x)\n", csta, S3C2410_SDICMDSTAT_XFERING); }
	#endif

	sdi->SDICSTA |= csta_rdy_bit;

	if (flags & CMD_F_RESP) {
		resp[0] = sdi->SDIRSP0;
		resp[1] = sdi->SDIRSP1;
		resp[2] = sdi->SDIRSP2;
		resp[3] = sdi->SDIRSP3;
		#if defined(MMC_DEBUG)
		u_int32_t nTmpresp=resp[0];
		pr_debug("mmc_csta CARD STATUS (0x%08x)\n", nTmpresp);
		if (nTmpresp & MMC_R1_APP_CMD) { pr_debug("		CARD STATUS -> MMC_R1_APP_CMD (0x%08x)\n", MMC_R1_APP_CMD); }
		if (nTmpresp & MMC_R1_READY_FOR_DATA) { pr_debug("		CARD STATUS -> MMC_R1_READY_FOR_DATA (0x%08x)\n", MMC_R1_READY_FOR_DATA); }
		nTmpresp >>= 9; nTmpresp &= 0xF; 
		if (nTmpresp==MMC_R1_CURRENT_STATE_TRAN) { pr_debug("		CARD STATUS -> MMC_R1_CURRENT_STATE_TRAN (0x%1x)\n", nTmpresp); }
		if (nTmpresp==MMC_R1_CURRENT_STATE_DATA) { pr_debug("		CARD STATUS -> MMC_R1_CURRENT_STATE_DATA (0x%1x)\n", nTmpresp); }
		//if (nTmpresp==MMC_R1_CURRENT_STATE_DATA) { pr_debug("		CARD STATUS -> MMC_R1_CURRENT_STATE_DATA (0x%1x)\n", nTmpresp); }
		
		pr_debug("mmc_csta CRC7 (0x%08x)\n", resp[1]);
		pr_debug("mmc_csta resp[2] (0x%08x)\n", resp[2]);
		pr_debug("mmc_csta resp[3] (0x%08x)\n", resp[3]);
		#endif
	}

	return resp;
}

/*
static int mmc_block_multiple_read(uchar *dst, ulong src, ulong len) {
	//if (mmc_dev.if_type==IF_TYPE_SD) 
	  resp = mmc_cmd(MMC_STOP_TRANSMISSION, 0,  MMC_RSP_R1B | MMC_CMD_AC);
}
*/

//WORD width
#define FIFO_FILL_W(host) ((host->SDIFSTA & S3C2410_SDIFSTA_COUNTMASK) >> 2)
//BYTE width
#define FIFO_FILL_B(host) ((host->SDIFSTA & S3C2410_SDIFSTA_COUNTMASK)) 
int mmc_block_read(uchar *dst, ulong src, ulong len) {
	u_int32_t dcon, fifo;	int nRet=0;
	u_int32_t *resp;
	u_int8_t sdipre;
	
	if (len == 0)
		return nRet;

	pr_debug("mmc_block_read if_type %u, dst %lx src %lx len %d\n", mmc_dev.if_type, (ulong)dst, src, len);

	/* set block len */
	resp = mmc_cmd(MMC_CMD_SET_BLOCKLEN, len, CMD_F_RESP);
	sdi->SDIBSIZE = len;

	/*
	#define S3C2440_SDIDCON_DS_BYTE       (0<<22)
	#define S3C2440_SDIDCON_DS_HALFWORD   (1<<22)
	#define S3C2440_SDIDCON_DS_WORD       (2<<22)
	#define S3C2410_SDIDCON_IRQPERIOD     (1<<21)
	#define S3C2410_SDIDCON_TXAFTERRESP   (1<<20)
	#define S3C2410_SDIDCON_RXAFTERCMD    (1<<19)
	#define S3C2410_SDIDCON_BUSYAFTERCMD  (1<<18)
	#define S3C2410_SDIDCON_BLOCKMODE     (1<<17)
	#define S3C2410_SDIDCON_WIDEBUS       (1<<16)
	#define S3C2410_SDIDCON_DMAEN         (1<<15)
	//#define S3C2410_SDIDCON_STOP          (1<<14)
	#define S3C2440_SDIDCON_DATSTART      (1<<14)
	#define S3C2410_SDIDCON_DATMODE	      (3<<12)
	#define S3C2410_SDIDCON_BLKNUM        (0x7ff)
	#define S3C2410_SDIDCON_XFER_READY    (0<<12)
	#define S3C2410_SDIDCON_XFER_CHKSTART (1<<12)
	#define S3C2410_SDIDCON_XFER_RXSTART  (2<<12)
	#define S3C2410_SDIDCON_XFER_TXSTART  (3<<12)
	*/
	
	/* setup SDI Data Control */
	dcon = (len >> 9) & S3C2410_SDIDCON_BLKNUM;
	dcon |= S3C2410_SDIDCON_BLOCKMODE;
	dcon |= S3C2410_SDIDCON_RXAFTERCMD | S3C2410_SDIDCON_XFER_RXSTART;
	if (wide)
		dcon |= S3C2410_SDIDCON_WIDEBUS;
	dcon |= S3C2440_SDIDCON_DS_WORD | S3C2440_SDIDCON_DATSTART;

	sdi->SDIDCON = dcon;
	//sdi->SDIDSTA=0;
	
	src=((mmc_dev.if_type == IF_TYPE_SDHC) ? (src >> 9) : src);
	/* send read command */
	resp = mmc_cmd(MMC_CMD_READ_BLOCK, src, CMD_F_RESP);
	//resp = mmc_cmd(MMC_CMD_READ_BLOCK, 1, CMD_F_RESP);		// CRC Error!!

	ulong nTot=len;
	u_int32_t *dst_u32 = (u_int32_t *)dst;
	while (len > 0) {
		u_int32_t sdidsta = sdi->SDIDSTA;
		fifo = FIFO_FILL_W(sdi);
		if (sdidsta & (S3C2410_SDIDSTA_FIFOFAIL | 
					   S3C2410_SDIDSTA_CRCFAIL | 
					   S3C2410_SDIDSTA_RXCRCFAIL|
					   S3C2410_SDIDSTA_DATATIMEOUT)) {
			printf("mmc_block_read: err SDIDSTA=0x%08x\n", sdidsta);
			return -EIO;
			}
		while (fifo--) {
			//pr_debug("Address = 0x%08x, *dst_u32 = 0x%08x, sdi->SDIDCNT = 0x%04x, FIFO COUNT = 0x%04x\n", nTot-len, *dst_u32, sdi->SDIDCNT, sdi->SDIFSTA & S3C2410_SDIFSTA_COUNTMASK);
			//pr_debug("Address = 0x%08x, *dst_u32 = 0x%08x - %c%c%c%c, sdi->SDIDCNT = 0x%04x, FIFO COUNT = 0x%04x\n", nTot-len, *dst_u32, (char)*dst_u32, (char)*dst_u32>>8, (char)*dst_u32>>16, (char)*dst_u32>>24, sdi->SDIDCNT, sdi->SDIFSTA & S3C2410_SDIFSTA_COUNTMASK);
			//pr_debug("&sdi->SDIDSTA = %p, &sdi->SDIDAT = %p\n", &sdi->SDIDSTA, &sdi->SDIDAT);
			*(dst_u32++) = sdi->SDIDAT;
			if (len >= 4)
				len -= 4;
			else {
				len = 0;
				//sdi->SDIFSTA=S3C2440_SDIFSTA_FIFORESET;
				break;
				}
			}
		}

	  #if defined(MMC_DEBUG)
	  u_int32_t nSdiFsta=sdi->SDIFSTA;
	  pr_debug("mmc_block_read: FIFO STATUS (0x%08x)\n", nSdiFsta);
	  pr_debug("mmc_block_read: FIFO COUNT (0x%08x)\n", nSdiFsta & S3C2410_SDIFSTA_COUNTMASK);
	  
	  //if (nSdiFsta & MMC_R1_APP_CMD) { pr_debug("		CARD STATUS -> MMC_R1_APP_CMD (0x%08x)\n", MMC_R1_APP_CMD); }
	  #endif		
	  
	//sdi->SDIDSTA=0xffffffff;
	#if 0
	pr_debug("waiting for SDIDSTA.XFERFINISH (currently 0x%08x)\n", sdi->SDIDSTA);
	int tmo=3600;
	//while (!(sdi->SDIDSTA & (S3C2410_SDIDSTA_DATATIMEOUT|S3C2410_SDIDSTA_XFERFINISH)) && (tmo-->0)) { 
	while (!(sdi->SDIDSTA & S3C2410_SDIDSTA_XFERFINISH) && (tmo-->0)) { 
	  udelay(1000);
	  //fifo=sdi->SDIDAT;
	  }
	if (tmo) pr_debug("TMO waiting for SDIDSTA.XFERFINISH (currently 0x%08x)\n", sdi->SDIDSTA);

	//sdi->SDIDCON = 0;
	if (!(sdi->SDIDSTA & S3C2410_SDIDSTA_XFERFINISH))
	  { pr_debug("mmc_block_read; transfer not finished!\n"); }
	  //{ pr_debug("mmc_block_read; transfer not finished!\n"); nRet=1; }
	#else
	if (!(sdi->SDIDSTA & S3C2410_SDIDSTA_XFERFINISH)) { 
	  pr_debug("mmc_block_read; transfer not finished!\n"); 
	  sdi->SDIDSTA |= S3C2410_SDIDSTA_XFERFINISH;
	  }
	#endif

	return nRet;
}



static int mmc_block_write(ulong dst, uchar *src, int len) {
	u_int32_t dcon, fifo;
	u_int32_t *resp;

	if (len == 0) {
		return 0;
	}

	/* set block len */
	resp = mmc_cmd(MMC_CMD_SET_BLOCKLEN, len, CMD_F_RESP);
	sdi->SDIBSIZE = len;

	/* set up data control reg */
	dcon = (len >> 9) & S3C2410_SDIDCON_BLKNUM;
	dcon |= S3C2410_SDIDCON_BLOCKMODE;
	dcon |= S3C2410_SDIDCON_TXAFTERRESP|S3C2410_SDIDCON_XFER_TXSTART;
	if (wide) {
		dcon |= S3C2410_SDIDCON_WIDEBUS;
	}
	sdi->SDIDCON = dcon;

	/* send write command */
	resp = mmc_cmd(MMC_CMD_WRITE_BLOCK, dst, CMD_F_RESP);

	while (len > 0) {
		u_int32_t sdidsta = sdi->SDIDSTA;
		u_int32_t sdifsta = sdi->SDIFSTA;

		/* FIFO is available */
		if (sdifsta & S3C2410_SDIFSTA_TFDET) {
			sdi->SDIDAT = *src;

			if (sdidsta & (S3C2410_SDIDSTA_FIFOFAIL|
				S3C2410_SDIDSTA_CRCFAIL|
				S3C2410_SDIDSTA_DATATIMEOUT)) /* sent failed */
			{
				pr_debug("mmc_block_write: err SDIDSTA=0x%08x\n", sdidsta);
				return -1;
			}
			else {	/* sent successfully */
				++src;
				--len;
			}
		}
	}

	//FIXME here can't get the data finish signal
	while (!(sdi->SDIDSTA & S3C2410_SDIDSTA_XFERFINISH)) {}

	if (!(sdi->SDIDSTA & S3C2410_SDIDSTA_XFERFINISH))
		pr_debug("mmc_block_write: transfer not finished!\n");

	sdi->SDIDSTA |= S3C2410_SDIDSTA_XFERFINISH;

	return 0;
  
}


int mmc_read(ulong src, uchar *dst, int size) {
	ulong end, part_start, part_end, part_len, aligned_start, aligned_end;
	ulong mmc_block_size, mmc_block_address;

	if (size == 0)
		return 0;

	if (!mmc_ready) {
		printf("Please initialize the MMC first\n");
		return -1;
	}

	mmc_block_size = MMC_BLOCK_SIZE;
	mmc_block_address = ~(mmc_block_size - 1);

	src -= CFG_MMC_BASE;			// ho my GOD ..
	end = src + size;
	part_start = ~mmc_block_address & src;
	part_end = ~mmc_block_address & end;
	aligned_start = mmc_block_address & src;
	aligned_end = mmc_block_address & end;

	/* all block aligned accesses */
	pr_debug("mmc_read - src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
	src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
	if (part_start) {
		part_len = mmc_block_size - part_start;
		pr_debug("ps src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
		src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
		if ((mmc_block_read(mmc_buf, aligned_start, mmc_block_size)) < 0) {
			pr_debug("mmc_block_read<0 ! ! \n");
			return -1;
			}

		memcpy(dst, mmc_buf+part_start, part_len);
		dst += part_len;
		src += part_len;
	}
	pr_debug("mmc_read - src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
	src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
	for (; src < aligned_end; src += mmc_block_size, dst += mmc_block_size) {
		pr_debug("al src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
		src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
		if ((mmc_block_read((uchar *)(dst), src, mmc_block_size)) < 0)
			return -1;
	}
	pr_debug("mmc_read - src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
	src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
	if (part_end && src < end) {
		pr_debug("pe src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
		src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
		if ((mmc_block_read(mmc_buf, aligned_end, mmc_block_size)) < 0)
			return -1;

		memcpy(dst, mmc_buf, part_end);
	}
	
	#if defined(MMC_DEBUG)
	int i;
	for (i=0; i<size-4; i=i+4) {
	  pr_debug("i 0x%04x %02x %02x %02x %02x\n", i, *(dst+i), *(dst+i+1), *(dst+i+2), *(dst+i+3) );
	  
	  }
	#endif
	return 0;
}

int mmc_write(uchar *src, ulong dst, int size)
{
	ulong end, part_start, part_end, part_len, aligned_start, aligned_end;
	ulong mmc_block_size, mmc_block_address;

	if (size == 0)
		return 0;

	if (!mmc_ready) {
		printf("Please initialize the MMC first\n");
		return -1;
	}

	mmc_block_size = MMC_BLOCK_SIZE;
	mmc_block_address = ~(mmc_block_size - 1);

	dst -= CFG_MMC_BASE;
	end = dst + size;
	part_start = ~mmc_block_address & dst;
	part_end = ~mmc_block_address & end;
	aligned_start = mmc_block_address & dst;
	aligned_end = mmc_block_address & end;

	/* all block aligned accesses */
	pr_debug("src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
	src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
	if (part_start) {
		part_len = mmc_block_size - part_start;
		pr_debug("ps src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
		(ulong)src, dst, end, part_start, part_end, aligned_start, aligned_end);
		if ((mmc_block_read(mmc_buf, aligned_start, mmc_block_size)) < 0)
			return -1;

		memcpy(mmc_buf+part_start, src, part_len);
		if ((mmc_block_write(aligned_start, mmc_buf, mmc_block_size)) < 0)
			return -1;

		dst += part_len;
		src += part_len;
	}
	pr_debug("src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
	src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
	for (; dst < aligned_end; src += mmc_block_size, dst += mmc_block_size) {
		pr_debug("al src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
		src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
		if ((mmc_block_write(dst, (uchar *)src, mmc_block_size)) < 0)
			return -1;

	}
	pr_debug("src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
	src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
	if (part_end && dst < end) {
		pr_debug("pe src %lx dst %lx end %lx pstart %lx pend %lx astart %lx aend %lx\n",
		src, (ulong)dst, end, part_start, part_end, aligned_start, aligned_end);
		if ((mmc_block_read(mmc_buf, aligned_end, mmc_block_size)) < 0)
			return -1;

		memcpy(mmc_buf, src, part_end);
		if ((mmc_block_write(aligned_end, mmc_buf, mmc_block_size)) < 0)
			return -1;

	}
	return 0;
}

ulong mmc_bread(int dev_num, ulong blknr, ulong blkcnt, void *dst) {
	int mmc_block_size = MMC_BLOCK_SIZE;
	ulong src = blknr * mmc_block_size + CFG_MMC_BASE;

	pr_debug("mmc_bread - src = 0x%08x, blknr = 0x%08x, blkcnt = 0x%08x\n", src, blknr, blkcnt);
	mmc_read(src, dst, blkcnt* mmc_block_size);
	return blkcnt;
}

u_int32_t mmc_size(const struct mmc_csd *csd) {
	u_int32_t block_len, mult, blocknr;

	block_len = csd->read_bl_len << 12;
	mult = csd->c_size_mult1 << 8;
	blocknr = (csd->c_size+1) * mult;

	return blocknr * block_len;
}

void print_mmc_cid(mmc_cid_t *cid) {
	printf("MMC found. Card description is:\n");
	printf("Manufacturer ID = %02x%02x%02x\n",
		cid->id[0], cid->id[1], cid->id[2]);
	printf("HW/FW Revision = %x %x\n",cid->hwrev, cid->fwrev);
	cid->hwrev = cid->fwrev = 0;	/* null terminate string */
	printf("Product Name = %s\n",cid->name);
	printf("Serial Number = %02x%02x%02x\n",
		cid->sn[0], cid->sn[1], cid->sn[2]);
	printf("Month = %d\n",cid->month);
	printf("Year = %d\n",1997 + cid->year);
}

void print_sd_cid(const struct sd_cid *cid){
	printf("Manufacturer:       0x%02x, OEM \"%c%c\"\n",
	    cid->mid, cid->oid_0, cid->oid_1);
	printf("Product name:       \"%c%c%c%c%c\", revision %d.%d\n",
	    cid->pnm_0, cid->pnm_1, cid->pnm_2, cid->pnm_3, cid->pnm_4,
	    cid->prv >> 4, cid->prv & 15);
	printf("Serial number:      %u\n",
	    cid->psn_0 << 24 | cid->psn_1 << 16 | cid->psn_2 << 8 |
	    cid->psn_3);
	printf("Manufacturing date: %d/%d\n",
	    cid->mdt_1 & 15,
	    2000+((cid->mdt_0 & 15) << 4)+((cid->mdt_1 & 0xf0) >> 4));
	printf("CRC:                0x%02x, b0 = %d\n",
	    cid->crc >> 1, cid->crc & 1);
}

int mmc_ident(block_dev_desc_t *dev) {
	//resp = mmc_cmd(MMC_CMD_APP_CMD, rca<<16, CMD_F_RESP);
	//resp = mmc_cmd(MMC_CMD_SEND_STATUS, rca<<16, CMD_F_RESP);
	return 0;
}

int mmc2info(ulong addr) {
	/* FIXME hard codes to 32 MB device */
	if (addr >= CFG_MMC_BASE && addr < CFG_MMC_BASE + 0x02000000)
		return 1;

	return 0;
}

#endif	/* defined(CONFIG_MMC) && defined(CONFIG_MMC_S3C) */
