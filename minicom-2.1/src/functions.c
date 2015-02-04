/*
 * functions.c	This file contains the functions that talk to the modem
 *		and the serial port. It seperates the user interface
 *		from the low-level functions. The script language also
 *		uses these functions.
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 *  // jl 23.06.97 adjustable DTR drop time
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID("$Id: functions.c,v 1.1.1.1 2003/03/30 18:55:49 al-guest Exp $")

#include "port.h"
#include "minicom.h"

/*
 * Send a string to the modem.
 */
void m_puts(s)
char *s;
{
  char c;

  while(*s) {
  	if (*s == '^' && (*(s + 1))) {
  		s++;
  		if (*s == '^')
  			c = *s;
  		else
  			c = (*s) & 31;
  	} else
  		c = *s;
  	if (c == '~')
  		sleep(1);
  	else	
  		write(portfd, &c, 1);
  	s++;
  }
}

/* Hangup. */
void m_hangup()
{
  int sec=1;

  if (isdigit(P_MDROPDTR[0]))
    sscanf(P_MDROPDTR,"%2d",&sec);

  if (P_MDROPDTR[0] == 'Y' || (isdigit(P_MDROPDTR[0]) && sec > 0)) {
  	m_dtrtoggle(portfd, sec);  /* jl 22.06.97 */
  } else {
  	m_puts(P_MHANGUP);
  	sleep(1);
  }
  /* If we don't have DCD support fake DCD dropped */
  bogus_dcd = 0;
}

