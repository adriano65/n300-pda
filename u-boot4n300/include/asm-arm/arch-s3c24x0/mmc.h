/*
 *  linux/drivers/mmc/mmc_pxa.h
 *
 *  Author: Vladimir Shebordaev, Igor Oblakov
 *  Copyright:  MontaVista Software Inc.
 *
 *  $Id: mmc_pxa.h,v 0.3.1.6 2002/09/25 19:25:48 ted Exp ted $
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2 as
 *  published by the Free Software Foundation.
 */
#ifndef __MMC_S3C_H__
#define __MMC_S3C_H__
#include <asm/arch/regs-sdi.h>


#define CMD_F_RESP		0x01
#define CMD_F_RESP_LONG	0x02

#define CMD_F_RESP_R7 CMD_F_RESP


  //#define MMC_DEBUG

  #if defined(MMC_DEBUG)
  #define pr_debug(fmt, args...) printf(fmt, ##args)
  
/*  
SD-Card  : 0x01 "PA" "      Panasonic16M" bl  512 sz    14909440 Class(0) CCC 135
SD-Card  : 0x03 "SD" "        Sandisk32M" bl  512 sz    30605312 Class(0) CCC 135
SD-Card  : 0x03 "SD" "          Canon32M" bl  512 sz    30605312 Class(0) CCC 1f5
SD-Card  : 0x02 "TM" "        Toshiba32M" bl  512 sz    30605312 Class(0) CCC 135
SD-Card  : 0x02 "TM" "        Toshiba64M" bl  512 sz    61997056 Class(0) CCC 135
MMC-Card : 0x01 "  " " ExtremeMemory128M" bl  512 sz   128450560 Class(0) CCC 0ff
SD-Card  : 0x06 "RK" "   UnlabeledSD128M" bl  512 sz   127401984 Class(0) CCC 5f5
SD-Card  : 0x31 "SP" "  SiliconPower128M" bl  512 sz   127139840 Class(0) CCC 5b5
SD-Card  : 0x18 "IN" "      Kingston128M" bl  512 sz   125698048 Class(0) CCC 175
SD-Card  : 0x06 "RK" "          Fuji128M" bl  512 sz   126091264 Class(0) CCC 5f5
SD-Card  : 0x18 "IN" "        Ultron256M" bl  512 sz   253362176 Class(0) CCC 135
SD-Card  : 0x02 "TM" "      Verbatim256M" bl  512 sz   255066112 Class(0) CCC 1b5
SD-Card  : 0x06 "RK" "          Fuji256M" bl  512 sz   254279680 Class(0) CCC 5b5
SD-Card  : 0x01 "PA" "      Kingston256M" bl  512 sz   250085376 Class(0) CCC 135
SD-Card  : 0x11 "D " "           PNY256M" bl  512 sz   255852544 Class(0) CCC 5f5
SD-Card  : 0x02 "TM" "         White256M" bl  512 sz   258211840 Class(0) CCC 1b5
SD-Card  : 0x27 "PH" " ExtermeMemory512M" bl  512 sz   509083648 Class(0) CCC 5f5
SD-Card  : 0x02 "TM" "     Unlabeled512M" bl  512 sz   517734400 Class(0) CCC 1b5
SD-Card  : 0x02 "TM" "           PNY512M" bl  512 sz   512229376 Class(0) CCC 1b5
SD-Card  : 0x02 "TM" "      Kingston512M" bl  512 sz   512229376 Class(0) CCC 1b5
SD-Card  : 0x06 "RK" "          Fuji512M" bl  512 sz   502005760 Class(0) CCC 5f5
SD-Card  : 0x27 "  " "    Kingston1G.bad" bl  512 sz  1018167296 Class(0) CCC 175
SD-Card  : 0x1f "SK" "        Kingston1G" bl  512 sz  1021575168 Class(0) CCC 5f5
SD-Card  : 0x01 "PA" "      Kingston1G_2" bl  512 sz   990904320 Class(0) CCC 135
SD-Card  : 0x1d "AD" "         Corsair1G" bl  512 sz  1023934464 Class(0) CCC 5f5
SD-Card  : 0x02 "TM" "         Toshiba1G" bl  512 sz  1030225920 Class(0) CCC 5b5
SD-Card  : 0x1b "SM" "   TranscendMini1G" bl  512 sz  1004535808 Class(0) CCC 5f5
SD-Card  : 0x03 "SD" "    SandiskMicro1G" bl  512 sz  1015808000 Class(2) CCC 5f5
SD-Card  : 0x1b "SM" "               X2G" bl 1024 sz  2007498752 Class(0) CCC 5f5
SD-Card  : 0x30 "PR" "      Platinum4G_1" bl 2048 sz  3963617280 Class(0) CCC 5f5
SD-Card  : 0x19 "DY" "      Platinum4G_2" bl 2048 sz  4006608896 Class(0) CCC 5f5
SD-Card  : 0x1c "SV" "      Transcend4GB" bl 2048 sz  4116709376 Class(0) CCC 5f5
SD-Card  : 0x27 "PH" "       CNMemory4GB" bl 2048 sz  4114612224 Class(0) CCC 5f5
SDHC-Card: 0x1d "AD" "      Corsair4G_HC" bl  512 sz  4062707712 Class(2) CCC 5b5
SDHC-Card: 0x02 "TM" "      Toshiba4G_HC" bl  512 sz  4026531840 Class(4) CCC 5b5
SDHC-Card: 0x1c "SV" "    Transcend4G_HC" bl  512 sz  4062707712 Class(6) CCC 5b5
SDHC-Card: 0x41 "42" "     Kingston4G_HC" bl  512 sz  4089446400 Class(4) CCC 5b5
SDHC-Card: 0x1c "SV" "    Transcend8G_HC" bl  512 sz  8092385280 Class(2) CCC 5b5
SDHC-Card: 0x27 "PH" "         Hama8G_HC" bl  512 sz  8195670016 Class(2) CCC 5b5
SDHC-Card: 0x1d "AD" "        Adata8G_HC" bl  512 sz  8092385280 Class(2) CCC 5b5
*/
  
  
  
  #else
  #define pr_debug(...) do { } while(0)
  #endif




#define MMC_DEFAULT_RCA			(1<<16)

#define MMC_BLOCK_SIZE			512
#define MMC_CMD_RESET			0
#define MMC_CMD_SEND_OP_COND		1
#define MMC_CMD_ALL_SEND_CID 	2
//#define MMC_CMD_SET_RCA			3
#define SD_CMD_SEND_RELATIVE_ADDR			3
#define SD_CMD_APP_SET_BUS_WIDTH	6
#define MMC_CMD_SELECT_CARD		7
#define MMC_CMD_IF_COND                 8
#define MMC_CMD_SEND_CSD 		9
#define MMC_CMD_SEND_CID 		10
#define MMC_CMD_STOP_TRANSMISSION    12   /* ac                      R1b */
#define MMC_CMD_SEND_STATUS		13
#define MMC_CMD_SET_BLOCKLEN		16
#define MMC_CMD_READ_BLOCK		17
#define MMC_CMD_RD_BLK_MULTI		18
#define MMC_CMD_WRITE_BLOCK		24
#define SD_CMD_APP_SEND_OP_COND	41
#define MMC_CMD_APP_CMD			55

#define MMC_MAX_BLOCK_SIZE		512

#define MMC_IS_SD_CARD			(1<<31)

// ------------------------------------------------------------------
#ifdef _MMC_OLD_DEFINES

#define MMC_R1_IDLE_STATE		0x01
#define MMC_R1_ERASE_STATE		0x02
#define MMC_R1_ILLEGAL_CMD		0x04
#define MMC_R1_COM_CRC_ERR		0x08

#define MMC_R1_ERASE_SEQ_ERR	0x01
#define MMC_R1_ADDR_ERR			0x02
#define MMC_R1_PARAM_ERR		0x04

#else  
#define MMC_R1_COM_CRC_ERR			(1<<23)
#define MMC_R1_CURRENT_STATE		~(0xF<<9)
#define MMC_R1_CURRENT_STATE_IDLE	0
#define MMC_R1_CURRENT_STATE_READY	1
#define MMC_R1_CURRENT_STATE_IDENT	2
#define MMC_R1_CURRENT_STATE_STDBY	3
#define MMC_R1_CURRENT_STATE_TRAN	4
#define MMC_R1_CURRENT_STATE_DATA	5
#define MMC_R1_CURRENT_STATE_RCV	6
#define MMC_R1_CURRENT_STATE_PRG	7
#define MMC_R1_CURRENT_STATE_DIS	8

#define MMC_R1_ERASE_RESET			(1<<13)
#define MMC_R1_APP_CMD				(1<<5)
#define MMC_R1_READY_FOR_DATA		(1<<8)
#define MMC_R1_BLOCK_LEN_ERROR		(1<<29)

#endif

#define MMC_R1B_WP_ERASE_SKIP	0x0002
#define MMC_R1B_ERR				0x0004
#define MMC_R1B_CC_ERR			0x0008
#define MMC_R1B_CARD_ECC_ERR	0x0010
#define MMC_R1B_WP_VIOLATION	0x0020
#define MMC_R1B_ERASE_PARAM		0x0040
#define MMC_R1B_OOR				0x0080
#define MMC_R1B_IDLE_STATE		0x0100
#define MMC_R1B_ERASE_RESET		0x0200
#define MMC_R1B_ILLEGAL_CMD		0x0400
#define MMC_R1B_COM_CRC_ERR		0x0800
#define MMC_R1B_ERASE_SEQ_ERR	0x1000
#define MMC_R1B_ADDR_ERR		0x2000
#define MMC_R1B_PARAM_ERR		0x4000

#define MMC_CMD_MASK    (3 << 5)                /* non-SPI command type */
#define MMC_CMD_AC      (0 << 5)
#define MMC_CMD_ADTC    (1 << 5)
#define MMC_CMD_BC      (2 << 5)
#define MMC_CMD_BCR     (3 << 5)

#define MMC_RSP_PRESENT (1 << 0)
#define MMC_RSP_136     (1 << 1)                /* 136 bit response */
#define MMC_RSP_CRC     (1 << 2)                /* expect valid crc */
#define MMC_RSP_BUSY    (1 << 3)                /* card may send busy */
#define MMC_RSP_OPCODE  (1 << 4)  
#define MMC_RSP_R1B     (MMC_RSP_PRESENT|MMC_RSP_CRC|MMC_RSP_OPCODE|MMC_RSP_BUSY)


#define MMC_VDD_165_195         0x00000080      /* VDD voltage 1.65 - 1.95 */
#define MMC_VDD_20_21           0x00000100      /* VDD voltage 2.0 ~ 2.1 */                                                                    
#define MMC_VDD_21_22           0x00000200      /* VDD voltage 2.1 ~ 2.2 */                                                                    
#define MMC_VDD_22_23           0x00000400      /* VDD voltage 2.2 ~ 2.3 */                                                                    
#define MMC_VDD_23_24           0x00000800      /* VDD voltage 2.3 ~ 2.4 */                                                                    
#define MMC_VDD_24_25           0x00001000      /* VDD voltage 2.4 ~ 2.5 */                                                                    
#define MMC_VDD_25_26           0x00002000      /* VDD voltage 2.5 ~ 2.6 */                                                                    
#define MMC_VDD_26_27           0x00004000      /* VDD voltage 2.6 ~ 2.7 */                                                                    
#define MMC_VDD_27_28           0x00008000      /* VDD voltage 2.7 ~ 2.8 */
#define MMC_VDD_28_29           0x00010000      /* VDD voltage 2.8 ~ 2.9 */                                                                    
#define MMC_VDD_29_30           0x00020000      /* VDD voltage 2.9 ~ 3.0 */                                                                    
#define MMC_VDD_30_31           0x00040000      /* VDD voltage 3.0 ~ 3.1 */                                                                    
#define MMC_VDD_31_32           0x00080000      /* VDD voltage 3.1 ~ 3.2 */                                                                    
#define MMC_VDD_32_33           0x00100000      /* VDD voltage 3.2 ~ 3.3 */                                                                    
#define MMC_VDD_33_34           0x00200000      /* VDD voltage 3.3 ~ 3.4 */                                                                    
#define MMC_VDD_34_35           0x00400000      /* VDD voltage 3.4 ~ 3.5 */                                                                    
#define MMC_VDD_35_36           0x00800000      /* VDD voltage 3.5 ~ 3.6 */


typedef struct mmc_cid {
	/* FIXME: BYTE_ORDER */
	uchar	year:4, month:4;
	uchar	sn[3];
	uchar	fwrev:4, hwrev:4;
	uchar	name[6];
	uchar	id[3];
} mmc_cid_t;
/*
typedef struct mmc_csd
{
	uchar	ecc:2,
		file_format:2,
		tmp_write_protect:1,
		perm_write_protect:1,
		copy:1,
		file_format_grp:1;
	uint64_t content_prot_app:1,
		rsvd3:4,
		write_bl_partial:1,
		write_bl_len:4,
		r2w_factor:3,
		default_ecc:2,
		wp_grp_enable:1,
		wp_grp_size:5,
		erase_grp_mult:5,
		erase_grp_size:5,
		c_size_mult1:3,
		vdd_w_curr_max:3,
		vdd_w_curr_min:3,
		vdd_r_curr_max:3,
		vdd_r_curr_min:3,
		c_size:12,
		rsvd2:2,
		dsr_imp:1,
		read_blk_misalign:1,
		write_blk_misalign:1,
		read_bl_partial:1;

	ushort	read_bl_len:4,
		ccc:12;
	uchar	tran_speed;
	uchar	nsac;
	uchar	taac;
	uchar	rsvd1:2,
  		spec_vers:4,
		csd_structure:2;
} mmc_csd_t;
*/
typedef struct mmc_csd {
	u8	csd_structure:2, spec_vers:4, rsvd1:2; 
	u8	taac; 
	u8	nsac; 
	u8	tran_speed; 
	u16	ccc:12, read_bl_len:4; 
	u64	read_bl_partial:1, write_blk_misalign:1, read_blk_misalign:1,  dsr_imp:1, rsvd2:2, c_size:12, 
	vdd_r_curr_min:3, 
	vdd_r_curr_max:3, 
	vdd_w_curr_min:3, 
	vdd_w_curr_max:3, 
	c_size_mult:3, 
	sector_size:5, 
	erase_grp_size:5, 
	wp_grp_size:5, 
	wp_grp_enable:1, default_ecc:2, r2w_factor:3, write_bl_len:4, write_bl_partial:1, rsvd3:5; 
	u8	file_format_grp:1, copy:1, perm_write_protect:1, tmp_write_protect:1, file_format:2, ecc:2; 
	u8	crc:7; 
	u8	one:1; 
} mmc_csd_t;


struct sd_cid {
	char		pnm_0;	/* product name */
	char		oid_1;	/* OEM/application ID */
	char		oid_0;
	uint8_t		mid;	/* manufacturer ID */
	char		pnm_4;
	char		pnm_3;
	char		pnm_2;
	char		pnm_1;
	uint8_t		psn_2;	/* product serial number */
	uint8_t		psn_1;
	uint8_t		psn_0;	/* MSB */
	uint8_t		prv;	/* product revision */
	uint8_t		crc;	/* CRC7 checksum, b0 is unused and set to 1 */
	uint8_t		mdt_1;	/* manufacturing date, LSB, RRRRyyyy yyyymmmm */
	uint8_t		mdt_0;	/* MSB */
	uint8_t		psn_3;	/* LSB */
};


ulong mmc_bread(int dev_num, ulong blknr, ulong blkcnt, void *dst);
u_int32_t *mmc_cmd(ushort cmd, ulong arg, ushort flags);
void print_mmc_cid(mmc_cid_t *cid);
u_int32_t mmc_size(const struct mmc_csd *csd);
void print_sd_cid(const struct sd_cid *cid);



#endif /* __MMC_S3C_H__ */
