/*
 * TS1620 LCD Module support
 */

#ifndef _TS1620_H_
#define _TS1620_H_

void lcm_puts(unsigned char x,unsigned char y,unsigned char value);
void lcm_print(unsigned char x,unsigned char y,unsigned char *str);
int lcm_init(void);

#endif	/* _TS1620_H_ */
