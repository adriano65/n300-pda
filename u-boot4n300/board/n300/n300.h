/*
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 */
#define LCD_BPP		LCD_COLOR16
#define PAGE_SIZE	640*480*2

#include <lcd.h>

#define FCLK_SPEED 1

#if FCLK_SPEED==1		/* Fout = 399.65 MHz */
	#define M_MDIV	0x6e
	#define M_PDIV	0x3
	#define M_SDIV	0x1
#endif

#define USB_CLOCK 1

#if USB_CLOCK==0
	#define U_M_MDIV	0xA1
	#define U_M_PDIV	0x3
	#define U_M_SDIV	0x1
#elif USB_CLOCK==1
	#define U_M_MDIV	0x3C
	#define U_M_PDIV	0x4
	#define U_M_SDIV	0x2
#endif

#define mdelay(n) ({unsigned long msec=(n); while (msec--) udelay(1000);})
static int to_bcd(int value);
static int from_bcd(int value);

extern void keypad_init(void);

DECLARE_GLOBAL_DATA_PTR;

//get_board_rev
#define GOFORCEMEMSTART 	0x20000000
#define MEMSZ 				0xb20
#define GOFORCE_CH0 		GOFORCEMEMSTART+0x0000
#define GOFORCE_CH0_CMDFIFO GOFORCE_CH0+0x800
#define GOFORCE_ASYNCREG 	GOFORCE_CH0+0x2000
#define GOFORCE_SYNCREG 	GOFORCE_CH0+0x3000
#define VIDEOMEMSTART 		0x20020000	/* Obtained with HaRET*/


#define VIDEO_BASE_REG32(x) (*(volatile unsigned long *)(0x20000000+x))
//#define VIDEO_BASE_REG8(x) (*(volatile unsigned char *)(0x20000000+x))
//#define VIDEO_BASE_REG8(x) (*(volatile unsigned short *)(0x20000000+x))
#define VIDEO_BASE_REG32wDelay(x) delay(20); (*(volatile unsigned long *)(0x20000000+x))
#define VIDEO_BASE          VIDEO_BASE_REG32(0x0)

int sharp_lcd_init (void);
void n300_set_brightness(int tcmpb0);
extern void lcd_disable (void);
static const int rows = 4;
static const int cols = 3;

void SetRTCAlarm(void);
void ConfigSleepGPIO(S3C2440_GPIO * const);
void RestartFromSleep(void);



