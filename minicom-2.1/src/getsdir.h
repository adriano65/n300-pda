
/*
 * getsdir.h
 *
 *	Datatypes and constants for getsdir() - a function to get and
 *	return a sorted directory listing.
 *
 *	$Id: getsdir.h,v 1.1.1.1 2003/03/30 18:55:51 al-guest Exp $
 *
 *	Copyright (c) 1998 by James S. Seymour (jseymour@jimsun.LinxNet.com)
 *
 *	This code is free software; you can redistribute it and/or
 *	modify it under the terms of the GNU General Public License
 *	as published by the Free Software Foundation; either version
 *	2 of the License, or (at your option) any later version.
 *
 *	Note: getsdir() uses "wildmat.c", which has different copyright
 *	and licensing conditions.  See the source, Luke.
 */

#include <dirent.h>

typedef struct dirEntry {		/* structure of data item */
   char fname[MAXNAMLEN + 1];		/* filename + terminating null */
   time_t time;				/* last modification date */
   mode_t mode;				/* file mode (dir? etc.) */
   ushort cflags;			/* caller field for convenience */
} GETSDIR_ENTRY;

#define GETSDIR_PARNT    0x01		/* include parent dir (..) */
#define GETSDIR_NSORT    0x02		/* sort by name */
#define GETSDIR_TSORT    0x04		/* sort by time (NSORT wins) */
/*
 * the following are only meaningful if NSORT or TSORT are specified
 */
#define GETSDIR_DIRSF    0x08		/* dirs first */
#define GETSDIR_DIRSL    0x10		/* dirs last */
#define GETSDIR_RSORT    0x20		/* reverse sort (does not affect
					   DIRSF/DIRSL */

_PROTO(extern int getsdir, (char *dirpath, char *pattern, int sortflags, \
    mode_t modemask, GETSDIR_ENTRY **datptr, int *len));

