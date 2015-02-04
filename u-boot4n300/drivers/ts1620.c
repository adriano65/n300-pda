/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

#include <common.h>
#include <command.h>

#include <s3c2440.h>
#include <ts1620.h>

#define GPIO_DIRECTION_INPUT	0
#define GPIO_DIRECTION_OUTPUT	1

#define LCM_RS	10		//S3C2440_GPJ10
#define LCM_RW	11		//S3C2440_GPJ11
#define LCM_E	12		//S3C2440_GPJ12

#define GPJCON	(*(volatile unsigned int *)(0x560000d0))
#define GPJDAT	(*(volatile unsigned int *)(0x560000d4))
#define GPJUP	(*(volatile unsigned int *)(0x560000d8))

#define mdelay(n) ({unsigned long msec=(n); while (msec--) udelay(1000);})

#if defined(CONFIG_S3C2440) && defined(CONFIG_DRIVER_TS1620)

unsigned int first_init=0;

void config_gpio(int direction)
{

	switch(direction)
	{
	    case GPIO_DIRECTION_INPUT:
		GPJCON = 0x1500000; 
		GPJUP = 0x1f00;	//enable pull-up
		mdelay(1);
	    break; 
	    case GPIO_DIRECTION_OUTPUT:
		GPJCON = 0x1500055;
		GPJUP = 0x1fff;	//disable pull-up
		mdelay(1);
	    break;
	}
}

void set_gpio(int pin,int value)
{
	unsigned int tmp;

	tmp = GPJDAT;
	tmp = ((tmp & ~(1 << pin)) | (value<<pin));
	tmp &= 0x1fff;

	GPJDAT = tmp;
}

void lcm_wait(void)
{
	int count=0;
	unsigned int value=0;

	config_gpio(GPIO_DIRECTION_INPUT);

	do {
		count++;
		if(count > 2)
		    break;

		set_gpio(LCM_RS,0); 
		set_gpio(LCM_RW,1);
		set_gpio(LCM_E,0);
		mdelay(1);
		set_gpio(LCM_E,1);
		mdelay(1);
		value |= GPJDAT;
		value = (value & 0x0f)<<4;
		set_gpio(LCM_E,0);

		mdelay(1);
		set_gpio(LCM_RS,0); 
		set_gpio(LCM_RW,1);
		set_gpio(LCM_E,0);
		mdelay(1);
		set_gpio(LCM_E,1);
		mdelay(1);
		value |= (GPJDAT & 0x0f);
		set_gpio(LCM_E,0);
		mdelay(1);

	}while(value & 0x80);	

	config_gpio(GPIO_DIRECTION_OUTPUT);
}

void lcm_writedata(unsigned char value)
{
	unsigned int sbuf;

	lcm_wait();
	
	sbuf= (value & 0xf0)>>4;

	sbuf |= (GPJDAT & 0x1f00);
	GPJDAT = sbuf;

	set_gpio(LCM_RS,1); 
	set_gpio(LCM_RW,0);
	set_gpio(LCM_E,0);
	mdelay(1);
	set_gpio(LCM_E,1);
	mdelay(1);
	set_gpio(LCM_E,0);
	mdelay(1);

	sbuf= value & 0x0f;

	sbuf |= (GPJDAT & 0x1f00);
	GPJDAT = sbuf;

	set_gpio(LCM_RS,1); 
	set_gpio(LCM_RW,0);
	set_gpio(LCM_E,0);
	mdelay(1);
	set_gpio(LCM_E,1);
	mdelay(1);
	set_gpio(LCM_E,0);
	mdelay(1);

}

void lcm_writecommand(unsigned char value,unsigned char wait_check)
{
	unsigned int sbuf;

	if(wait_check)
		lcm_wait();

	sbuf = (value & 0xf0)>>4;

	sbuf |= (GPJDAT & 0x1f00);
	GPJDAT = sbuf;

	set_gpio(LCM_RS,0);
	set_gpio(LCM_RW,0);
	set_gpio(LCM_E,0);
	mdelay(1);
	set_gpio(LCM_E,1);
	mdelay(1);
	set_gpio(LCM_E,0);
	mdelay(1);

	if((first_init==0)&&((value & 0xF0)==0x20))
	{	
		first_init=1;
		GPJDAT = sbuf;

		set_gpio(LCM_RS,0);
		set_gpio(LCM_RW,0);
		set_gpio(LCM_E,0);
		mdelay(1);
		set_gpio(LCM_E,1);
		mdelay(1);
		set_gpio(LCM_E,0);
		mdelay(1);
	}

	sbuf = value & 0x0f;

	sbuf |= (GPJDAT & 0x1f00);
	GPJDAT = sbuf;

	set_gpio(LCM_RS,0);
	set_gpio(LCM_RW,0);
	set_gpio(LCM_E,0);
	mdelay(1);
	set_gpio(LCM_E,1);
	mdelay(1);
	set_gpio(LCM_E,0);
	mdelay(1);

}

void lcm_puts(unsigned char x,unsigned char y,unsigned char value)
{
	y&=0x01;
	x&=0x0F;
	if(y)
	    x |= 0x40;

	x |= 0x80;
	lcm_writecommand(x,1);
	lcm_writedata(value);
}

void lcm_print(unsigned char x,unsigned char y,unsigned char *str)
{
	unsigned char length=0;
	
	y&=0x01;
	x&=0x0f;
	
	while(str[length]!='\0') {
	    if(x <= 15) {
		lcm_puts(x,y,str[length]);
		length++;
		x++;
	    }
	}
}

int lcm_init(void)
{
	lcm_writecommand(0x28,1);
	lcm_writecommand(0x08,1);
	lcm_writecommand(0x01,1);
	lcm_writecommand(0x06,1);
	lcm_writecommand(0x0c,1);

	lcm_print(0,0,"iPod Recorder");
	lcm_print(0,1,"Now,loading...");
	
	return 0;
}
#endif /* CONFIG_S3C2440 || CONFIG_DRIVER_TS1620 */

