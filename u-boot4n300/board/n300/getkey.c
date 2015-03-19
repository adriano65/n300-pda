/* This stuff is for reading the keys at the bottom of the ipaq
 * via the pxa3xx keypad controller.
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
#include <command.h>
#include <asm/arch/regs-gpio.h>
#include <s3c2440.h>

static const int rows = 4;
static const int cols = 3;


#if 0
/* KEY(row, col, key_code) */
	KEY(2, 0, KEY_0),	//Func key A - left most
	KEY(3, 0, KEY_1),	//Func key B
	KEY(1, 0, KEY_2),	//Func key C
	KEY(1, 1, KEY_3),	//Func key D - right most
	KEY(0, 2, KEY_4),	//The record button
	
	KEY(0, 0, KEY_5),	//Unknown or N/C 1
	KEY(0, 1, KEY_6),	//Unknown or N/C 2
		
	KEY(1, 2, KEY_LEFT),
	KEY(2, 1, KEY_UP),
	KEY(2, 2, KEY_RIGHT),
	KEY(3, 1, KEY_DOWN),
	KEY(3, 2, KEY_ENTER),	//Nav centre key
#endif

static void keypad_init(void) {

	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();

	/* blue led */
	//s3c2410_gpio_setpin(S3C2410_GPD10, 1);	//switch on
	gpio->GPDCON |= ~(1<<10);						//switch on
	S3C2440_GPIO_CONFIG (gpio->GPDCON, 10, GPIO_OUTPUT);		// enable blue led
	
	//{KEY_A, S3C2410_GPF4, 1, "Home button",EV_KEY},
	S3C2440_GPIO_CONFIG (gpio->GPFCON, 4, GPIO_INPUT);
}

static void n300_setkey(void) {
#if 0
	char str[16];
	unsigned long key;

	key =  KPAS;

	sprintf(str, "%i", (key >> 4) & 0x0F);
	setenv("keyrow", str);
	sprintf(str, "%i", key & 0x0F);
	setenv("keycol", str);
#endif
}

static void n300_getkey(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[]) {

#if 0
	KPC |= KPC_AS; /* Perform a single auto-scan */

	while(KPC & KPC_AS){ }	/* wait for it to finish */

	udelay(1000); /* Make sure the key has reached the regs */
#endif
	n300_setkey();
}

static void n300_waitkey(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[]){
#if 0

	KPC |= KPC_AS; /* Perform a single auto-scan first, to clear any previous getkey() result still in the KPAS register*/
	while(KPC & KPC_AS){ } /* wait for it to finish */

	udelay(1000); /* Make sure the key has reached the regs */
	if ( (KPAS & 0xFF) != 0xFF){ /* key already pressed, return that */
		n300_setkey();
		return;
	}

	KPC |= KPC_ASACT; /* Turn on auto-scan on activity */

	while( (KPAS & KPAS_SO) || ((KPAS & 0xFF) == 0xFF) ){ } /* Wait for scan not in progress and valid row/col data */
#endif
	n300_setkey();
}



U_BOOT_CMD(
	getkey,	1,	0,	n300_getkey,
	"getkey - get the current key pressed from the keypad and set the environment vars keyrow and keycol (single press only)\n",
	NULL
);

U_BOOT_CMD(
	waitkey,	1,	0,	n300_waitkey,
	"waitkey - wait for a key to be pressed and set the environment vars keyrow and keycol (single press only)\n",
	NULL
);
