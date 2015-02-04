/*
 * (C) Copyright 2006 DENX Software Engineering
 *
 * See file CREDITS for list of people who contributed to this
 * project.
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

#include <common.h>

#ifdef NAND_LL_DEBUG
        #define DPRINTK(ARGS...)  printf("<%s>: ",__FUNCTION__);printf(ARGS)
#else
        #define DPRINTK( x... )
#endif


#if (CONFIG_COMMANDS & CFG_CMD_NAND && !defined(CFG_NAND_LEGACY) )
//#if (defined(CFG_CMD_NAND) & !defined(CFG_NAND_LEGACY) )
//#if (CONFIG_COMMANDS & CFG_CMD_NAND)
//#ifdef CFG_CMD_NAND
//#ifndef CFG_NAND_LEGACY

#include <s3c2440.h>
#include <nand.h>


typedef enum {
        NFCE_LOW,
        NFCE_HIGH
} NFCE_STATE;

static  void NF_SetCE(NFCE_STATE s) {
	S3C2440_NAND * const nand = S3C2440_GetBase_NAND();
	switch (s) 
	{
		case NFCE_LOW:
			nand->NFCONT &= ~(1<<1);
		break;
		case NFCE_HIGH:
			nand->NFCONT |= (1<<1);
		break;
	}
}

static void NF_WaitRB(void) {
	S3C2440_NAND * const nand = S3C2440_GetBase_NAND();
	while (!(nand->NFSTAT & (1<<0)));
}

static  void NF_Cmd(u8 cmd) {
	S3C2440_NAND * const nand = S3C2440_GetBase_NAND();
	nand->NFCMD = cmd;
}

static  void NF_Addr(u8 addr) {
	S3C2440_NAND * const nand = S3C2440_GetBase_NAND();
	nand->NFADDR = addr;
}

static void nand_write_address(struct mtd_info *mtd, u_char byte)
{
	struct nand_chip *this = mtd->priv;
	DPRINTK(" byte 0x%02X\n", byte);
	NF_Addr(byte);
	NAND_WAIT_READY(nand);			/* mapped to NF_WaitRB */
}

/* hardware specific access to control-lines */
static void n300nand_hwcontrol(struct mtd_info *mtdinfo, int cmd)
{
	struct nand_chip *this = mtdinfo->priv;
	//ulong base = (ulong) this->IO_ADDR_W;

	DPRINTK(" cmd 0x%02X\n", cmd);
	switch(cmd) {
		/*
		case NAND_CTL_SETCLE:
			DPRINTK("NAND_CTL_SETCLE\n");
			MACRO_NAND_CTL_SETCLE((unsigned long)base);
			//NF_Addr(0);
			break;
		case NAND_CTL_CLRCLE:
			DPRINTK("NAND_CTL_CLRCLE\n");
			MACRO_NAND_CTL_CLRCLE((unsigned long)base);
			break;
		case NAND_CTL_SETALE:
			DPRINTK("NAND_CTL_SETALE\n");
			MACRO_NAND_CTL_SETALE((unsigned long)base);
			break;
		case NAND_CTL_CLRALE:
			DPRINTK("NAND_CTL_CLRALE\n");
			MACRO_NAND_CTL_CLRALE((unsigned long)base);
			break;
		case NAND_CTL_SETNCE:
			DPRINTK("MACRO_NAND_ENABLE_CE\n");
			MACRO_NAND_ENABLE_CE;
			break;
		case NAND_CTL_CLRNCE:
			DPRINTK("MACRO_NAND_DISABLE_CE\n");
			MACRO_NAND_DISABLE_CE;
			break;
			*/
		default:
			printk("Unmanaged nand cmd 0x%02X !\n", cmd);
			break;
	}
}


/*
 * read device ready pin
 * function +/- borrowed from Linux 2.6 (drivers/mtd/nand/ppchameleonevb.c)
 */
static int n300nand_device_ready(struct mtd_info *mtdinfo) {
	S3C2440_NAND * const nand = S3C2440_GetBase_NAND();
	
	DPRINTK("\n");
	//while (!(nand->NFSTAT & (1<<0))) { DPRINTK(" while\n"); }
	//return 1;
	
	if ( !(nand->NFSTAT & (1<<0)) ) return 0;
	return 1;
	
}

static inline void NF_Init(void) {
	int i;
	S3C2440_NAND * const nand = S3C2440_GetBase_NAND();
	
	DPRINTK("\n");
	nand->NFCONF=0x00001410;
	nand->NFCONT=0x00000073;

	//NF_Reset();
	NF_SetCE(NFCE_LOW);
	NF_Cmd(NAND_CMD_RESET); 		// reset command
	for(i = 0; i < 10; i++); 		// tWB = 100ns.
	NF_WaitRB(); 					// wait 200~500us;
	NF_SetCE(NFCE_HIGH);
	
}

static void n300cmd_ctrl_hw(struct mtd_info *mtd, int cmd, unsigned int ctrl) {
	struct nand_chip *chip = mtd->priv;
	if (ctrl & NAND_CTRL_CHANGE) {
	  ctrl &= ~NAND_CTRL_CHANGE;
	  switch(ctrl) {
		  case NAND_NCE:
			  DPRINTK("NAND_NCE\n");
			  MACRO_NAND_ENABLE_CE;
			  break;
		  case NAND_CTRL_CLE:
			  DPRINTK("NAND_CTRL_CLE\n");
			  MACRO_NAND_ENABLE_CE;
			  MACRO_NAND_CTL_SETCLE((unsigned long)base);
			  break;
		  case NAND_CLE:
			  DPRINTK("NAND_CLE\n");
			  break;
		  case NAND_ALE:
			  DPRINTK("NAND_ALE\n");
			  break;
		  case NAND_CTRL_ALE:
			  DPRINTK("NAND_CTRL_ALE\n");
			  //MACRO_NAND_ENABLE_CE;
			  MACRO_NAND_CTL_SETALE((unsigned long)base);
			  break;
		  case 0:
			  DPRINTK("case 0 ctrl 0x%04X\n", ctrl);
			  MACRO_NAND_DISABLE_CE;
			  break;
		  default:
			  printk("Unmanaged nand ctrl 0x%04X\n", ctrl);
			  break;
		  }
		}
	else {
		DPRINTK("bit NAND_CTRL_CHANGE not set\n");
		}
}

static void n300cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl) {
	struct nand_chip *chip = mtd->priv;

	switch(cmd) {		
		case NAND_CMD_READID:
			n300cmd_ctrl_hw(mtd, cmd, ctrl);
			DPRINTK("NAND_CMD_READID (ctrl 0x%04X)\n", ctrl);
			WRITE_NAND_COMMAND(NAND_CMD_READID, chip->IO_ADDR);
			NAND_WAIT_READY(nand);
			break;
		case NAND_CMD_READ0:
			n300cmd_ctrl_hw(mtd, cmd, ctrl);
			DPRINTK("NAND_CMD_READ0\n");
			//WRITE_NAND_COMMAND(NAND_CMD_READ0, chip->IO_ADDR);
			WRITE_NAND_ADDRESS(0, chip->IO_ADDR);
			NAND_WAIT_READY(nand);
			break;
		case NAND_CMD_READSTART:
			n300cmd_ctrl_hw(mtd, cmd, ctrl);
			DPRINTK("NAND_CMD_READSTART (ctrl 0x%04X)\n", ctrl);
			WRITE_NAND_COMMAND(NAND_CMD_READSTART, chip->IO_ADDR);
			NAND_WAIT_READY(nand);
			break;
		case NAND_CMD_RESET:
			n300cmd_ctrl_hw(mtd, cmd, ctrl);
			DPRINTK("NAND_CMD_RESET (ctrl 0x%04X)\n", ctrl);
			WRITE_NAND_COMMAND(NAND_CMD_RESET, chip->IO_ADDR);
			NAND_WAIT_READY(nand);
			break;
		case NAND_CMD_NONE:
			DPRINTK("NAND_CMD_NONE\n");
			n300cmd_ctrl_hw(mtd, cmd, ctrl);
			break;
			
		default:
			printk("Unmanaged nand cmd 0x%02X, ctrl 0x%04X\n", cmd, ctrl);
			break;
	}

}


/*
 * Board-specific NAND initialization. The following members of the
 * argument are board-specific (per include/linux/mtd/nand.h):
 * - IO_ADDR_R?: address to read the 8 I/O lines of the flash device
 * - IO_ADDR_W?: address to write the 8 I/O lines of the flash device
 * - hwcontrol: hardwarespecific function for accesing control-lines
 * - dev_ready: hardwarespecific function for  accesing device ready/busy line
 * - enable_hwecc?: function to enable (reset)  hardware ecc generator. Must
 *   only be provided if a hardware ECC is available
 * - eccmode: mode of ecc, see defines
 * - chip_delay: chip dependent delay for transfering data from array to
 *   read regs (tR)
 * - options: various chip options. They can partly be set to inform
 *   nand_scan about special functionality. See the defines for further
 *   explanation
 * Members with a "?" were not set in the merged testing-NAND branch,
 * so they are not set here either.
 */
int board_nand_init(struct nand_chip *nand_chip) {
	S3C2440_NAND * const nand_base = S3C2440_GetBase_NAND();

	NF_Init();
	DPRINTK("NAND flash probing at 0x%.8lX\n", (ulong)nand_base);
	//unsigned long nand_size=0x1280000;	
	//nand_size=nand_probe((ulong)nand_base);
	
	nand_chip->IO_ADDR_R = S3C2440_NAND_NFDATA;
	//nand_chip->IO_ADDR_W = S3C2440_NAND_NFCMD;
	nand_chip->cmd_ctrl = n300cmd_ctrl;
	//nand_chip->write_byte=nand_write_address;
	
	//nand_chip->hwcontrol = n300nand_hwcontrol;
	nand_chip->dev_ready = n300nand_device_ready;
	//nand_chip->eccmode = NAND_ECC_SOFT;
	//nand_chip->eccmode = NAND_ECC_HW3_256;	
	nand_chip->chip_delay = 0;
	//nand_chip->options = NAND_SAMSUNG_LP_OPTIONS | ;

//#ifdef CFG_NAND_HW_ECC
	nand_chip->ecc.mode = NAND_ECC_HW;
#ifdef CFG_NAND_LARGEPAGE
	nand_chip->ecc.size = SECTORSIZE;
	nand_chip->ecc.bytes = 12;
#elif defined(CFG_NAND_SMALLPAGE)
	nand_chip->ecc.size = SECTORSIZE;
	nand_chip->ecc.bytes = 3;
#else
#error "Either CFG_NAND_LARGEPAGE or CFG_NAND_SMALLPAGE must be defined!"
#endif
//	nand_chip->ecc.calculate = nand_davinci_calculate_ecc;
  
	return 0;
	
}

#endif /* (CONFIG_COMMANDS & CFG_CMD_NAND) */
