/*
 * (C) Copyright 2008
 * Stuart Wood, Lab X Technologies <stuart.wood@labxtechnologies.com>
 *
 * (C) Copyright 2004
 * Jian Zhang, Texas Instruments, jzhang@ti.com.

 * (C) Copyright 2000-2006
 * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
 *
 * (C) Copyright 2001 Sysgo Real-Time Solutions, GmbH <www.elinos.com>
 * Andreas Heppel <aheppel@sysgo.de>

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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */

/* #define DEBUG */

#include <common.h>
#include <command.h>
#include <environment.h>
#include <linux/stddef.h>
#include <malloc.h>
#include <nand.h>

#ifdef NAND_ENV_DEBUG
        #define DPRINTK(ARGS...)  printf("<%s>: ",__FUNCTION__);printf(ARGS)
#else
        #define DPRINTK( x... )
#endif


#if defined(CFG_CMD_ENV) && defined(CFG_CMD_NAND)
#define CMD_SAVEENV
#elif defined(CONFIG_ENV_OFFSET_REDUND)
#error Cannot use CONFIG_ENV_OFFSET_REDUND without CFG_CMD_ENV & CFG_CMD_NAND
#endif

#if defined(CONFIG_ENV_SIZE_REDUND) && (CONFIG_ENV_SIZE_REDUND != CFG_ENV_SIZE)
#error CONFIG_ENV_SIZE_REDUND should be the same as CFG_ENV_SIZE
#endif

#ifdef CONFIG_INFERNO
#error CONFIG_INFERNO not supported yet
#endif

#ifdef CFG_NAND_LEGACY
#include <linux/mtd/nand_legacy.h>
extern int nand_legacy_rw (struct nand_chip* nand, int cmd, size_t start, size_t len, size_t * retlen, u_char * buf);
extern struct nand_chip nand_dev_desc[CFG_MAX_NAND_DEVICE];
extern int nand_legacy_erase(struct nand_chip *nand, size_t ofs, size_t len, int clean);
#else
/* info for NAND chips, defined in drivers/nand/nand.c */
extern nand_info_t nand_info[];
#endif

/* references to names in env_common.c */
extern uchar default_environment[];
extern int default_environment_size;

char * env_name_spec = "NAND";


#ifdef ENV_IS_EMBEDDED
extern uchar environment[];
env_t *env_ptr = (env_t *)(&environment[0]);
#else /* ! ENV_IS_EMBEDDED */
env_t *env_ptr = 0;
#endif /* ENV_IS_EMBEDDED */


/* local functions */
#if !defined(ENV_IS_EMBEDDED)
static void use_default(void);
#endif

DECLARE_GLOBAL_DATA_PTR;

uchar env_get_char_spec (int index)
{
	return ( *((uchar *)(gd->env_addr + index)) );
}


/* this is called before nand_init()
 * so we can't read Nand to validate env data.
 * Mark it OK for now. env_relocate() in env_common.c
 * will call our relocate function which does the real
 * validation.
 *
 * When using a NAND boot image (like sequoia_nand), the environment
 * can be embedded or attached to the U-Boot image in NAND flash. This way
 * the SPL loads not only the U-Boot image from NAND but also the
 * environment.
 */
int env_init(void) {
#if defined(ENV_IS_EMBEDDED)
	size_t total;
	int crc1_ok = 0, crc2_ok = 0;
	env_t *tmp_env1, *tmp_env2;

	total = CFG_ENV_SIZE;

	tmp_env1 = env_ptr;
	tmp_env2 = (env_t *)((ulong)env_ptr + CFG_ENV_SIZE);

	crc1_ok = (crc32(0, tmp_env1->data, CFG_ENV_SIZE) == tmp_env1->crc);
	crc2_ok = (crc32(0, tmp_env2->data, CFG_ENV_SIZE) == tmp_env2->crc);

	if (!crc1_ok && !crc2_ok)
		gd->env_valid = 0;
	else if(crc1_ok && !crc2_ok)
		gd->env_valid = 1;
	else if(!crc1_ok && crc2_ok)
		gd->env_valid = 2;
	else {
		/* both ok - check serial */
		if(tmp_env1->flags == 255 && tmp_env2->flags == 0)
			gd->env_valid = 2;
		else if(tmp_env2->flags == 255 && tmp_env1->flags == 0)
			gd->env_valid = 1;
		else if(tmp_env1->flags > tmp_env2->flags)
			gd->env_valid = 1;
		else if(tmp_env2->flags > tmp_env1->flags)
			gd->env_valid = 2;
		else /* flags are equal - almost impossible */
			gd->env_valid = 1;
	}

	if (gd->env_valid == 1)
		env_ptr = tmp_env1;
	else if (gd->env_valid == 2)
		env_ptr = tmp_env2;
#else /* ENV_IS_EMBEDDED */
	gd->env_addr  = (ulong)&default_environment[0];
	gd->env_valid = 1;
#endif /* ENV_IS_EMBEDDED */

	return (0);
}

#ifdef CMD_SAVEENV
/*
 * The legacy NAND code saved the environment in the first NAND device i.e.,
 * nand_dev_desc + 0. This is also the behaviour using the new NAND code.
 */
	#ifndef CFG_NAND_LEGACY
int writeenv(size_t offset, u_char *buf) {
	size_t end = offset + CFG_ENV_SIZE;
	size_t amount_saved = 0;
	size_t blocksize, len;

	u_char *char_ptr;

	blocksize = nand_info[0].erasesize;
	len = min(blocksize, CFG_ENV_SIZE);

	while (amount_saved < CFG_ENV_SIZE && offset < end) {
		if (nand_block_isbad(&nand_info[0], offset)) {
			offset += blocksize;
		} else {
			char_ptr = &buf[amount_saved];
			if (nand_write(&nand_info[0], offset, &len,	char_ptr))
				return 1;
			offset += blocksize;
			amount_saved += len;
		}
	}
	if (amount_saved != CFG_ENV_SIZE) {
		DPRINTK("amount_saved 0x%08X, CFG_ENV_SIZE 0x%08X\n", amount_saved, CFG_ENV_SIZE);
		return 1;
		}

	return 0;
}
	#endif
	
#ifdef CFG_NAND_LEGACY
int saveenv(void) {
	size_t total, offset;
	int ret = 0;

	puts ("Erasing Nand...");
	if (nand_legacy_erase(nand_dev_desc + 0, CFG_ENV_OFFSET, CFG_ENV_SIZE, 0))
		return 1;

	puts ("Writing to Nand... ");
	total = CFG_ENV_SIZE;
	offset = CFG_ENV_OFFSET;
	ret = nand_legacy_rw(nand_dev_desc + 0, 0x00 | 0x02, CFG_ENV_OFFSET, CFG_ENV_SIZE, &total, (u_char*)env_ptr);
	if (ret || total != CFG_ENV_SIZE) {
		DPRINTK("ret 0x%02X, total 0x%08X, CFG_ENV_SIZE 0x%08X\n", ret, total, CFG_ENV_SIZE);
		return 1;
		}

	puts ("done\n");
	return ret;
}

	
#else
int saveenv(void) {
	size_t total;
	int ret = 0;
	nand_erase_options_t nand_erase_options;

	nand_erase_options.length = CFG_ENV_SIZE;
	nand_erase_options.quiet = 0;
	nand_erase_options.jffs2 = 0;
	nand_erase_options.scrub = 0;
	nand_erase_options.offset = CFG_ENV_OFFSET;

	puts ("Erasing Nand...\n");
	if (nand_erase_opts(&nand_info[0], &nand_erase_options))
		return 1;

	puts ("Writing to Nand... ");
	total = CFG_ENV_SIZE;
	if (writeenv(CFG_ENV_OFFSET, (u_char *) env_ptr)) {
		puts("FAILED!\n");
		return 1;
	}

	puts ("done\n");
	return ret;
}
#endif /* CFG_NAND_LEGACY */
#endif /* CMD_SAVEENV */

#ifndef CFG_NAND_LEGACY
int readenv (size_t offset, u_char * buf) {
	DPRINTK("offset 0x%08X\n", offset);
	//size_t end = offset + CONFIG_ENV_RANGE;
	size_t end = offset + CFG_ENV_SIZE;
	size_t amount_loaded = 0;
	size_t blocksize, len;

	u_char *char_ptr;

	blocksize = nand_info[0].erasesize;
	len = min(blocksize, CFG_ENV_SIZE);
	DPRINTK("blocksize 0x%08X, offset 0x%08X. len 0x%08X, end 0x%08X\n", blocksize, offset, len, end);

	while (amount_loaded < CFG_ENV_SIZE && offset < end) {
		if (nand_block_isbad(&nand_info[0], offset)) {
			DPRINTK("nand_block_isbad, offset 0x%08X\n", offset);
			offset += blocksize;
		} else {
			char_ptr = &buf[amount_loaded];
			if (nand_read(&nand_info[0], offset, &len, char_ptr)) {
				DPRINTK("offset 0x%08X, len 0x%08X\n", offset, len);
				return 1;
				}
			offset += blocksize;
			amount_loaded += len;
		}
	}
	if (amount_loaded != CFG_ENV_SIZE) {
		DPRINTK("amount_loaded 0x%08X, CFG_ENV_SIZE 0x%08X\n", amount_loaded, CFG_ENV_SIZE);
		return 1;
		}
	return 0;
}
#endif

/*
 * The legacy NAND code saved the environment in the first NAND device i.e.,
 * nand_dev_desc + 0. This is also the behaviour using the new NAND code.
 */
#ifndef CFG_NAND_LEGACY

void env_relocate_spec (void) {
#if !defined(ENV_IS_EMBEDDED)
	int ret;
	unsigned long nCRC32;

	DPRINTK("CFG_ENV_OFFSET 0x%08X\n", CFG_ENV_OFFSET);
	ret = readenv(CFG_ENV_OFFSET, (u_char *) env_ptr);
	if (ret) {
		DPRINTK("env_ptr->data 0x%08X, env_ptr->crc 0x%08X\n", env_ptr->data, env_ptr->crc);
		return use_default();
		}
	nCRC32=crc32(0, env_ptr->data, CFG_ENV_SIZE);
	
	if (nCRC32 != env_ptr->crc) {
		DPRINTK("crc32 0x%08X, env_ptr->crc 0x%08X, CFG_ENV_SIZE 0x%08X\n", nCRC32, env_ptr->crc, CFG_ENV_SIZE);
		//#ifdef K9F1G08U0M
		#if 0
		return;
		#else
		return use_default();
		#endif
		}
#endif /* ! ENV_IS_EMBEDDED */
}

#else

void env_relocate_spec (void) {
#if !defined(ENV_IS_EMBEDDED)
	ulong total;
	unsigned long nCRC32;
	int ret;

	DPRINTK("CFG_ENV_OFFSET 0x%08X\n", CFG_ENV_OFFSET);
	total = CFG_ENV_SIZE;
	
	ret = nand_legacy_rw(nand_dev_desc + 0, 0x01 | 0x02, CFG_ENV_OFFSET, CFG_ENV_SIZE, &total, (u_char*)env_ptr);
  	if (ret || total != CFG_ENV_SIZE) {
		DPRINTK("ret 0x%02X, total 0x%08X, CFG_ENV_SIZE 0x%08X\n", ret, total, CFG_ENV_SIZE);
		return use_default();
		}
		
	nCRC32=crc32(0, env_ptr->data, CFG_ENV_SIZE);
	//nCRC32=crc32(0, env_ptr->data, ENV_SIZE);		// FIXME
	
	if (nCRC32 != (ulong)env_ptr->crc) {
		DPRINTK("crc32 0x%08X, env_ptr->crc 0x%08X, CFG_ENV_SIZE 0x%08X\n", nCRC32, env_ptr->crc, CFG_ENV_SIZE);
		return use_default();
		}
#endif /* ! ENV_IS_EMBEDDED */
}

#endif			/* CFG_NAND_LEGACY */



#if !defined(ENV_IS_EMBEDDED)
static void use_default() {
	puts ("*** Warning - bad CRC or NAND, using default environment\n\n");
	set_default_env();
}
#endif
