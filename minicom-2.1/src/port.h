/*
 * port.h	General include file that includes all nessecary files
 *		for the configured system. This is a general file,
 *		not application dependant. It maybe a bit of overhead
 *		but simplifies porting greatly.
 *
 *		$Id: port.h,v 1.2 2003/03/30 19:33:25 godisch Exp $
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 */
#ifdef ISC
#  include <sys/bsdtypes.h>
#endif
#ifdef HAVE_SYS_PARAM_H
#  include <sys/param.h>
#endif
#include <sys/types.h>
#ifdef HAVE_UNISTD_H 
#  include <unistd.h>
#  include <stdlib.h>
#else
   char *getenv();
#endif
#ifdef HAVE_TERMCAP_H
#  include <termcap.h>
#else
  char *tgetstr(), *tgoto();
  int tgetent(), tputs(), tgetnum(), tgetflag();
#endif
#ifdef _UWIN2P0
# include <time.h>
# define MAXNAMLEN 80
#endif
#include <signal.h>
#include <fcntl.h>
#include <setjmp.h>
#include <sys/stat.h>
#ifdef _MINIX
#include <sys/times.h>
#else
#include <time.h>
#include <sys/time.h>
#endif
#include <string.h>
#include <stdio.h>
#include <pwd.h>
#include <ctype.h>
#include <errno.h>
#if defined(_BSD43) || defined(_SYSV) || (defined(BSD) && (BSD >= 199103))
#  define NOSTREAMS
#  include <sys/file.h>
#endif
#if defined(_COH42) || defined(_SEQUENT)
#  include <sys/select.h>
#endif

/* This one's for Coherent 3. What about Coherent 4 ? */
#ifdef _COH3
#  include <access.h>
#  define W_OK AWRITE
#  define R_OK AREAD
#endif

/* And for ancient systems like SVR2 */
#ifndef W_OK
#  define W_OK 2
#  define R_OK 4
#endif
#ifndef SEEK_SET
#  define SEEK_SET 0
#  define SEEK_END 2
#endif
#ifndef _NSIG
#  ifndef NSIG
#    define _NSIG 31
#  else
#    define _NSIG NSIG
#  endif
#endif

/* A general macro for prototyping. */
#ifndef _PROTO
#  if __STDC__
#    define _PROTO(fun, args) fun args
#  else
#  define _PROTO(fun, args) fun()
#  endif
#endif

#ifdef _COH42
#  define time_t long
#endif

/* Enable music routines. Could we use defined(i386) here? */
#if defined(__linux__) || defined(_COH42) || defined(_SCO)
#  ifdef HAVE_SELECT
#    define VC_MUSIC 1
#  endif
#endif

/* Availability of setreuid(uid_t, uid_t) */
#if defined(__GLIBC__) || defined(_BSD43) || (defined(BSD) && (BSD >= 199103))
#  define HAS_REUID
#endif

/* Availability of fchown(int, uid_t, gid_t) */
#if defined (_SYSV) || defined (_BSD43) || defined(_DGUX_SOURCE)
#  if !defined(_SVR2) && !defined(_SYSV3) && !defined(_COH42)
#    define HAS_FCHOWN
#  endif
#endif
