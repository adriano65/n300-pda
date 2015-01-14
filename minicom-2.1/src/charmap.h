/*
 * charmap.h	Character mappings for the IBM character set
 *		to ISO-8859-1.
 *
 *		$Id: charmap.h,v 1.1.1.1 2003/03/30 18:55:48 al-guest Exp $
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 */
char wcharmap[256] = {
' ', 'O', 'o', 'V', '*', '@', '$', 'o', 'O', 'O', 'O', '^', '+', 'V', 'W', 'O',
'>', '<', '^', '!', '\xb6', '\xa7', '-', '^', '^', 'v', '>', '<', '+', '-', '^', 'v',
' ', '!', '\"','#', '$', '%', '&','\'', '(', ')', '*', '+', ',', '-', '.', '/',
'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ':', ';', '<', '=', '>', '?',
'@', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '[', '\\',']', '^', '_',
'`', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '|', '}', '~', '^',
/* 0x80 */ '\xc7', '\xfc', '\xe9', '\xe2', 'ä', '\xe0', 'å', '\xe7',
	   '\xea', '\xeb', '\xe8', '\xef', '\xee', '\xec', 'Ä', 'Å',
/* 0x90 */ '\xc9', '\xe6', '\xc6', '\xf4', 'ö', '\xf2', '\xfb', '\xf9',
	   '\xff', 'Ö', '\xdc', '\xa2', '\xa3', '\xa5', 'x', 'f',
/* 0xa0 */ '\xe1', '\xed', '\xf3', '\xfa', '\xf1', '\xd1', 'a', 'o',
	   '\xbf', 'R', '\xac', '\xbd', '\xbc', '\xa1', '\xab', '\xbb',
'#', '#', '#', '|', '+', 'Á', 'Â', 'À', '©', '+', '|', '+', '+', 'c', 'Y', '+',
'+', '+', '+', '+', 'Ä', 'Å', 'a', 'A', '+', '+', '+', '+', '+', '=', '+', 'o',
'o', 'D', 'E', 'E', 'E', '|', 'Ö', 'I', 'I', '+', '+', '#', '_', '|', 'I','\"',
/* 0xe0 */ 'a', '\xdf', 'T', 'p', 'ä', 'å', '\xb5', 'b',
	   'b', '0', 'O', 'U', '8', '\xd8', 'e','\'',
/* 0xf0 */ '=', '\xb1', '>', '<', 'f', 'J', 'ö', '=',
	   '\xb0', 'o', '\xb7', '/', 'n', '\xb2', '.', ' '
};
