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
#include "n300.h"


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

void keypad_init(void) {

	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();

	/* blue led */
	//s3c2410_gpio_setpin(S3C2410_GPD10, 1);	//switch on
	gpio->GPDDAT |= ~(1<<10);						//switch on
	S3C2440_GPIO_CONFIG(gpio->GPDCON, 10, GPIO_OUTPUT);		// enable blue led
	
	//{KEY_A, S3C2410_GPF4, 1, "Home button",EV_KEY}
	S3C2440_GPIO_PULLUP(gpio->GPFUP, 4, GPIO_PULLUP_ENABLE);
	S3C2440_GPIO_CONFIG(gpio->GPFCON, 4, GPIO_INPUT);
	
	//{KEY_TAB, S3C2410_GPF5, 1, "Calendar button",EV_KEY}
	S3C2440_GPIO_PULLUP(gpio->GPFUP, 5, GPIO_PULLUP_ENABLE);
	S3C2440_GPIO_CONFIG(gpio->GPFCON, 5, GPIO_INPUT);
	
	setenv("key_code", "0");
}

unsigned int IsHomeBtnReleased(void) {
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	return  (gpio->GPFDAT & (1<<4)) ? 1 : 0;
}

unsigned int IsCalendarBtnReleased(void) {
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	//return  (gpio->GPFDAT & (1<<5)) ? 0 : 1;
	return  (gpio->GPFDAT & (1<<5)) ? 1 : 0;
}

void n300_setkey(void) {
	char str[16];

	sprintf(str, "%i", IsHomeBtnReleased() );
	setenv("key_code", str);
}

int n300_waitkey(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[]){
	int nBootDelay;
	
	nBootDelay=simple_strtoul(getenv("bootdelay"), NULL, 10);

	while (nBootDelay && IsHomeBtnReleased()) {
	  mdelay(1000);		// 1 second
	  nBootDelay--;
	  }
	if (!nBootDelay) {
		setenv("key_code", "0"); 
		return 0;
		}
	else {
		setenv("key_code", "1");
		return 1;
		}
}

U_BOOT_CMD(
	waitkey,	1,	0,	n300_waitkey,
	"waitkey  - wait Home key to be pressed and set the environment var key_code (single press only)\n",
	NULL
);
