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
#include <mmc.h>
#include <asm/errno.h>
#include <asm/io.h>
#include <s3c2440.h>
#include <part.h>
#include <fat.h>

#ifdef CONFIG_MMC

//#define CONFIG_MMC_WIDE

static S3C2440_SDI *sdi;
static block_dev_desc_t mmc_dev;
static u_int16_t rca = MMC_DEFAULT_RCA >> 16;
static int debug=0;

block_dev_desc_t * mmc_get_dev(int dev)
{
	return ((block_dev_desc_t *)&mmc_dev);
}

/*
 * FIXME needs to read cid and csd info to determine block size
 * and other parameters
 */
static uchar mmc_buf[MMC_BLOCK_SIZE];
static mmc_csd_t mmc_csd;
static int mmc_ready = 0;
static int wide = 0;


#define CMD_F_RESP	0x01
#define CMD_F_RESP_LONG	0x02

u_int32_t *mmc_cmd(ushort cmd, ulong arg, ushort flags)
{
	static u_int32_t resp[5];

	u_int32_t ccon, csta;
	u_int32_t csta_rdy_bit = S3C2410_SDICMDSTAT_CMDSENT;

	memset(resp, 0, sizeof(resp));

	sdi->SDICSTA = 0xffffffff;   //command statue reg
	sdi->SDIDSTA = 0xffffffff;   //data status reg
	sdi->SDIFSTA = 0xffffffff;   //fifo status reg

	sdi->SDICARG = arg;          //command argument reg

	ccon = cmd & S3C2410_SDICMDCON_INDEX;
	ccon |= S3C2410_SDICMDCON_SENDERHOST|S3C2410_SDICMDCON_CMDSTART;

	if (flags & CMD_F_RESP) {    //if receive resporse
		ccon |= S3C2410_SDICMDCON_WAITRSP;
		csta_rdy_bit = S3C2410_SDICMDSTAT_RSPFIN; /* 1 << 9 */
	}

	if (flags & CMD_F_RESP_LONG)
		ccon |= S3C2410_SDICMDCON_LONGRSP;

	sdi->SDICCON = ccon;

	while (1) {
		csta = sdi->SDICSTA;
		if (csta & csta_rdy_bit)
			break;
		if (csta & S3C2410_SDICMDSTAT_CMDTIMEOUT) {
			if(debug)
				printf("===============> MMC CMD Timeout\n");
			sdi->SDICSTA |= S3C2410_SDICMDSTAT_CMDTIMEOUT;
			break;
		}
	}

	sdi->SDICSTA |= csta_rdy_bit;  //reset SDICSTA ready bit

	if (flags & CMD_F_RESP) {
		resp[0] = sdi->SDIRSP0;
		resp[1] = sdi->SDIRSP1;
		resp[2] = sdi->SDIRSP2;
		resp[3] = sdi->SDIRSP3;
	}

	return resp;
}

//#define FIFO_FILL(host) ((host->SDIFSTA & S3C2410_SDIFSTA_COUNTMASK) >> 2)  //WORD width
#define FIFO_FILL(host) ((host->SDIFSTA & S3C2410_SDIFSTA_COUNTMASK))    //BYTE width

int mmc_block_read(uchar *dst, ulong src, ulong len)
{
	u_int32_t dcon, fifo;
	uchar *dst1 = dst;
	//u_int32_t *dst_u32 = (u_int32_t *)dst;
	u_int32_t *resp;
	u_int8_t sdipre;

	if (len == 0)
		return 0;

	/* set block len */
	resp = mmc_cmd(MMC_CMD_SET_BLOCKLEN, len, CMD_F_RESP);
	sdi->SDIBSIZE = len;

	//setup data reg
	dcon = (len >> 9) & S3C2410_SDIDCON_BLKNUM;
	dcon |= S3C2410_SDIDCON_BLOCKMODE;
	dcon |= S3C2410_SDIDCON_RXAFTERCMD|S3C2410_SDIDCON_XFER_RXSTART;
	if (wide)
		dcon |= S3C2410_SDIDCON_WIDEBUS;
	dcon |= S3C2440_SDIDCON_DS_WORD | S3C2440_SDIDCON_DATSTART;
	sdi->SDIDCON = dcon;

	//send read cmd
	resp = mmc_cmd(MMC_CMD_READ_BLOCK, src, CMD_F_RESP);

	while (len > 0) {
		u_int32_t sdidsta = sdi->SDIDSTA;
		fifo = FIFO_FILL(sdi);
		if (sdidsta & (S3C2410_SDIDSTA_FIFOFAIL|
				S3C2410_SDIDSTA_CRCFAIL|
				S3C2410_SDIDSTA_RXCRCFAIL|
				S3C2410_SDIDSTA_DATATIMEOUT)) 
		{
			/* see s3c2410 manual page 19-16,
			   modified for 2GB and larger sd card*/
			sdipre = sdi->SDIPRE;
			/* SDCLK = PCLK/2 / (SDIPRE+1) = 25MHz,
			   not Real-timeout error */
			if (sdipre == 0) {
				/* stop TRANSMISSION */
				mmc_cmd(MMC_CMD_STOP_TRANSMISSION, 0, CMD_F_RESP);
				/* SDCLK = PCLK/2 / (SDIPRE+1) = 600KHz */
				sdi->SDIPRE == 42;
				/* retry */
				mmc_cmd(MMC_CMD_READ_BLOCK, src, CMD_F_RESP);
				continue;
			}
			else	/* Real-timeout error */
			{
				if(debug)
					printf("mmc_block_read: err SDIDSTA=0x%08x\n", sdidsta);
				return -EIO;
			}
		}
		while (fifo--) {
			//*(dst_u32++) = sdi->SDIDAT;
			*(dst1++) = (uchar)sdi->SDIDAT;
			if (len >= 1)
				len -= 1;
			else {
				len = 0;
				break;
			}
		}
	}
	//FIXME here can't get the data finish signal
	//while (!(sdi->SDIDSTA & S3C2410_SDIDSTA_XFERFINISH)) {}
	//sdi->SDIDSTA |= S3C2410_SDIDSTA_XFERFINISH;
	
	sdi->SDIDCON = 0;

	if (!(sdi->SDIDSTA & S3C2410_SDIDSTA_XFERFINISH))
		debug("mmc_block_read: transfer not finished!\n");

	return 0;
}

/* add block write function date:2009-3-19*/
static int mmc_block_write(ulong dst, uchar *src, int len)
{
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

		/* FIFO is avalible */
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


int mmc_read(ulong src, uchar *dst, int size)
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

	src -= CFG_MMC_BASE;
	end = src + size;
	part_start = ~mmc_block_address & src;
	part_end = ~mmc_block_address & end;
	aligned_start = mmc_block_address & src;
	aligned_end = mmc_block_address & end;

	/* all block aligned accesses */
	if (part_start) {
		part_len = mmc_block_size - part_start;
		if ((mmc_block_read(mmc_buf, aligned_start, mmc_block_size)) < 0)
			return -1;

		memcpy(dst, mmc_buf+part_start, part_len);
		dst += part_len;
		src += part_len;
	}
	for (; src < aligned_end; src += mmc_block_size, dst += mmc_block_size) {
		if ((mmc_block_read((uchar *)(dst), src, mmc_block_size)) < 0)
			return -1;
	}
	if (part_end && src < end) {
		if ((mmc_block_read(mmc_buf, aligned_end, mmc_block_size)) < 0)
			return -1;

		memcpy(dst, mmc_buf, part_end);
	}
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
	if (part_start) {
		part_len = mmc_block_size - part_start;
		if ((mmc_block_read(mmc_buf, aligned_start, mmc_block_size)) < 0)
			return -1;

		memcpy(mmc_buf+part_start, src, part_len);
		if ((mmc_block_write(aligned_start, mmc_buf, mmc_block_size)) < 0)
			return -1;

		dst += part_len;
		src += part_len;
	}
	for (; dst < aligned_end; src += mmc_block_size, dst += mmc_block_size) {
		if ((mmc_block_write(dst, (uchar *)src, mmc_block_size)) < 0)
			return -1;

	}
	if (part_end && dst < end) {
		if ((mmc_block_read(mmc_buf, aligned_end, mmc_block_size)) < 0)
			return -1;

		memcpy(mmc_buf, src, part_end);
		if ((mmc_block_write(aligned_end, mmc_buf, mmc_block_size)) < 0)
			return -1;

	}
	return 0;
}

ulong mmc_bread(int dev_num, ulong blknr, ulong blkcnt, void *dst)
{
	int mmc_block_size = MMC_BLOCK_SIZE;
	ulong src = blknr * mmc_block_size + CFG_MMC_BASE;

	mmc_read(src, dst, blkcnt*mmc_block_size);
	return blkcnt;
}

/* MMC_DEFAULT_RCA should probably be just 1, but this may break other code
   that expects it to be shifted. */
//static u_int16_t rca = MMC_DEFAULT_RCA >> 16;

u_int32_t mmc_size(const struct mmc_csd *csd)
{
	u_int32_t block_len, mult, blocknr;

	block_len = csd->read_bl_len << 12;
	mult = csd->c_size_mult1 << 8;
	blocknr = (csd->c_size+1) * mult;

	return blocknr * block_len;
}

void print_mmc_cid(mmc_cid_t *cid)
{
	printf("MMC found. Card desciption is:\n");
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

void print_sd_cid(const struct sd_cid *cid)
{
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

int mmc_init(int verbose)
{
 	int retries, rc = -ENODEV;
	int is_sd = 0;
	u_int32_t *resp;
	S3C24X0_CLOCK_POWER * const clk_power = S3C24X0_GetBase_CLOCK_POWER();   //get CLOCK reg addr

	debug = verbose;  //whether print debug info
	sdi = S3C2440_GetBase_SDI();     //get SDI reg addr

	//PCLK=FCLK/4=202.8/4=50.7MHz
	if(verbose)
		printf("mmc_init(PCLK=%u)\n", get_PCLK());

	clk_power->CLKCON |= (1 << 9);   //SDI enable

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
	
	
	
	/* S3C2410 has some bug that prevents reliable operation at higher speed */
	//sdi->SDIPRE = 0x3e;  /* SDCLK = PCLK/2 / (SDIPRE+1) = 396kHz */
	//sdi->SDIPRE = 0x02;  /* SDCLK = PCLK/2 / (SDIPRE+1) = 16.9MHz */
	sdi->SDIPRE = 0x0;  /* SDCLK = PCLK/2 / (SDIPRE+1) = 25MHz */
	sdi->SDIBSIZE = 512;      //SDI block size reg
	sdi->SDIDTIMER = 0xffff;  //Data/Busy timeout reg
	sdi->SDIIMSK = 0x0;       //SDI interrupt mask reg
	sdi->SDICON = S3C2410_SDICON_FIFORESET|S3C2410_SDICON_BYTEORDER;//|S3C2410_SDICON_CLOCKTYPE;
	udelay(500); /* FIXME: 74 SDCLK cycles */

	mmc_csd.c_size = 0;

	/* reset */
	retries = 10;
	resp = mmc_cmd(MMC_CMD_RESET, 0, 0);
	
	if(verbose)
		printf("trying to detect SD Card...\n");
	while (retries--) {
		udelay(1000);
		resp = mmc_cmd(55, 0x00000000, CMD_F_RESP);
		resp = mmc_cmd(41, 0x00300000, CMD_F_RESP); //ask card to send its oprating condition reg(OCR)

		if (resp[0] & (1 << 31)) {
			is_sd = 1;
			break;
		}
	}

	if (retries == 0 && !is_sd) {  //detect MMC card
		retries = 10;
		if(verbose)
			printf("failed to detect SD Card, trying MMC\n");
		resp = mmc_cmd(MMC_CMD_SEND_OP_COND, 0x00ffc000, CMD_F_RESP);
		while (retries-- && resp && !(resp[4] & 0x80)) {
			udelay(50);
			resp = mmc_cmd(1, 0x00ffff00, CMD_F_RESP);
		}
	}

	/* try to get card id */
	resp = mmc_cmd(MMC_CMD_ALL_SEND_CID, 0, CMD_F_RESP|CMD_F_RESP_LONG);
	if (resp) {
		if (!is_sd) {  //mmc card
			/* TODO configure mmc driver depending on card
			   attributes */
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
		else {  //sd card
			struct sd_cid *cid = (struct sd_cid *) resp;

			rc=0;
			if (verbose)
				print_sd_cid(cid);
			else  //print during boot
				printf("SD card found:SN %u\n",cid->psn_0<<24|cid->psn_1<<16|cid->psn_2<<8|cid->psn_3);
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
		mmc_dev.if_type = IF_TYPE_MMC;
		mmc_dev.part_type = PART_TYPE_DOS;
		mmc_dev.dev = 0;
		mmc_dev.lun = 0;
		mmc_dev.type = 0;
		/* FIXME fill in the correct size (is set to 1GB) */
		mmc_dev.blksz = 512;
		mmc_dev.lba = 0x200000;
		mmc_dev.removable = 0;
		mmc_dev.block_read = mmc_bread;

		/* MMC exists, get CSD too */
		resp = mmc_cmd(SD_CMD_SEND_RELATIVE_ADDR, MMC_DEFAULT_RCA, CMD_F_RESP);
		if (is_sd)
			rca = resp[0] >> 16;

		resp = mmc_cmd(MMC_CMD_SEND_CSD, rca<<16, CMD_F_RESP|CMD_F_RESP_LONG);
		if (resp) {
			mmc_csd_t *csd = (mmc_csd_t *)resp;
			memcpy(&mmc_csd, csd, sizeof(csd));
			//rc = 0;
			mmc_ready = 1;
			if(verbose)
			{
				printf("READ_BL_LEN=%u, C_SIZE_MULT=%u, C_SIZE=%u\n",
					csd->read_bl_len, csd->c_size_mult1, csd->c_size);
				printf("size = %u\n", mmc_size(csd));
			}
		}
	}

	resp = mmc_cmd(MMC_CMD_SELECT_CARD, rca<<16, CMD_F_RESP);

#ifdef CONFIG_MMC_WIDE
	if (is_sd) {
		resp = mmc_cmd(55, rca<<16, CMD_F_RESP);
		resp = mmc_cmd(6, 0x02, CMD_F_RESP);
		wide = 1;
	}
#endif

	fat_register_device(&mmc_dev,1); /* partitions start counting with 1 */
	
	return rc;
}

int
mmc_ident(block_dev_desc_t *dev)
{
	return 0;
}

int
mmc2info(ulong addr)
{
	/* FIXME hard codes to 1 GB device */
	if (addr >= CFG_MMC_BASE && addr < CFG_MMC_BASE + 0x40000000)
		return 1;

	return 0;
}

#endif	/* CONFIG_MMC */
