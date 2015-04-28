/*
 * (C) Copyright 2002
 * Sysgo Real-Time Solutions, GmbH <www.elinos.com>
 * Marius Groeger <mgroeger@sysgo.de>
 *
 * (C) Copyright 2002
 * David Mueller, ELSOFT AG, <d.mueller@elsoft.ch>
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 */

#include <common.h>
#include <command.h>
#include <s3c2440.h>
#include <asm/arch/regs-gpio.h>
#include "n300.h"

DECLARE_GLOBAL_DATA_PTR;

/* If HDIVN is not 0, the CPU bus mode has to be changed from 
the fast bus mode to the asynchronousbus mode using following 
instructions(S3C2440 does not support synchronous bus mode).
If HDIVN is not 0 and the CPU bus mode is the fast bus mode, 
the CPU will operate by the HCLK.This feature can be used to 
change the CPU frequency as a half or more without affecting the 
HCLKand PCLK. 
Clock modes              iA      nF
    ------------------------------------------
    FastBus mode          0       0
    Synchronous           0       1
    Reserved              1       0
    Asynchronous          1       1 
*/
static inline void MMU_SetAsyncBusMode() {
        __asm__ ("mrc p15,0,r0,c1,c0,0\n"
				 "orr r0,r0,#0xc0000000 /*R1_nF:OR:R1_iA*/\n"
				 "mcr p15,0,r0,c1,c0,0");
}

static inline void MMU_SetFastBusMode() {
        __asm__ ("mrc p15,0,r0,c1,c0,0\n"
				 "bic r0,r0,#0xc0000000 /*R1_nF:OR:R1_iA*/\n"
				 "mcr p15,0,r0,c1,c0,0");
}


static int to_bcd(int value)
{
    return value / 10 * 16 + value % 10;
}

static int from_bcd(int value)
{
    return value / 16 * 10 + value % 16;
}

/*
 * Miscellaneous platform dependent initialisations
 */
void raise() {}

void abort() {}

int board_init (void) {

#if 0
	S3C24X0_CLOCK_POWER * const clk_power = S3C24X0_GetBase_CLOCK_POWER();

	/* to reduce PLL lock time, adjust the LOCKTIME register */
	clk_power->LOCKTIME = 0xFFFFFFFF;

	/* configure UPLL */
	clk_power->UPLLCON = ((U_M_MDIV << 12) + (U_M_PDIV << 4) + U_M_SDIV);

	/* some delay between MPLL and UPLL */
	delay (8000);

	/* configure MPLL */
	clk_power->MPLLCON = ((M_MDIV << 12) + (M_PDIV << 4) + M_SDIV);

	/* set up the I/O ports */
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	
	/* enable NAND writings */
	//"GPADAT |= (1 << 11)"
	gpio->GPADAT = 0xfe000800;
	gpio->GPACON = 0x005EA71F;

	gpio->GPBUP = 0x00001FFF;
	gpio->GPBDAT = 0x00000146;
	gpio->GPBCON = 0x00155455;
	
	gpio->GPCUP = 0x0000FFFF;
	gpio->GPCDAT = 0x12;
	gpio->GPCCON = 0x55551515;

	gpio->GPDUP = 0x0000EFFF;
	gpio->GPDDAT = 0x05514514;
	gpio->GPDCON = 0x00001000;
	
	gpio->GPEUP = 0x0000FFFF;
	//S3C2440_GPIO_PULLUP (GPEUP_, 6, GPIO_PULLUP_ENABLE);

	gpio->GPEDAT = 0x0;
	gpio->GPECON = 0x05555555;
	
	gpio->GPFUP = 0xff;
	gpio->GPFDAT = 0x00; 
	gpio->GPFCON = 0x02;
	
	gpio->GPGUP = 0x0000FFFF;
	gpio->GPGDAT= 0x00;
	gpio->GPGCON =0x01150010;
	
	gpio->GPHUP = 0x000007FF;
	gpio->GPHDAT= 0x200;
	gpio->GPHCON =0x0016faaa;			/* from SMDK24440 u-boot mod */

	gpio->GPJUP = 0x00001FFF;
	gpio->GPJDAT= 0x00001FFF;
	gpio->GPJCON =0x55555555;
	
/*
	s3c2410_gpio_cfgpin(S3C2410_GPH2, S3C2410_GPH2_TXD0);
	s3c2410_gpio_pullup(S3C2410_GPH2, 1);
	s3c2410_gpio_cfgpin(S3C2410_GPH3, S3C2410_GPH3_RXD0);
	s3c2410_gpio_pullup(S3C2410_GPH3, 1);	
 */	
#endif
	/* arch number of N300-Board for linux */
	gd->bd->bi_arch_number = MACH_TYPE_N300;		// 0x4E0

	/* address of boot parameters */
	gd->bd->bi_boot_params = PHYS_SDRAM_1 + 0x100;
	
	//gd->flags |= GD_FLG_RELOC;      /* tell others: relocation done */

	keypad_init();
	
	return 0;
}

int dram_init (void) {
	gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
	gd->bd->bi_dram[0].size = PHYS_SDRAM_1_SIZE;

	return 0;
}

int board_late_init(void) {
	// clears usb ints
	S3C24X0_USB_DEVICE * const usb_device = S3C24X0_GetBase_USB_DEVICE();
	usb_device->USB_INT_REG=0x04;
	S3C24X0_INTERRUPT * const interrupt = S3C24X0_GetBase_INTERRUPT();
	interrupt->SRCPND=BIT_USBD;
	
	S3C24X0_TIMERS * const timers = S3C24X0_GetBase_TIMERS();
	// timer4 is used by u-boot
	//timers->TCON &= ~(1<<20);
	// clears timer4 ints
	//interrupt->SRCPND=BIT_TIMER4;
	//interrupt->INTPND=BIT_TIMER4;
	
	// timer0 is used for lcd backlight dimming
	//timers->TCON &= ~(1);
	// clears timer0 ints
	//interrupt->SRCPND=BIT_TIMER0;
	//interrupt->INTPND=BIT_TIMER0;
	
	return 0;
}

#if 0
/* called when looping */
void show_activity(int arg) {
	do_poll();
}
#endif

int print_cpuinfo (void) {
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	
	printf("cpuinfo: FCLK %3.3d Mhz (arm920t core)\n", get_FCLK()/1000/1000);
	printf("         HCLK %3.3d Mhz (AHB Bus -> USB Host, NAND, ...)\n", get_HCLK()/1000/1000);
	printf("         PCLK %3.3d Mhz (AHB Bus -> WDT, MMC, ...)\n", get_PCLK()/1000/1000);
	printf("         UCLK %3.3d Mhz (USB Host and Device)\n\n", get_UCLK()/1000/1000);
	printf("Boot reason: %s \n", (gpio->GSTATUS2 & S3C2410_GSTATUS2_WTRESET) ? "Watchdog" : 
								 ((gpio->GSTATUS2 & S3C2410_GSTATUS2_OFFRESET) ? "Sleep" :
								 ((gpio->GSTATUS2 & S3C2410_GSTATUS2_PONRESET) ? "Power ON" : "") ));
	printf("GSTATUS3 == 0x%08X\n", gpio->GSTATUS3); 
	printf("GSTATUS4 == 0x%08X\n", gpio->GSTATUS4); 
	return (0);
}

#if (CFG_CMD_IRQ)
void do_irqinfo(cmd_tbl_t *cmdtp, bd_t *bd, int flag, int argc, char *argv[]) {
	S3C24X0_INTERRUPT * const interrupt = S3C24X0_GetBase_INTERRUPT();
	
	printf("INTMASK (0x%08X) 0x%08X\n", &(interrupt->INTMSK), interrupt->INTMSK );
	printf("INTMOD (0x%08X) 0x%08X\n", &(interrupt->INTMOD), interrupt->INTMOD );
	printf("INTSUBMSK (0x%08X) 0x%08X\n", &(interrupt->INTSUBMSK), interrupt->INTSUBMSK );
	printf("SRCPND (0x%08X) 0x%08X\n", &(interrupt->SRCPND), interrupt->SRCPND );
	printf("INTPND (0x%08X) 0x%08X\n", &(interrupt->INTPND), interrupt->INTPND );	
	printf("INTOFFSET (0x%08X)0x%08X\n\n", &(interrupt->INTOFFSET), interrupt->INTOFFSET );
	
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	printf("EINTMASK (0x%08X) 0x%08X\n", &(gpio->EINTMASK), gpio->EINTMASK );
	printf("EINTPEND (0x%08X) 0x%08X\n", &(gpio->EINTPEND), gpio->EINTPEND );
	printf("EXTINT0 (0x%08X) 0x%08X\n", &(gpio->EXTINT0), gpio->EXTINT0 );
	printf("EXTINT1 (0x%08X) 0x%08X\n", &(gpio->EXTINT1), gpio->EXTINT1 );
	printf("EXTINT2 (0x%08X) 0x%08X\n\n", &(gpio->EXTINT2), gpio->EXTINT2 );
	
	S3C24X0_RTC * const rtc = S3C24X0_GetBase_RTC();
	printf("RTCCON (0x%08X) 0x%02X\n", &(rtc->RTCCON), rtc->RTCCON );	
	printf("RTCALM (0x%08X) 0x%02X\n", &(rtc->RTCALM), rtc->RTCALM );	
	printf("ALMSEC (0x%08X) 0x%02X\n\n", &(rtc->ALMSEC), rtc->ALMSEC );
	
	S3C24X0_USB_DEVICE * const usb_device = S3C24X0_GetBase_USB_DEVICE();
	printf("USB_INT_REG (0x%08X) 0x%02X\n", &(usb_device->USB_INT_REG), usb_device->USB_INT_REG );

	S3C24X0_TIMERS * const timers = S3C24X0_GetBase_TIMERS();
	printf("TCON (0x%08X) 0x%08X\n", &(timers->TCON), timers->TCON );
	printf("TCFG1 (0x%08X) 0x%08X\n", &(timers->TCFG1), timers->TCFG1 );
}
#endif

void get_board_serial(struct tag_serialnr *serialnr) {
  serialnr->high=1;
  serialnr->low=14;
}


#if defined(CONFIG_SHOW_BOOT_PROGRESS)
void show_boot_progress(int progress) {
	printf("Boot stage %d\n", progress);
}
#else
void show_boot_progress(int progress) {
}

#endif

#if 0
static inline void EnterSleep() {
  /*
  ; Function for entering power down mode \
  ; 1. SDRAM should be in self-refresh mode. 
  ; 2. All interrupt should be maksked for SDRAM / DRAM self-refresh. 
  ; 3. LCD controller should be disabled for SDRAM / DRAM self-refresh. 
  ; 4. The I-cache may have to be turned on. 
  ; 5. The location of the following code may have not to be changed. 
  */

  // To void EnterPWDN (int CLKCON); 
 __asm__ ("EnterPWDN"
		  "MOV R2, R0"    	// R2 = rCLKCON 
		  "tst r0, # 0x8"   // SLEEP mode? 
		  "BNE ENTER_SLE"

		  "ENTER_STOP "
		  "ldr r0, = REFRESH "
		  "LDR r3, [r0]    	"	// R3 = rREFRESH 
		  "MOV r1, r3 "
		  "orr r1, r1, # BIT_SELFREFRESH "
		  "str r1, [r0]"		// Enable SDRAM self-refresh 

		  "mov r1, # 16 " 		//   Wait until self-refresh is issued. May not be needed. 
		  "0    subs r1, r1, # 1 
		  "bne% B0 "
		  "ldr r0, = CLKCO	"	//	; Enter STOP Mode. 
		  "str r2, [r0] "
		  "mov r1, # 32 "
		  "0    subs r1, r1, # 1"	// 1) wait until the STOP mode is in effect. 
		  "bne% B0 "  				// 2) Or wait here until the CPU & Peripherals will be turned-off 
									// Entering SLEEP mode, only the reset by wake-up is available. 
		  "ldr r0, = REFRESH"		// exit from SDRAM self refresh mode. 
		  "str r3, [r0]"

		  "MOV_PC_LR "


		  ENTER_SLEEP 
		  ; NOTE. 
		  ; 1) rGSTATUS3 should have the return address after wake-up from SLEEP mode. 


		  ldr r0, = REFRESH 
		  ldr r1, [r0]    ; R1 = rREFRESH 
		  orr r1, r1, # BIT_SELFREFRESH 
		  str r1, [r0]    ; Enable SDRAM self-refresh 


		  mov r1, # 16    ; Wait until self-refresh is issued, which may not be needed. 
		  0    subs r1, r1, # 1 
		  bne% B0 


		  ldr    r1, = MISCCR 
		  ldr    R0, [r1] 
		  orr    r0, r0, # (7 << 17); Set SCLK0 = 0, SCLK1 = 0, SCKE = 0. 
		  str    R0, [r1] 


		  ldr r0, = CLKCON ; Enter Sleep Mode 
		  str r2, [r0] 


b.    		; CPU will die here. 



  ;24, read MISCCR register value, the value is set when entering Sleep mode,

  ;BIC instruction: The BIC (BIt Clear) instruction performs an AND operation on the bits in Rn with the complements of the corresponding bits in the value of Operand2.

  WAKEUP_SLEEP 
  ; Release SCLKn after wake-up from the SLEEP mode. 
  ldr    r1, = MISCCR 
  ldr    R0, [r1] 
  bic    r0, r0, # (7 << 17); SCLK0: 0 -> SCLK, SCLK1: 0 -> SCLK, SCKE: 0 -> = SCKE. 
  str    R0, [r1] 

  ;25, set from Sleep Wakeup state, then began to set the Memory Control register

  ;BWSCON: BUS WIDTH & WAIT CONTROL REGISTER

  ;SMRDATA a label is defined in this document is the starting address of a memory, this memory 13 * 4 = 52 bytes

  The following line, the first line of 0 indicates that mean? Local label

  The following line% B0 said what does that mean? A reference to a local label, B Backward

  The value in the memory SMRDATA beginning, set the to the BWSCON address register, a total of 13 registers

 ; Set memory control registers 
ldr    r0, = SMRDATA 
ldr    r1, = BWSCON ; BWSCON Address 
add  

0 
ldr    r3, [r0], # 4 
str    r3, [r1], # 4 
cmp    r2, r0 
bne    % B0 


Here is the implementation of 256 subtraction, no particular usefulness is purely a waste of CPU time, waiting for the other hardware to complete the operation

 mov r1, # 256 
0    subs r1, r1, # 1 ; 1) wait until the SelfRefresh is released. 
bne% B0 



Here should be to restore the state before the Sleep proceed. . .

 ldr r1, = GSTATUS3 ; GSTATUS3 has the start address just after SLEEP wake-up 
LDR r0, [r1] 
mov pc, r0

#endif

void go2sleep(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[]){
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	ConfigSleepGPIO(gpio);

	//Interrupt initialization
	S3C24X0_INTERRUPT * const interrupt = S3C24X0_GetBase_INTERRUPT();
   	interrupt->SRCPND = 0x00000000;	// clears all pending requests
   	interrupt->INTPND = 0x00000000;	// clears all pending requests
    interrupt->INTMOD = 0;			// set all ints to IRQ mode (not FIQ)
	//SetRTCAlarm(); return;
	
   	interrupt->INTMSK = ~(BIT_RTC);
    //interrupt->INTSUBMSK |= (BIT_RTC | BIT_EINT0);
    interrupt->INTSUBMSK |= (BIT_RTC);

    // USB suspend mode
    gpio->MISCCR |= (1<<12); //USB port0 = suspend    
    gpio->MISCCR |= (1<<13); //USB port1 = suspend    	

	// Data Bus Pull-up
	gpio->MISCCR &= ~(3<<0);     //disable
    
    //Lcd Off
	lcd_disable();
	  
    //gpio->EXTINT0 &= ~(7<<0)|(2<<0);  //EINT0=falling edge triggered    
    //gpio->GPFCON &= ~(3<<0)|(2<<0); //PF0=EINT0    
    
    // S3C2440 will wake up by RTC alarm (10 sec) or EINT0   
    SetRTCAlarm();

    // ADC TOUCH SCREEN STAND BY
    //rADCCON|=(1<<2);   
 
    // set restart address in GSTATUS3   
    //gpio->GSTATUS3 = (void *)RestartFromSleep;  // memory control part in startup code. MUST be in SteppingStone Static RAM !!
    gpio->GSTATUS3 = (void *)0x00000000;  // memory control part in startup code.    
   
	// ----------------------------------------- REAL SLEEP	
	S3C24X0_MEMCTL * const memctl = S3C24X0_GetBase_MEMCTL();
	memctl->REFRESH |= REFEN;			// Enable SDRAM self-refresh
	mdelay(1);
	
	S3C24X0_CLOCK_POWER * const clk_power = S3C24X0_GetBase_CLOCK_POWER();	
	gpio->MISCCR |= (7 << 17);	// Set SCLK0 = 1, SCLK1 = 1, SCKE = 1 to protect SDRAM

	clk_power->CLKCON = 0x04; // Enter Sleep Mode 
  
	for (;;);	//endless loop

}

void RestartFromSleep(void) {
  //__asm__ ("EnterPWDN");
  //do_reset(NULL, 0, 0, NULL);
  reset_cpu (0);
}

void ConfigSleepGPIO(S3C2440_GPIO * const gpio) {
	S3C2440_GPIO_CONFIG(gpio->GPCCON, 13, GPIO_INPUT);
	S3C2440_GPIO_CONFIG(gpio->GPCCON, 14, GPIO_INPUT);
	S3C2440_GPIO_CONFIG(gpio->GPCCON, 15, GPIO_INPUT);
}

void SetRTCAlarm(void) {
	#define TESTYEAR    (0x00)
	#define TESTMONTH   (0x12)
	#define TESTDATE    (0x31)
	#define TESTDAY     (0x06)  // SUN:1 MON:2 TUE:3 WED:4 THU:5 FRI:6 SAT:7  
	#define TESTHOUR    (0x23)
	#define TESTMIN     (0x59)
	#define TESTSEC     (0x59)
	
	#define TESTYEAR2   (0x01)
	#define TESTMONTH2  (0x01)
	#define TESTDATE2   (0x01)
	#define TESTDAY2    (0x07)  // SUN:1 MON:2 TUE:3 WED:4 THU:5 FRI:6 SAT:7  
	#define TESTHOUR2   (0x00)
	#define TESTMIN2    (0x00)
	#define TESTSEC2    (0x00)
	S3C24X0_RTC * const rtc = S3C24X0_GetBase_RTC();
	
	rtc->RTCCON = 0x1;	// write to register enabled, 1/32768, Normal(merge), No reset
	rtc->TICNT = 0x0;	// Tick time count disabled
 
	/*
    rtc->BCDYEAR = TESTYEAR;
    rtc->BCDMON  = TESTMONTH;
    rtc->BCDDAY  = TESTDAY; // SUN:1 MON:2 TUE:3 WED:4 THU:5 FRI:6 SAT:7
    rtc->BCDDATE = TESTDATE;
    rtc->BCDHOUR = TESTHOUR;
    rtc->BCDMIN  = TESTMIN;
    rtc->BCDSEC  = TESTSEC;
    rtc->ALMYEAR=TESTYEAR2 ;
    rtc->ALMMON =TESTMONTH2;
    rtc->ALMDATE=TESTDATE2  ;
    rtc->ALMHOUR=TESTHOUR2 ;
    rtc->ALMMIN =TESTMIN2  ;
    rtc->ALMSEC =TESTSEC2+3;
	
    rtc->ALMYEAR=rtc->BCDYEAR;
    rtc->ALMMON =rtc->BCDMON;
    rtc->ALMDATE=rtc->BCDDATE;
    rtc->ALMHOUR=rtc->BCDHOUR;
    rtc->ALMMIN =rtc->BCDMIN;
	*/
	
    rtc->ALMSEC = to_bcd( (from_bcd(rtc->BCDSEC) > 45) ? 0 : from_bcd(rtc->BCDSEC)+10 );
    //rtc->ALMSEC = 0;	// every minute
	
    rtc->RTCALM = RTC_BIT_ALMEN | RTC_BIT_SECEN;	// only seconds alarm enable
 
    rtc->RTCCON=0x0;   // write disabled (to prevent unwanted writes when sleeping)
  
}

U_BOOT_CMD(
	go2sleep,	1,	0,	go2sleep,
	"go2sleep - go to sleep and wake up after n seconds\n",
	NULL
);


