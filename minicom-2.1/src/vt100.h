/*
 * vt100.h	Header file for the vt100 emulator.
 *
 * 		$Id: vt100.h,v 1.1.1.1 2003/03/30 18:55:54 al-guest Exp $
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 */

/* Keypad and cursor key modes. */
#define NORMAL	1
#define APPL	2

/* Don't change - hardcoded in minicom's dial.c */
#define VT100	1
#define ANSI	3

/* Prototypes from vt100.c */
_PROTO( void vt_install, (void(*)(), void (*)(), WIN *));
_PROTO( void vt_init, (int, int, int, int, int));
_PROTO( void vt_pinit, (WIN *, int, int));
_PROTO( void vt_set, (int, int, FILE *, int, int, int, int, int));
_PROTO( void vt_out, (int ));
_PROTO( void vt_send, (int ch));

