/*
 * updown.c	Routines to do up and downloading by calling external
 *		programs (sz, rz, kermit).
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 * jl 13.09.97	pass actual terminal lines (LINES - statusline)
 *		to runscript in environment variable TERMLIN
 * jl 16.09.97	logging of sz/rz file transfers
 * jl 29.09.97	fix on the transfer logging
 * hgk&jl 2.98	filename selection window
 * acme 25.02.98 i18n
 * js&jl 04.98	the better filename selection window
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID("$Id: updown.c,v 1.1.1.1 2003/03/30 18:55:54 al-guest Exp $")

#include "port.h"
#include "minicom.h"
#include "intl.h"

/*#define LOG_XFER	  debugging option to log all output of rz/sz
 */
static int udpid;

/*
 * Change to a directory.
 */
static int mcd(dir)
char *dir;
{
  char buf[256];
  char err[50];
  static char odir[256];
  static int init = 0;

  if (!init) {
  	if (*dir == 0) return(0);
  	init = 1;
#if defined (_COH3) || defined(NeXT)
	getwd(odir);
#else
  	getcwd(odir, 255);
#endif
  }
  if (*dir == 0) {
  	chdir(odir);
  	return(0);
  }
  
  if(*dir != '/') {
  	snprintf(buf, sizeof(buf), "%s/%s", homedir, dir);
  	dir = buf;
  }
  if (chdir(dir) < 0) {
  	/* This may look safe but you might I8N change the string! so
  	   snprintf it */
  	snprintf(err, sizeof(err),  _("Cannot chdir to %.30s"), dir);
  	werror("%s", err);
  	return(-1);
  }
  return(0);
}

/*
 * Catch the CTRL-C signal.
 */
/*ARGSUSED*/
static void udcatch(dummy)
int dummy;
{
  (void)dummy;
  signal(SIGINT, udcatch);
  if (udpid) kill((pid_t)udpid, SIGKILL);
}

/*
 * Translate %b to the current bps rate, and
 *           %l to the current tty port.
 *           %f to the serial port file descriptor
 */
static char *translate(s)
char *s;
{
  static char buf[128];
  char str_portfd[8];     /* kino */
  int i;

  for(i = 0; *s && i < 127; i++, s++) {
  	if (*s != '%') {
  		buf[i] = *s;
  		continue;
  	}
  	switch(*++s) {
  		case 'l':
  			strncpy(buf + i, dial_tty, sizeof(buf)-i);
  			i += strlen(dial_tty) - 1;
  			break;
  		case 'b':
  			strncpy(buf + i, P_BAUDRATE, sizeof(buf)-i);
  			i += strlen(P_BAUDRATE) - 1;
  			break;
 		case 'f':
		  	sprintf(str_portfd, "%d", portfd);
                        strncpy(buf + i, str_portfd, sizeof(buf)-i);
                        i += strlen(str_portfd) - 1;
                        break;
  		default:
  			buf[i++] = '%';
  			buf[i] = *s;
  			break;
  	}
  }
  buf[i] = 0;
  return(buf);
}

/*
 * Trim the leading & trailing whitespaces from the string
 * jl 15.09.97
 */
char *trim(char *outstring, char *instring, int n)
{
  char *p;
  char *ip;
  char *op;
  char *np;

  ip = instring;
  np = ip + n;
  while ((*ip <= ' ') && (ip < np)) ip++;

  op = outstring;
  np = op + n;
  while ((*ip >= ' ') && (op <= np)) {
    *op = *ip;
    ip++;
    op++;
  }

  if (op<np)
    *op = 0;

  while ((op > outstring) && (*op <= ' ')) {
    *op = 0;
    op--;
  }

  p = outstring;
  return(p);
}
  
/*
 * Choose from numerous up and download protocols!
 */

void updown(what, nr)
int what;
int nr;
{
#ifdef LOG_XFER
  #warning LOG_XFER defined!
  FILE *xfl;
#endif
  char *name[13];
  int idx[13];
  int r, f, g = 0;
  char *t = what == 'U' ? _("Upload") : _("Download");
  char buf[160];
  char buffirst[20];
  char xfrstr[160] = "";
  char trimbuf[160] = "";
  char title[64];
  char *s ="";
  int pipefd[2];
  int n, status;
  char cmdline[128];
  WIN *win = (WIN *)NULL;
#if VC_MUSIC
  _PROTO(void music, (void));
#endif

  if (mcd(what == 'U' ? P_UPDIR : P_DOWNDIR) < 0)
  	return;

  /* Automatic? */
  if (nr == 0) {
	for(f = 0; f < 12; f++) {
  		if (P_PNAME(f)[0] && P_PUD(f) == what) {
  			name[g] = P_PNAME(f);
  			idx[g++] = f;
  		}
	}
	name[g] = CNULL;
	if (g == 0) return;

	r = wselect(30, 7, name, NIL_FUNLIST, t, stdattr, mfcolor, mbcolor) - 1;
	if (r < 0) return;

	g = idx[r];
  } else g = nr;

  buf[0] = 0;

/* jseymour file selector with choice of dir on zmodem, etc. download */
#if 1
  {
	int multiple; /* 0:only directory, 1:one file, -1:any number */
	
	if(P_MUL(g)=='Y') {
	    /* need file(s), or just a directory? */
	    multiple = what == 'U'? -1 : 0;
	}
	else {
	    multiple = 1;	/* only one allowed */
	}

	if (P_FSELW[0] == 'Y' && (what == 'U' || P_ASKDNDIR[0] == 'Y')) {
	  s = filedir(multiple, what == 'U'? 0 : 1);
	  if (s == NULL)
	    return;
	}
	else if (P_PNN(g) == 'Y') {
	  s = input(_("Please enter file names"), buf);
	  if (s == NULL)
	    return;
	}

	/* discard directory if "multiple" == 0 */
	snprintf(cmdline, sizeof(cmdline), "%s %s", P_PPROG(g), multiple == 0? "" : s);
  }
#endif

  if (P_LOGXFER[0] == 'Y')
    do_log("%s", cmdline);   /* jl 22.06.97 */

  if (P_PFULL(g) == 'N') {
    win = wopen(10, 7, 70, 13, BSINGLE, stdattr, mfcolor, mbcolor, 1, 0, 1);
    snprintf(title, sizeof(title), _("%.30s %s - Press CTRL-C to quit"), P_PNAME(g),
	    what == 'U' ? _("upload") : _("download"));
    wtitle(win, TMID, title);
    pipe(pipefd);
  } else
    wleave();

  switch(udpid = fork()) {
  	case -1:
  		werror(_("Out of memory: could not fork()"));
		if (win) {
  			close(pipefd[0]);
  			close(pipefd[1]);
	  		wclose(win, 1);
		} else
			wreturn();
  		(void) mcd("");
  		return;
  	case 0: /* Child */
		if (P_PIORED(g) == 'Y') {
  			dup2(portfd, 0);
  			dup2(portfd, 1);
		}
		if (win) {
  			dup2(pipefd[1], 2);
  			close(pipefd[0]);
  			if (pipefd[1] != 2) close(pipefd[1]);
  		}
  		for(n = 1; n < _NSIG; n++) signal(n, SIG_DFL);
  		
		set_privs();
		setgid((gid_t)real_gid);
  		setuid((uid_t)real_uid);
  		(void) fastexec(translate(cmdline));
  		exit(1);
  	default: /* Parent */
  		break;
  }
  if (win) {
	(void) setcbreak(1); /* Cbreak, no echo. */
	enab_sig(1, 0);	       /* But enable SIGINT */
  }
  signal(SIGINT, udcatch);
  if (P_PIORED(g) == 'Y') {
	close(pipefd[1]);
#ifdef LOG_XFER
	xfl=fopen("xfer.log","wb");
#endif
	while((n = read(pipefd[0], buf, sizeof(buf))) > 0) {
	  	buf[n] = '\0';
  		wputs(win, buf);
		timer_update();
		/* Log the filenames & sizes 	jl 14.09.97 */
		if (P_LOGXFER[0] == 'Y') {
#ifdef LOG_XFER
		  if (xfl)
		    fprintf(xfl,">%s<\n",buf);
#endif
		  if (sscanf(buf, "%19s", buffirst)) { /* if / jl 29.09.97 */
		    if (!strncmp (buffirst, "Receiving", 9) ||
			!strncmp (buffirst, "Sending", 7)) {
		      if (xfrstr[0]) {
			trim (trimbuf, xfrstr, sizeof(trimbuf));
			do_log ("%s", trimbuf);
			xfrstr[0] = 0;
		      }
		      trim (trimbuf, buf, sizeof(trimbuf));
		      do_log("%s", trimbuf);
		    } else if (!strncmp (buffirst, "Bytes", 5)) {
		      strncpy (xfrstr, buf, sizeof(xfrstr));
		    }
		    buffirst[0]=0;
		    trimbuf[0]=0;
		  }
		}
	}
#ifdef LOG_XFER
	if (xfl)
	  fclose(xfl);
#endif
  }
  /* Log the last file size	jl 14.09.97 */
  if (P_LOGXFER[0] == 'Y' && xfrstr[0]) {
    trim (trimbuf, xfrstr, sizeof(trimbuf));
    do_log ("%s", trimbuf);
    xfrstr[0] = 0;
  }

  while( udpid != m_wait(&status) );
  if (win) {
	enab_sig(0, 0);
	signal(SIGINT, SIG_IGN);
  }

  if (win == (WIN *)0) wreturn();

  /* MARK updated 02/17/94 - Flush modem port before displaying READY msg */
  /* because a BBS often displays menu text right after a download, and we */
  /* don't want the modem buffer to be lost while waiting for key to be hit */
  m_flush(portfd);
  port_init();
  (void) setcbreak(2); /* Raw, no echo. */
  if (win) close(pipefd[0]);
  (void) mcd("");
  timer_update();

  /* If we got interrupted, status != 0 */
  if (win && (status & 0xFF00) == 0) {
#if VC_MUSIC
	if (P_SOUND[0] == 'Y') {
		wprintf(win, _("\n READY: press any key to continue..."));
		music();
	} else
		sleep(1);
#else
	/* MARK updated 02/17/94 - If there was no VC_MUSIC capability, */
	/* then at least make some beeps! */
	if (P_SOUND[0] == 'Y') wprintf(win, "\007\007\007");
	sleep(1);
#endif
  }
  if (win) wclose(win, 1);
}

/*
 * Run kermit. Used to do this in the main window, but newer
 * versions of kermit are too intelligent and just want a tty
 * for themselves or they won't function ok. Shame.
 */
void kermit()
{
  int status;
  int pid, n;
  char buf[81];
  int fd;

  /* Clear screen, set keyboard modes etc. */
  wleave();

  switch(pid = fork()) {
  	case -1:
		wreturn();
  		werror(_("Out of memory: could not fork()"));
  		return;
  	case 0: /* Child */
  		/* Remove lockfile */
		set_privs();
  		if (lockfile[0]) unlink(lockfile);
		setgid((gid_t)real_gid);
		setuid((uid_t)real_uid);

  		for(n = 0; n < _NSIG; n++) signal(n, SIG_DFL);

  		(void) fastexec(translate(P_KERMIT));
  		exit(1);
  	default: /* Parent */
  		break;
  }

  (void) m_wait(&status);

  /* Restore screen and keyboard modes */
  wreturn();

  /* Re-create lockfile */
  if (lockfile[0]) {
	set_privs();
	n = umask(022);
  	/* Create lockfile compatible with UUCP-1.2 */
  	if ((fd = open(lockfile, O_WRONLY | O_CREAT | O_EXCL, 0666)) < 0) {
  		werror(_("Cannot re-create lockfile!"));
  	} else {
		(void) chown(lockfile, (uid_t)real_uid, (gid_t)real_gid);
  		snprintf(buf, sizeof(buf),  "%05d minicom %.20s\n", (int)getpid(), username);
  		write(fd, buf, strlen(buf));
  		close(fd);
  	}
	(void) umask(n);
	drop_privs();
  }
  m_flush(portfd);
  port_init();
}

/* ============ Here begins the setenv function ============= */
/*
 * Compare two strings up to '='
 */
static int varcmp(s1, s2)
char *s1, *s2;
{
  while(*s1 && *s2) {
  	if (*s1 == '=' && *s2 == '=') return(1);
  	if (*s1++ != *s2++) return(0);
  }
  return(1);
}

/*
 * Generate a name=value string.
 */
static char *makenv(name, value)
char *name, *value;
{
  char *p;
  
  if ((p = (char *)malloc(strlen(name) + strlen(value) + 3)) == CNULL)
	return(p);
  sprintf(p, "%s=%s", name, value);
  return(p);
}

/*
 * Set a environment variable. 
 */
int mc_setenv(name, value)
char *name, *value;
{
  static int init = 0;
  extern char **environ;
  char *p, **e, **newe;
  int count = 0;

  if ((p = makenv(name, value)) == CNULL) return(-1);

  for(e = environ; *e; e++) {
  	count++;
  	if(varcmp(p, *e)) {
  		*e = p;
  		return(0);
  	}
  }
  count += 2;
  if ((newe = (char **)malloc(sizeof(char *) * count)) == (char **)0) {
  	free(p);
  	return(-1);
  }
  memcpy((char *)newe, (char *)environ , (int) (count * sizeof(char *)));
  if (init) free((char *)environ);
  init = 1;
  environ = newe;
  for(e = environ; *e; e++)
  	;
  *e++ = p;
  *e = CNULL;
  return(0);
}

/* ============ This is the end of the setenv function ============= */

/*
 * Run an external script.
 * ask = 1 if first ask for confirmation.
 * s = scriptname, l=loginname, p=password.
 */
void runscript(ask, s, l, p)
int ask;
char *s, *l, *p;
{
  int status;
  int n;
  int pipefd[2];
  char buf[81];
  char scr_lines[5];
  char cmdline[128];
  char *ptr;
  WIN *w;
  int done = 0;
  char *msg = _("Same as last");
  char* username = _(" A -   Username        :"),
      * password = _(" B -   Password        :"),
      * name_of_script = _(" C -   Name of script  :"),
      * question = _("Change which setting?     (Return to run, ESC to stop)");


  if (ask) {
	w = wopen(10, 5, 70, 10, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
	wtitle(w, TMID, _("Run a script"));
	wputs(w, "\n");
	wprintf(w, "%s %s\n", username, scr_user[0] ? msg : "");
	wprintf(w, "%s %s\n", password, scr_passwd[0] ? msg : "");
	wprintf(w, "%s %s\n", name_of_script, scr_name);
	wlocate(w, 4, 5);
	wputs(w, question);
	wredraw(w, 1);

	while(!done) {
	    wlocate(w, strlen (question) + 5, 5);
	    n = wxgetch();
	    if (islower(n)) n = toupper(n);
	    switch(n) {
		case '\r':
		case '\n':
			if (scr_name[0] == '\0') {
				wbell();
				break;
			}
			wclose(w, 1);
			done = 1;
			break;
		case 27: /* ESC */
			wclose(w, 1);
			return;
		case 'A':
			wlocate(w, strlen (username) + 1, 1);
			wclreol(w);
			scr_user[0] = 0;
			wgets(w, scr_user, 32, 32);
			break;
		case 'B':
			wlocate(w, strlen (password) + 1, 2);
			wclreol(w);
			scr_passwd[0] = 0;
			wgets(w, scr_passwd, 32, 32);
			break;
		case 'C':
			wlocate(w, strlen (name_of_script) + 1, 3);
			wgets(w, scr_name, 32, 32);
			break;
		default:
			break;
	    }
	}
  } else {
  	strncpy(scr_user, l, sizeof(scr_user));
  	strncpy(scr_name, s, sizeof(scr_name));
  	strncpy(scr_passwd, p, sizeof(scr_passwd));
  }
  sprintf(scr_lines, "%d", (int) lines);  /* jl 13.09.97 */

  /* Throw away status line if temporary */
  if (tempst) {
  	wclose(st, 1);
  	tempst = 0;
  	st = NIL_WIN;
  }
  scriptname(scr_name);
  
  pipe(pipefd);

  if (mcd(P_SCRIPTDIR) < 0) return;

  snprintf(cmdline, sizeof(cmdline), "%s %s %s %s",
	   P_SCRIPTPROG, scr_name, logfname, logfname[0]==0? "": homedir);

  switch(udpid = fork()) {
  	case -1:
  		werror(_("Out of memory: could not fork()"));
  		close(pipefd[0]);
  		close(pipefd[1]);
  		(void) mcd("");
  		return;
  	case 0: /* Child */
  		dup2(portfd, 0);
  		dup2(portfd, 1);
  		dup2(pipefd[1], 2);
  		close(pipefd[0]);
  		close(pipefd[1]);
  		
  		for(n = 1; n < _NSIG; n++) signal(n, SIG_DFL);
  		
		set_privs();
		setgid((gid_t)real_gid);
  		setuid((uid_t)real_uid);
  		mc_setenv("LOGIN", scr_user);
  		mc_setenv("PASS", scr_passwd);
		mc_setenv("TERMLIN", scr_lines);	/* jl 13.09.97 */
  		(void) fastexec(translate(cmdline));
  		exit(1);
  	default: /* Parent */
  		break;
  }
  (void) setcbreak(1); /* Cbreak, no echo */
  enab_sig(1, 0);	       /* But enable SIGINT */
  signal(SIGINT, udcatch);
  close(pipefd[1]);
  
  /* pipe output from "runscript" program to terminal emulator */
  while((n = read(pipefd[0], buf, 80)) > 0) {
  	ptr = buf;
  	while(n--)
  		vt_out(*ptr++);
	timer_update();
  	wflush();
  }
  
  /* Collect status, and clean up. */
  (void) m_wait(&status);
  enab_sig(0, 0);
  signal(SIGINT, SIG_IGN);
  (void) setcbreak(2); /* Raw, no echo */
  close(pipefd[0]);
  scriptname("");
  (void) mcd("");
}
