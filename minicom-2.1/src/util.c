/*
 * util.c       Little helper routines that didn't fit anywhere else.
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 * jseymour@jimsun.LinxNet.com (Jim Seymour) 03/26/98 - Added get_port()
 *    function to support multiple port specifications in config.
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID("$Id: util.c,v 1.1.1.1 2003/03/30 18:55:54 al-guest Exp $")

#include "port.h"
#include "minicom.h"
#include "intl.h"

static int not_suid = -1;

/*
 * A modified version of the getargs routine.
 */
static int getargs(s, arps, maxargs)
register char *s;
char *arps[];
int maxargs;
{
	register int i;
	register char *sp;
	register char qchar;
	int literal = 0;

	i = 0;
	while (i < maxargs) {
		while (*s == ' ' || *s == '\t')
			++s;
		if (*s == '\n' || *s == '\0')
			break;
		arps[i++] = sp = s;
		qchar = 0;
		while(*s != '\0'  &&  *s != '\n') {
			if (literal) {
				literal = 0;
				*sp++ = *s++;
				continue;
			}
			literal = 0;
			if (qchar == 0 && (*s == ' ' || *s == '\t')) {
				++s;
				break;
			}
			switch(*s) {
			default:
				*sp++ = *s++;
				break;
			case '\\':
				literal = 1;
				s++;
				break;	
			case '"':
			case '\'':
				if(qchar == *s) {
					qchar = 0;
					++s;
					break;
				}
				if(qchar)
					*sp++ = *s++;
				else
					qchar = *s++;
				break;
			}
		}
		*sp++ = 0;
	}
	if (i >= maxargs)
		return -1;
	arps[i] = (char *)0;
	return i;
}

/*
 * Is a character from s2 in s1?
 */
static int anys(s1, s2)
char *s1, *s2;
{
  while(*s2)
  	if (strchr(s1, *s2++) != (char *)NULL) return(1);
  return(0);
}

/*
 * If there is a shell-metacharacter in "cmd",
 * call a shell to do the dirty work.
 */
int fastexec(cmd)
char *cmd;
{
  char *words[128];
  char *p;

  if (anys(cmd, "~`$&*()=|{};?><"))
  	return(execl("/bin/sh", "sh", "-c", cmd, (char *)0));

  /* Delete escape-characters ment for the shell */
  p = cmd;
  while((p = strchr(p, '\\')) != (char *)NULL)
  	strcpy(p, p + 1);

  /* Split line into words */
  if (getargs(cmd, words, 127) < 0) {
  	return(-1);
  }
  return (execvp(words[0], words));
}

/*
 * Fork, then redirect I/O if neccesary.
 * in    : new stdin
 * out   : new stdout
 * err   : new stderr
 * Returns exit status of "cmd" on success, -1 on error.
 */
int fastsystem(cmd, in, out, err)
char *cmd, *in, *out, *err;
{
  int pid;
  int st;
  int async = 0;
  char *p;

  /* If the command line ends with '&', don't wait for child. */
  p = strrchr(cmd, '&');
  if (p != (char *)0 && !p[1]) {
  	*p = 0;
  	async = 1;
  }
  
  /* Fork. */
  if ((pid = fork()) == 0) { /* child */
  	if (in != (char *)NULL) {
  		close(0);
  		if (open(in, O_RDONLY) < 0) exit(-1);
  	}
  	if (out != (char *)NULL) {
  		close(1);
  		if (open(out, O_WRONLY) < 0) exit(-1);
  	}
  	if (err != (char *)NULL) {
  		close(2);
  		if (open(err, O_RDWR) < 0) exit(-1);
  	}
  	exit(fastexec(cmd));
  } else if (pid > 0) { /* parent */
  	if (async) return(0);
  	pid = m_wait(&st);
  	if (pid < 0) return(-1);
  	return(st);
  }
  return(-1);
}

/* Drop all priviliges (irreversable). */
void drop_all_privs()
{
#ifdef HAS_REUID
  /* Regain privs needed to drop privs :) */
  setregid(real_gid, eff_gid);
  setreuid(real_uid, eff_uid);
#endif

  /* Drop it. */
  setgid(real_gid);
  setuid(real_uid);
  eff_uid = real_uid;
  eff_gid = real_gid;
  not_suid = 1;
}

/* Drop priviliges (swap uid's) */
void drop_privs()
{
#ifdef HAS_REUID
  setregid(eff_gid, real_gid);
  if (setreuid(eff_uid, real_uid) < 0)
	fprintf(stderr, _("minicom: cannot setreuid(%d, %d)\n"), eff_uid, real_uid);
  not_suid = 1;
#endif
}

/* Set priviliges (swap uid's) */
void set_privs()
{
#ifdef HAS_REUID
  setregid(real_gid, eff_gid);
  if (setreuid(real_uid, eff_uid) < 0)
	fprintf(stderr, _("minicom: cannot setreuid(%d, %d)\n"), real_uid, eff_uid);
  not_suid = 0;
#endif
}

/* Safe fopen for suid programs. */
FILE *sfopen(file, mode)
char *file;
char *mode;
{
#ifdef HAS_REUID
  int saved_errno;
#else
  char *p, buf[128];
  struct stat stt;
  int do_chown = 0;
#endif
  FILE *fp;

  /* Initialize. */
  if (not_suid < 0) not_suid = (real_uid == eff_uid);

  /* If we're not running set-uid at the moment just open the file. */
  if (not_suid) return (fopen(file, mode));

#ifdef HAS_REUID
  /* Just drop priviliges before opening the file. */
  drop_privs();
  fp = fopen(file, mode);
  saved_errno = errno;
  set_privs();
  errno = saved_errno;
  return(fp);
#else

  /* Read access? */
  if (strcmp(mode, "r") == 0) {
	if (access(file, R_OK) < 0) return(NULL);
	return(fopen(file, mode));
  }

  /* Write access test. */
  if (stat(file, &stt) == 0) {
	if (access(file, W_OK) < 0) return(NULL);
  } else {
	/* Test if directory is writable. */
	strncpy(buf, file, sizeof(buf));
	if((p = strrchr(buf, '/')) == (char *)NULL)
  		strcpy(buf, ".");
	else
		*p = '\0';
	if (access(buf, W_OK) < 0) return(NULL);
	do_chown = 1;
  }

  /* Now open/create the file. */
  if ((fp = fopen(file, mode)) == NULL) return(fp);
  if (!do_chown) return(fp);

#ifndef HAS_FCHOWN
  /* There is a security hole / race condition here. */
  (void) chown(file, (uid_t)real_uid, (gid_t)real_gid);
#else
  /* But this is safe. */
  (void) fchown(fileno(fp), (uid_t)real_uid, (gid_t)real_gid);
#endif /* HAS_FCHOWN */
  return(fp);
#endif /* HAS_REUID */
}

/*
 * Get next port from a space-, comma-, colon-, or semi-colon-separated
 * list (we're easy :-)) in a PARS_VAL_LEN length string.
 *
 * Returns NULL pointer on end-of-list.
 *
 * This would appear to be more complicated than it needs be.
 *
 * WARNING: Not MT-safe.  Multiple calls to this routine modify the same
 * local static storage space.
 */
char *
get_port(char *port_list)
{
  static char next_port[PARS_VAL_LEN];
  static char loc_port_list[PARS_VAL_LEN];
  static char *sp = NULL;
  static char *ep;

  /* first pass? */
  if(sp == NULL) {
    strncpy(loc_port_list, port_list, PARS_VAL_LEN);
    loc_port_list[PARS_VAL_LEN] = (char) 0;
    ep = &loc_port_list[strlen(loc_port_list)];
    sp = strtok(loc_port_list, ":;, ");
  }
  else if(*sp != (char) 0) {
    sp = strtok(sp, ":;, ");
  }
  else
    sp = NULL;

  if(sp != NULL) {
       strncpy(next_port, sp, PARS_VAL_LEN);
       next_port[PARS_VAL_LEN] = (char) 0;
       /* point to next token--skipping multiple occurrences of delimiters */
       for(sp += strlen(next_port); sp != ep && *sp != '/'; ++sp)
	 ;
       return(next_port);
  }
  else {
    return(NULL);
  }
}
