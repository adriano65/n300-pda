/*
 * keyboard.h	Constants to talk to the keyboard driver.
 *
 * 		$Id: keyboard.h,v 1.1.1.1 2003/03/30 18:55:51 al-guest Exp $
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 */
#define KSTOP		1
#define KKPST		2
#define KVT100		3
#define KANSI		4
#define KMINIX		5
#define KSTART		6
#define KKPAPP		7
#define KCURST  	8
#define KCURAPP		9
#define KSIGIO		10
#define KSETESC		11
#define KSETBS		12
#define KGETKEY		13

#if defined (_COHERENT) && !defined(SIGUSR1)
#  define SIGUSR1 SIGDIVE
#  define SIGUSR2 SIGOVFL
#endif
#define HELLO		SIGUSR1
#define ACK		SIGUSR2

#define KINSTALL 	100
#define KUNINSTALL	101
