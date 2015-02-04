/*
 * wkeys.c	Read a keypress from the standard input. If it is an escape
 *		code, return a special value.
 *
 *		WARNING: possibly the most ugly code in this package!
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID("$Id: wkeys.c,v 1.3 2003/04/19 16:31:27 al-guest Exp $")

#include <strings.h>

#include "port.h"
#include "minicom.h"
#include "intl.h"

#if KEY_KLUDGE && defined(linux)
#  include <sys/kd.h>
#  include <sys/ioctl.h>
#endif

/* If enabled, this will cause minicom to treat ESC [ A and
 * ESC O A the same (stupid VT100 two mode keyboards).
 */
#define VT_KLUDGE 0

static struct key _keys[NUM_KEYS];
static int keys_in_buf;
extern int setcbreak();

/*
 * The following is an external pointer to the termcap info.
 * If it's NOT zero then the main program has already
 * read the termcap for us. No sense in doing it twice.
 */
extern char *_tptr;

static char erasechar;
static int gotalrm;
extern int errno;
int pendingkeys = 0;
int io_pending = 0;

static char *func_key[] = { 
	"", "k1", "k2", "k3", "k4", "k5", "k6", "k7", "k8", "k9", "k0",
	"kh", "kP", "ku", "kl", "kr", "kd", "kH", "kN", "kI", "kD",
#ifdef _DGUX_SOURCE
	"kA", "kB", (char *)0 };
#else
	"F1", "F2", (char *)0 };
#endif
#if KEY_KLUDGE
/*
 * A VERY DIRTY HACK FOLLOWS:
 * This routine figures out if the tty we're using is a serial
 * device OR an IBM PC console. If we're using a console, we can
 * easily reckognize single escape-keys since escape sequences
 * always return > 1 characters from a read()
 */
static int isconsole;
 
static int testconsole()
{
  /* For Linux it's easy to see if this is a VC. */
  int info;

  return( ioctl(0, KDGETLED, &info) == 0);
}

/*
 * Function to read chunks of data from fd 0 all at once
 */

static int cread(c)
char *c;
{
  static char buf[32];
  static int idx = 0;
  static int lastread = 0;

  if (idx > 0 && idx < lastread) {
  	*c = buf[idx++];
	keys_in_buf--;
	if (keys_in_buf == 0 && pendingkeys == 0) io_pending = 0;
  	return(lastread);
  }
  idx = 0;
  do {
	lastread = read(0, buf, 32);
	keys_in_buf = lastread - 1;
  } while(lastread < 0 && errno == EINTR);

  *c = buf[0];
  if (lastread > 1) {
	idx = 1;
	io_pending++;
  }
  return(lastread);
}
#endif

static void _initkeys()
{
  int i;
  static char *cbuf, *tbuf;
  char *term;

  if (_tptr == CNULL) {
	if ((tbuf = (char *)malloc(512)) == CNULL || 
		(cbuf = (char *)malloc(2048)) == CNULL) {
  		write(2, _("Out of memory.\n"), 15);
  		exit(1);
	}
	term = getenv("TERM");
	switch(tgetent(cbuf, term)) {
  		case 0:
  			write(2, _("No termcap entry.\n"), 18);
  			exit(1);
  		case -1:
  			write(2, _("No /etc/termcap present!\n"), 25);
  			exit(1);
  		default:
  			break;
  	}
	_tptr = tbuf;
  }	
/* Initialize codes for special keys */
  for(i = 0; func_key[i]; i++) {
  	if ((_keys[i].cap = tgetstr(func_key[i], &_tptr)) == CNULL)
  		_keys[i].cap = "";
  	_keys[i].len = strlen(_keys[i].cap);
  }
#if KEY_KLUDGE
  isconsole = testconsole();
#endif
}
  
/*
 * Dummy routine for the alarm signal
 */
#ifndef HAVE_SELECT
static void dummy_alarm()
{
  gotalrm = 1;
}
#endif
  
/*
 * Read a character from the keyboard.
 * Handle special characters too!
 */
int wxgetch()
{
  int f, g;
  int match = 1;
  int len;
  unsigned char c;
  static unsigned char mem[8];
  static int leftmem = 0;
  static int init = 0;
  int nfound = 0;
  int start_match;
#if VT_KLUDGE
  char temp[8];
#endif
#ifdef HAVE_SELECT
  struct timeval timeout;
  fd_set readfds;
  static fd_set *nofds = (fd_set *)0;
#endif

  if (init == 0) {
  	_initkeys();
  	init++;
  	erasechar = setcbreak(3);
  }

  /* Some sequence still in memory ? */
  if (leftmem) {
	leftmem--;
	if (leftmem == 0) pendingkeys = 0;
	if (pendingkeys == 0 && keys_in_buf == 0) io_pending = 0;
	return(mem[leftmem]);
  }
  gotalrm = 0;
  pendingkeys = 0;

  for (len = 1; len < 8 && match; len++) {
#ifdef HAVE_SELECT
#if KEY_KLUDGE
	if (len > 1 && keys_in_buf == 0) {
#else
	if (len > 1) {
#endif
		timeout.tv_sec = 0;
		timeout.tv_usec = 400000; /* 400 ms */
#ifdef FD_SET
		FD_ZERO(&readfds);
		FD_SET(0, &readfds);
#else
		readfs = 1; /* First bit means file descriptor #0 */
#endif
#ifdef _HPUX_SOURCE
		/* HPUX prototype of select is mangled */
		nfound = select(1, (int *)&readfds,
				(int *)nofds, (int *)nofds, &timeout);
#else
		nfound = select(1, &readfds, nofds, nofds, &timeout);
#endif
		if (nfound == 0) {
			break;
		}
	}
#else /* HAVE_SELECT */
	if (len > 1) {
		signal(SIGALRM, dummy_alarm);
		alarm(1);
	}
#endif /* HAVE_SELECT */

#if KEY_KLUDGE
	while((nfound = cread(&c)) < 0 && (errno == EINTR && !gotalrm))
		;
#else
  	while ((nfound = read(0, &c, 1)) < 0 && (errno == EINTR && !gotalrm))
  		;
#endif

#ifndef HAVE_SELECT
	if (len > 1) alarm(0);
#endif
	if (nfound < 1) break;

  	if (len == 1) {
  	/* Enter and erase have precedence over anything else */
 	 	if (c == (unsigned char)'\n')
  			return c;
		if (c == (unsigned char)erasechar)
			return K_ERA;
  	}
#if KEY_KLUDGE
	/* Return single characters immideately */
	if (isconsole && nfound == 1 && len == 1) return(c);

	/* Another hack - detect the Meta Key. */
	if (isconsole && nfound == 2 && len == 1 &&
		c == 27 && escape == 27) {
		cread(&c);
		return(c + K_META);
	}
#endif
  	mem[len - 1] = c;
  	match = 0;
#if VT_KLUDGE
	/* Oh boy. Stupid vt100 2 mode keyboard. */
	strncpy(temp, mem, len);
	if (len > 1 && temp[0] == 27) {
		if (temp[1] == '[')
			temp[1] = 'O';
		else if (temp[1] == 'O')
			temp[1] = '[';
	}
	/* We now have an alternate string to check. */
#endif
	start_match = 0;
  	for (f = 0; f < NUM_KEYS; f++) {
#if VT_KLUDGE
  	    if (_keys[f].len >= len &&
		(strncmp(_keys[f].cap, (char *)mem,  len) == 0 ||
		 strncmp(_keys[f].cap, (char *)temp, len) == 0)) {
#else
	    if (_keys[f].len >= len && strncmp(_keys[f].cap, (char *)mem, len) == 0){
#endif
  			match++;
  			if (_keys[f].len == len) {
  				return(f + KEY_OFFS);
  			}
	    }
	    /* Does it match on first two chars? */
	    if (_keys[f].len > 1 && len == 2 &&
		strncmp(_keys[f].cap, (char *)mem, 2) == 0) start_match++;
	}
#if KEY_KLUDGE
	if (!isconsole)
#endif
#ifndef _MINIX /* Minix doesn't have ESC-c meta mode */
	/* See if this _might_ be a meta-key. */
	if (escape == 27 && !start_match && len == 2 && mem[0] == 27)
		return(c + K_META);
#endif
  }
  /* No match. in len we have the number of characters + 1 */
  len--; /* for convenience */
  if (len == 1) return(mem[0]);
  /* Remember there are more keys waiting in the buffer */
  pendingkeys++;
  io_pending++;

#ifndef HAVE_SELECT
  /* Pressing eg escape twice means escape */
  if (len == 2 && mem[0] == mem[1]) return(mem[0]);
#endif
  
  /* Reverse the "mem" array */
  for(f = 0; f < len / 2; f++) {
  	g = mem[f];
  	mem[f] = mem[len - f - 1];
  	mem[len - f - 1] = g;
  }
  leftmem = len - 1;
  return(mem[leftmem]);
}

