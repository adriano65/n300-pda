/*
 * common.c	Functions common to minicom and runscript programs
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg,
 *		1997-1998 Jukka Lahtinen.
 *
 *		This program is free software; you can redistribute it or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 *		Functions
 *		char *pfix_home(char *) - prefix filename with home directory
 *		void do_log(char *)	- write a line to the logfile
 *
 *		moved from config.c to a separate file, so they are easier
 *		to use in both the Minicom main program and runscript.
 *
 * 27.10.98 jl  converted do_log to use stdarg
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID("$Id: common.c,v 1.2 2003/04/06 20:11:16 al-guest Exp $")

#include "port.h" 
#include "minicom.h"
#include <stdarg.h>

#if _HAVE_MACROS
/* Prefix a non-absolute file with the home directory. */
char *pfix_home(s)
char *s;
{
#if defined(FILENAME_MAX)
  static char buf[FILENAME_MAX];
#else
  static char buf[256];
#endif

  if (s && *s != '/') {
	snprintf(buf, sizeof(buf),"%s/%s", homedir, s);
	return(buf);
  }
  return(s);
}
#endif

void do_log(char *line, ...)
{
#ifdef LOGFILE
/* Write a line to the log file.   jl 22.06.97 */
  FILE *logfile;
#ifdef _HAVE_MACROS
  char *logname = pfix_home(logfname);
#else
  char *logname = logfname;
#endif
  struct tm *ptr;
  time_t    ttime;
  va_list   ap;

  if (logfname[0] == 0) return;
  logfile = fopen(logname,"a");
  if (!logfile) return;

  va_start(ap, line);
  ttime=time(NULL);
  ptr=localtime(&ttime);

  fprintf(logfile,"%04d%02d%02d %02d:%02d:%02d ",
	  (ptr->tm_year)+1900,(ptr->tm_mon)+1,ptr->tm_mday,
	  ptr->tm_hour,ptr->tm_min,ptr->tm_sec);
  vfprintf(logfile, line, ap);
  fprintf(logfile, "\n");
  fclose(logfile);
#else
  /* dummy, don't do anything */
#endif
}
