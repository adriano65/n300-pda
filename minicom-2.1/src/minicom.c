/*
 * minicom.c	Main program. The main loop of the terminal emulator
 *		itself is in main.c. (Yeah yeah it's confusing).
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1996 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 * fmg 1/11/94 colors
 * jl  30.06.97 log it if you quit without reset while online
 * fmg 8/20/97 History buffer searching added
 * jseymour@jimsun.LinxNet.com (Jim Seymour) 03/26/98 - Added support for
 *    multiple tty devices via new "get_port()" function.
 * kubota@debian.or.jp 07/98  - Added option -C to start capturing from the
 *				command line
 * jl  09.07.98 added option -S to start a script at startup
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID(PKG_VER "$Id: minicom.c,v 1.10 2003/05/16 20:33:19 al-guest Exp $")

#include <getopt.h>

#define EXTERN
#include "port.h"
#include "minicom.h"
#include "intl.h"


#define RESET 1
#define NORESET 2

#ifdef _SVR2
extern struct passwd *getpwuid();
#endif /*_SVR2*/

#ifdef DEBUG
/* Show signals when debug is on. */
static void signore(sig)
int sig;
{
  if (stdwin != NIL_WIN)
	werror(_("Got signal %d"), sig);
  else
	printf("%s\r\n", _("Got signal %d"), sig);
}
#endif /*DEBUG*/

/*
 * Sub - menu's.
 */

static char *c1[] = { N_("   Yes  "), N_("   No   "), CNULL };
static char *c2[] = { N_("  Close "), N_(" Pause  "), N_("  Exit  "), CNULL };
static char *c3[] = { N_("  Close "), N_(" Unpause"), N_("  Exit  "), CNULL };
static char *c7[] = { N_("   Yes  "), N_("   No   "), CNULL };

/* Initialize modem port. */
void port_init()
{
  m_setparms(portfd, P_BAUDRATE, P_PARITY, P_BITS, P_STOPB,
	     P_HASRTS[0] == 'Y', P_HASXON[0] == 'Y');
}

static void do_hang(askit)
int askit;
{
  int c = 0;
 
  if (askit) c = ask(_("Hang-up line?"), c7);
  if (c == 0) hangup();
}

/*
 * We've got the hangup or term signal.
 */
static void hangsig(sig)
int sig;
{
  if (stdwin != NIL_WIN)
	werror(_("Killed by signal %d !\n"), sig);
  if (capfp != (FILE *)0) fclose(capfp);
  keyboard(KUNINSTALL, 0);
  hangup();
  modemreset();
  leave("\n");
}

/*
 * Jump to a shell
 */
#ifdef SIGTSTP
/*ARGSUSED*/
static void shjump(dummy /* __attribute__((unused)) */)
int dummy;
{
  extern int use_status;

  if (dummy) {}; /* avoid compiler warning, should be optimized away... */
  wleave();
  signal(SIGTSTP, SIG_DFL);
  fputs(_("Suspended. Type \"fg\" to resume.\n"),stdout);
  kill(getpid(), SIGTSTP);
  signal(SIGTSTP, shjump);
  wreturn();
  if (use_status) show_status();
}
#else
/*ARGSUSED*/
static void shjump(dummy /* __attribute__((unused)) */)
int dummy;
{
  extern int use_status;

  char *sh;
  int pid;
  int status;
  int f;

  if (dummy) {}; /* avoid compiler warning, should be optimized away... */
  sh = getenv("SHELL");
  if (sh == CNULL) {
  	werror(_("SHELL variable not set"));
  	return;
  }
  if ((pid = fork()) == -1) {
  	werror(_("Out of memory: could not fork()"));
  	return;
  }
  if (pid != 0) wleave();
  if (pid == 0) {
	for(f = 1; f < _NSIG; f++) signal(f, SIG_DFL);
  	for(f = 3; f < 20; f++) close(f);
	set_privs();
	setgid((gid_t)real_gid);
  	setuid((uid_t)real_uid);
	fputs(_("Shelled out. Type \"exit\" to return.\n"), stdout);
  	execl(sh, sh, CNULL);
  	exit(1);
  }
  (void) m_wait(&status);
  wreturn();
  if (use_status) show_status();
}
#endif /*SIGTSTP*/

#if _HISTORY
/* Get a line from either window or scroll back buffer. */
static ELM *getline(w, no)
WIN *w;
int no;
{
  int i;
  static ELM outofrange[MAXCOLS] = {{0,0,0}};

  if (no < us->histlines) {
	/* Get a line from the history buffer. */
	i = no + us->histline /*- 1*/;
	if (i >= us->histlines) i -= us->histlines;
	if (i < 0) i = us->histlines - 1;
	return(us->histbuf + (i * us->xs));
  }

  /* Get a line from the "us" window. */
  no -= us->histlines;
  if (no >= w->ys) {
  	if (outofrange[0].value == 0) {
  		for (i=0; i<MAXCOLS; i++) {
  			outofrange[i].value = ' ';
  			outofrange[i].color = us->color;
  			outofrange[i].attr  = us->attr;
  		}
  		outofrange[0].value = '~';
  	}
  	return outofrange;
  }
  return(w->map + (no * us->xs));
}

/* Redraw the window. */
static void drawhist(w, y, r)
WIN *w;
int y;
int r;
{
  int f;

  w->direct = 0;
  for(f = 0; f < w->ys; f++)
	wdrawelm(w, f, getline(w, y++));
  if (r) wredraw(w, 1);
  w->direct = 1;
}

#if _SEARCH_HISTORY
/*
 * fmg 8/20/97
 * drawhist_look()
 * Redraw the window, highlight line that was found to contain
 * pattern 'look'
 * Needed by re-draw screen function after EACH find_next()
 */
void drawhist_look(w, y, r, look, case_matters)
WIN	*w;
int	y;
int	r;
char	*look;
int	case_matters;
{
  int f;
  ELM *tmp_e;
  char tmp_line[MAXCOLS];

  tmp_line[0]='\0';
  w->direct = 0;
  for (f = 0; f < w->ys; f++)
  {
	tmp_e = getline(w, y++);

  	/* First we "accumulate" the line into a variable */
	wdrawelm_var(w, tmp_e, tmp_line);

	/* Does it have what we want? */
	if (strlen(look)>1 && strlen(tmp_line)>1) {
		if (StrStr(tmp_line,look, case_matters))
			wdrawelm_inverse(w, f, tmp_e); /* 'inverse' it */
  		else
			wdrawelm(w, f, tmp_e); /* 'normal' output */
	}
  }

  if (r) wredraw(w, 1);
  w->direct = 1;
}

/*
 * fmg 8/20/97
 * Search history - main function that started the C-code blasphemy :-)
 * This function doesn't care about case/case-less status...
 */
void searchhist(w_hist, str)
WIN *w_hist;
char *str;
{
  int y;
  WIN *w_new;
  char hline[128];

  /* Find out how big a window we must open. */
  y = w_hist->y2;
  if (st == (WIN *)0 || (st && tempst)) y--;

  /* Open a Search line window. */
  w_new = wopen(0, y+1, w_hist->x2, y+1, 0, st_attr, sfcolor, sbcolor, 0, 0, 1);
  w_new->doscroll = 0;
  w_new->wrap = 0;

  strcpy(hline, _("SEARCH FOR (ESC=Exit)"));
  wprintf(w_new, "%s(%d):",hline,MAX_SEARCH);
  wredraw(w_new, 1);
  wflush();

  wlocate(w_new, strlen(hline)+6, 0); wputs(w_new, str);
  wlocate(w_new, strlen(hline)+6, 0);
  (void) wgets(w_new, str, MAX_SEARCH, MAX_SEARCH);
#if 0
  if (!str[0]) /* then unchanged... must have pressed ESC... get out */
  {
  	wflush();
  	wclose(w_new, 0);
  	return;
  }
#endif

  wredraw(w_hist, 1);
  wclose(w_new, 1);
  wflush();

  return;
}

/*
 * fmg 8/20/97
 * Move scope to next hit of pattern in the buffer.
 * Returns line-number of next "hit_line" or -1 if none found
 * (we beep elsewhere ;-)
 */
int find_next(w, w_hist, hit_line, look, case_matters)
WIN	*w;
WIN	*w_hist;
int	hit_line;	/* 'current' Match line */
char	*look;		/* pattern */
int	case_matters;	/* guess... */
{
  int next_line;
  ELM *tmp_e;
  char tmp_line[MAXCOLS];
  int all_lines;

  if (!look)
  	return(++hit_line); /* next line */

  tmp_line[0]='\0';	/* Personal phobia, I need to do this.. */

  hit_line++;	/* we NEED this so we don't search only same line! */
  all_lines = w->histlines + w_hist->ys;

  if (hit_line >= all_lines)	/* Make sure we've got a valid line! */
  {
	werror(_("Search Wrapping Around to Start!"));
	hit_line = 0;
  }

  for (next_line = hit_line; next_line <= all_lines; next_line++)
  {
	/* we do 'something' here... :-) */
	tmp_e = getline(w_hist, next_line);

  	/*
	 * First we "accumulate" the line into a variable.
	 * To see 'why', see what an 'ELM' structure looks like!
	 */
	wdrawelm_var(w, tmp_e, tmp_line);

	/* Does it have what we want? */
	if (strlen(tmp_line) > 1 && strlen(look) > 1)
		if (StrStr(tmp_line, look, case_matters))
  			return(next_line);
  }

  if (hit_line >= all_lines)	/* Make sure we've got a valid line! */
  {
	werror(_("Search Wrapping Around to Start!"));
	hit_line = 0;
  }

  return(-1); /* nothing found! */
}

/*
 * fmg 8/22/97
 * Needed this for the case-less conparison... and Linux libc
 * doesn't seem to have a strnstr function... so we fudge.. ;-)
 */
const char *upcase(dest, src)
char	*dest, *src;
{
char	*d;

d=dest;
while (*src)
	*d++=toupper(*src++);
*d='\0';
return (dest);
}

/*
 * fmg 8/22/97
 * Needed this for the case-less conparison... and Linux libc
 * doesn't seem to have a strnstr function... so we fudge.. ;-)
 */
char *StrStr(str1, str2, case_matters)
char	*str1, *str2;
int	case_matters;
{
char	tmpstr1[MAXCOLS],
	tmpstr2[MAXCOLS];

if (case_matters)
	return (strstr(str1,str2));
else
  	return (strstr(upcase(tmpstr1,str1),upcase(tmpstr2,str2)));
}


#endif /*_SEARCH_HISTORY*/

static void drawcite(w, y, citey, start, end)
WIN *w;
int y;
int citey;
int start;
int end;
{
  if (y+citey >= start && y+citey <= end) 
	wdrawelm_inverse(w, y, getline(w, y+citey));
  else
	wdrawelm(w, y, getline(w, y+citey));
}

static void drawcite_whole(w, y, start, end)
WIN *w;
int y, start, end;
{
  int sy;
  for (sy = 0; sy < w->ys; sy++) {
	drawcite(w, sy, y, start, end);
  }
}

static void do_cite(w, start, end)
WIN *w;
int start,end;
{
  char tmp_line[MAXCOLS];
  ELM *tmp_e;
  int x, y;

  for (y=start; y<=end; y++) {
	vt_send('>');
	vt_send(' ');
	tmp_e = getline(w, y);
	wdrawelm_var(w, tmp_e, tmp_line);
	tmp_line[w->xs]=0;
	for (x=w->xs-1; x>=0; x--){
		if (tmp_line[x] <= ' ') tmp_line[x]=0;
		else break;
	}
	for (x=0; tmp_line[x]; x++){
		vt_send(tmp_line[x]);
	}
	vt_send(13);
  }
}

/* Scroll back */
static void scrollback()
{
  int y,c;
  WIN *b_us, *b_st;
#if _SEARCH_HISTORY
  ELM *tmp_e;
  int case_matters=0;	/* fmg: case-importance, needed for 'N' */
  static char look_for[MAX_SEARCH];	/* fmg: last used search pattern */
  char tmp_line[MAXCOLS];
#endif /*SEARCH_HISTORY*/
  int citemode = 0;
  int cite_ystart = 1000000,
      cite_yend = -1,
      cite_y = 0;
  int inverse;
  int loop = 1;

  char hline0[128], hline1[128], *hline;
  static int hit=0;

  /* Find out how big a window we must open. */
  y = us->y2;

  if (st == (WIN *)0 || (st && tempst)) y--;

  /* Open a window. */ 
  b_us = wopen(0, 0, us->x2, y, 0, us->attr, COLFG(us->color),
		COLBG(us->color), 0, 0, 0);
  wcursor(b_us, CNONE);

  /* Open a help line window. */
  b_st = wopen(0, y+1, us->x2, y+1, 0, st_attr, sfcolor, sbcolor, 0, 0, 1);
  b_st->doscroll = 0;
  b_st->wrap = 0;

  /* Make sure help line is as wide as window. */

#if _SEARCH_HISTORY
  /*
   * fmg 8/20/97
   * added /=Srch, \=CaseLess, and N=Next and changed rest of line...
   * Hope you like it :-)
   */
  strcpy(hline0, _("HISTORY: U=Up D=Down F=PgDn B=PgUp s=Srch S=CaseLess N=Next C=Cite ESC=Exit "));
#else
  strcpy(hline0, _("  SCROLL MODE    U=up D=down F=page-forward B=page-backward C=Cite ESC=exit "));
#endif /*_HIST_SEARCH*/

  if (b_st->xs < 127)
  	hline0[b_st->xs] = 0;
  hline = hline0;
  wprintf(b_st, hline);
  wredraw(b_st, 1);
  wflush();

  /* And do the job. */
  y = us->histlines;

  /* fmg 8/20/97
   * Needed for N)extSearch, keeps track of line on which current "hit"
   * is... we advance it to 'N'ext hit in find_next(). We start at "top"
   * of history stack
   */
  hit=0;
  
  drawhist(b_us, y, 0);

  while(loop) {
	c = wxgetch();
	switch(c) {
#if _SEARCH_HISTORY
	  /*  
	   * fmg 8/22/97
	   * Take care of the search key: Caseless
	   */
	  case '\\':
	  case 'S':
	    case_matters=0; /* case-importance, ie. none :-) */
	  /* 
	   * fmg 8/22/97
	   * Take care of the search key: Exact Match
	   */
	  case '/':
	  case 's':
  		if (!us->histlines)
		{ wbell(); werror(_("History buffer Disabled!")); break; }
  		if (!us->histline)
		{ wbell(); werror(_("History buffer empty!")); break; }
		if (citemode) break;
		
		/* we need this for the case-importance-toggle to work.. */
		if (c == '/' || c == 's')
			case_matters=1; /* case-importance, ie. DOES */

		/* open up new search window... */
		searchhist(b_us, look_for);
		/* must redraw status line... */
  		wlocate(b_st, 0, 0); /* move back to column 0! */
  		wprintf(b_st, hline); /* and show the above-defined hline */
  		wredraw(b_st, 1); /* again... */
		/* highlight any matches */
  		if (strlen(look_for)>1)
		{
  			hit = find_next(us, b_us, y, look_for, case_matters);

			if (hit == -1) { wbell(); wflush(); hit=0; break; }
  			drawhist_look(b_us, hit, 1, look_for, case_matters);
  			y = hit;
		}
  		else
		{ wbell(); break; }
  		wflush();
		break;
	  /* 
	   * fmg 8/22/97
	   * Take care of the Next Hit key...
	   * Popup an error window if no previous... why not start a new
	   * search? How do we know which case-importance they wanted?
	   */
	  case 'n':
	  case 'N':
		/* highlight NEXT match */
		if (citemode) break;
  		if (strlen(look_for)>1)
		{
		  hit = find_next(us, b_us, y, look_for, case_matters);

		  if (hit == -1) { wbell(); wflush(); hit=0; break; }
		  drawhist_look(b_us, hit, 1, look_for, case_matters);
		  y = hit;
		}
		else	/* no search pattern... */
		  {
		    wbell();
		    werror(_("No previous search!\n  Please 's' or 'S' first!"));
		}
		wflush();
		break;
#endif /*_SEARCH_HISTORY*/

	  case 'u':
	  case 'U':
	  case K_UP:
		if (citemode && cite_y) {
			cite_y--;
			if (cite_ystart != 1000000) {
			  cite_yend = y + cite_y;
			  drawcite(b_us, cite_y+1, y, cite_ystart, cite_yend);
			  drawcite(b_us, cite_y, y, cite_ystart, cite_yend);
			}
			wlocate(b_us, 0, cite_y);
			break;
		}
		if (y <= 0) break;
		y--; if (cite_ystart != 1000000) cite_yend = y + cite_y;
		wscroll(b_us, S_DOWN);

#if _SEARCH_HISTORY
		/*
		 * fmg 8/20/97
		 * This is needed so that the movement in window will HIGHLIGHT
		 * the lines that have the pattern we wanted... it's just nice.
		 * This almost beggs for a function :-)
		 */
		if (citemode) {
			inverse =
			  (y+cite_y >= cite_ystart && y+cite_y <= cite_yend);
		} else {
        		tmp_e = getline(b_us, y);
			if (strlen(look_for) > 1)
			{
			  /* quick scan for pattern match */
			  wdrawelm_var(b_us, tmp_e, tmp_line);
			  inverse = (strlen(tmp_line)>1 &&
			    StrStr(tmp_line, look_for, case_matters));
			}
        		else
				inverse = 0;
		}
#else
		if (citemode) {
			inverse =
			  (y+cite_y >= cite_ystart && y+cite_y <= cite_yend);
		} else {
			inverse = 0;
		}
#endif /*_SEARCH_HISTORY*/
		if (inverse) wdrawelm_inverse(b_us, 0, getline(b_us, y));
		else wdrawelm(b_us, 0, getline(b_us, y));
		if (citemode) wlocate(b_us, 0, cite_y);
		wflush();
		break;
	  case 'd':
	  case 'D':
	  case K_DN:
		if (citemode && cite_y < b_us->ys-1) {
			cite_y++;
			if (cite_ystart != 1000000) {
			  cite_yend = y + cite_y;
			  drawcite(b_us, cite_y-1, y, cite_ystart, cite_yend);
			  drawcite(b_us, cite_y, y, cite_ystart, cite_yend);
			}
			wlocate(b_us, 0, cite_y);
			break;
		}
			
		if (y >= us->histlines) break;
		y++; if (cite_ystart != 1000000) cite_yend = y + cite_y;
		wscroll(b_us, S_UP);

#if _SEARCH_HISTORY
		/*
		 * fmg 8/20/97
		 * This is needed so that the movement in window will HIGHLIGHT
		 * the lines that have the pattern we wanted... it's just nice.
		 * This almost beggs for a function :-)
		 */
		if (citemode) {
			inverse =
			  (y+cite_y >= cite_ystart && y+cite_y <= cite_yend);
		} else {
        		tmp_e = getline(b_us, y + b_us->ys - 1);
			if (strlen(look_for) > 1)
			{
				/* quick scan for pattern match */
        			wdrawelm_var(b_us, tmp_e, tmp_line);
				inverse = (strlen(tmp_line)>1 &&
				  StrStr(tmp_line, look_for, case_matters));
			}
        		else
				inverse = 0;
		}
#else
		if (citemode) {
			inverse =
			  (y+cite_y >= cite_ystart && y+cite_y <= cite_yend);
		} else {
			inverse = 0;
		}
#endif /*_SEARCH_HISTORY*/
		if (inverse)
			wdrawelm_inverse(b_us, b_us->ys - 1, 
			  getline(b_us, y + b_us->ys - 1));
		else
			wdrawelm(b_us, b_us->ys - 1, 
			  getline(b_us, y + b_us->ys - 1));
		if (citemode) wlocate(b_us, 0, cite_y);
		wflush();
		break;
	  case 'b':
	  case 'B':
	  case K_PGUP:
		if (y <= 0) break;
		y -= b_us->ys;
		if (y < 0) y = 0;
		if (cite_ystart != 1000000) cite_yend = y + cite_y;

#if _SEARCH_HISTORY
		/*
		 * fmg 8/20/97
		 * This is needed so that the movement in window will HIGHLIGHT
		 * the lines that have the pattern we wanted... it's just nice.
		 * Highlight any matches
		 */
  		if (strlen(look_for)>1 && us->histline)
			drawhist_look(b_us, y, 1, look_for, case_matters);
  		else
			drawhist(b_us, y, 1);
#else
			drawhist(b_us, y, 1);
#endif /*_SEARCH_HISTORY*/
		if (citemode) wlocate(b_us, 0, cite_y);
		break;
	  case 'f':
	  case 'F':
	  case ' ': /* filipg: space bar will go page-down... pager-like */
	  case K_PGDN:
		if (y >= us->histlines) break;
		y += b_us->ys;
		if (y > us->histlines) y=us->histlines;
		if (cite_ystart != 1000000) cite_yend = y + cite_y;

#if _SEARCH_HISTORY
		/*
		 * fmg 8/20/97
		 * This is needed so that the movement in window will HIGHLIGHT
		 * the lines that have the pattern we wanted... it's just nice.
		 * Highlight any matches
		 */
  		if (strlen(look_for)>1 && us->histline)
			drawhist_look(b_us, y, 1, look_for, case_matters);
  		else
			drawhist(b_us, y, 1);
#else
		drawhist(b_us, y, 1);
#endif /*_SEARCH_HISTORY*/
		if (citemode) wlocate(b_us, 0, cite_y);
		break;
	  case 'C': case 'c': /* start citation mode */
		if (citemode ^= 1) {
			cite_y = 0;
			cite_ystart = 1000000;
			cite_yend = -1;
			strcpy(hline1, _("  CITATION: ENTER=select start line ESC=exit                               "));
			if (b_st->xs < 127) hline1[b_st->xs]=0;
			hline = hline1;
		} else {
			hline = hline0;
		}
		wlocate(b_st, 0, 0);
		wprintf(b_st, hline);
		wredraw(b_st, 1);
		if (citemode) wlocate(b_us, 0, cite_y);
		break;
	  case 10: case 13:
		if (!citemode) break;
		if (cite_ystart == 1000000) {
			cite_yend = cite_ystart = y + cite_y;
			strcpy(hline1, _("  CITATION: ENTER=select end line ESC=exit                                 "));
			if (b_st->xs < 127) hline1[b_st->xs]=0;
		} else {
			if (cite_ystart > cite_yend) break;
			drawcite_whole(b_us, y, 1000000, -1);
			loop = 0;
			break;
		}
		wlocate(b_st, 0, 0);
		wprintf(b_st, hline);
		wredraw(b_st, 1);
		wdrawelm_inverse(b_us, cite_y, getline(b_us, cite_ystart));
		wlocate(b_us, 0, cite_y);
		break;
	  case K_ESC:
		if (!citemode) {loop = 0; break;}
		if (cite_ystart == 1000000) {
			citemode = 0;
			hline = hline0;
		} else {
			cite_ystart = 1000000;
			strcpy(hline1, _("  CITATION: ENTER=select start line ESC=exit                               "));
		}
		drawcite_whole(b_us, y, cite_ystart, cite_yend);
		wlocate(b_st, 0, 0);
		wprintf(b_st, hline);
		wredraw(b_st, 1);
		if (citemode) wlocate(b_us, 0, cite_y);
		break;
	}
  }
  /* Cleanup. */
  if (citemode) do_cite(b_us, cite_ystart, cite_yend);
  wclose(b_us, y == us->histlines ? 0 : 1);
  wclose(b_st, 1);
  wlocate(us, us->curx, us->cury);
  wflush();
  wredraw(us, 1);
}
#endif /*HOSTORY*/

#ifdef SIGWINCH
/* The window size has changed. Re-initialize. */
static void change_size(sig)
int sig;
{
  (void)sig;
  size_changed = 1;
  signal(SIGWINCH, change_size);
}
#endif /*SIGWINCH*/

/*
 * Read a word from strings 's' and advance pointer.
 */
static char *getword(s)
char **s;
{
  char *begin;

  /* Skip space */
  while(**s == ' ' || **s == '\t') (*s)++;
  /* End of line? */
  if (**s == '\0' || **s == '\n') return((char *)0);
  
  begin = *s;
  /* Skip word */
  while(**s != ' ' && **s != '\t' && **s != '\n' && **s) (*s)++;
  /* End word with '\0' */
  if (**s) {
  	**s = 0;
  	(*s)++;
  }
  return(begin);
}

static void usage(env_args, optind, mc)
int env_args, optind;
char *mc;
{
  if (env_args >= optind && mc)
	 fprintf(stderr, _("Wrong option in environment MINICOM=\"%s\"\n"), mc);
  fprintf(stderr, _("Type \"minicom %s\" for help.\n"), "--help");
  exit(1);
}

/* Give some help information */
static void helpthem()
{
  char *mc = getenv("MINICOM");

  printf(_("Usage: %s [OPTION]... [configuration]\n"), PACKAGE);
  printf(_("A terminal program for Linux and other unix-like systems.\n\n"));
  printf(_("  -s, --setup            : enter setup mode (only as root)\n"));
  printf(_("  -o, --noinit           : do not initialize modem & lockfiles at startup\n"));
  printf(_("  -m, --metakey          : use meta or alt key for commands\n"));
  printf(_("  -M, --metakey8         : use 8bit meta key for commands\n"));
  printf(_("  -l, --ansi             : literal; assume screen uses the IBM-PC character set\n"));
  printf(_("  -L, --iso              : Ditto, but assume screen uses ISO8859\n")); 
  printf(_("  -w, --wrap             : Linewrap on\n"));
  printf(_("  -z, --statline         : try to use terminal's status line\n"));
  printf(_("  -8, --8bit             : 8bit clean mode (for Japanese, etc)\n"));
  printf(_("  -c, --color=on/off     : ANSI style color usage on or off\n"));
  printf(_("  -a, --attrib=on/off    : use reverse or highlight attributes on or off\n"));
  printf(_("  -t, --term=TERM        : override TERM environment variable\n"));
  printf(_("  -S, --script=SCRIPT    : run SCRIPT at startup\n"));
  printf(_("  -d, --dial=ENTRY       : dial ENTRY from the dialing directory\n"));
  printf(_("  -p, --ptty=TTYP        : connect to pseudo terminal\n"));
  printf(_("  -C, --capturefile=FILE : start capturing to FILE\n"));
  printf(_("  -T, --disabletime      : disable display of online time\n"));
  printf(_("  -v, --version          : output version information and exit\n"));
  printf(_("  configuration          : configuration file to use\n\n"));
  printf(_("These options can also be specified in the MINICOM environment variable.\n"));
  printf(_("This variable is currently %s"), mc ? _("set to ") : _("unset.\n"));
  if (mc)
    printf("\"%s\".\n", mc);
  printf(_("The configuration directory for the access file and the configurations\n"));
  printf(_("is compiled to %s.\n\n"), CONFDIR);
  printf(_("Report bugs to <minicom-devel@lists.alioth.debian.org>.\n"));
}

int main(argc, argv)
int argc;
char **argv;
{
  int c;			/* Command character */
  int quit = 0;			/* 'q' or 'x' pressed */
  char *s, *bufp;		/* Scratch pointers */
  int dosetup = 0, doinit = 1;	/* -o and -s options */
  char buf[80];			/* Keyboard input buffer */
  char capname[128];		/* Name of capture file */
  struct passwd *pwd;		/* To look up user name */
  int userok = 0;		/* Scratch variables */
  FILE *fp;			/* Scratch file pointer */
  char userfile[256];		/* Locate user file */
  char *use_port;		/* Name of initialization file */
  char *args[20];		/* New argv pointer */
  int argk = 1;			/* New argc */
  extern int getopt(), optind;
  extern char *optarg;		/* From getopt (3) package */
  extern int use_status;	/* Use status line. */
  char *mc;			/* For 'MINICOM' env. variable */
  int env_args;			/* Number of args in env. variable */
  char *cmd_dial;		/* Entry from the command line. */
  int alt_code = 0;		/* Type of alt key */
  char pseudo[64];
/*  char* console_encoding = getenv ("LC_CTYPE"); */

  static struct option long_options[] =
  {
	  { "setup", no_argument, NULL, 's' },
	  { "help", no_argument, NULL, 'h' },
	  { "ptty", required_argument, NULL, 'p' },
	  { "metakey", no_argument, NULL, 'm' },
	  { "metakey8", no_argument, NULL, 'M' },
	  { "ansi", no_argument, NULL, 'l' },
	  { "iso", no_argument, NULL, 'L' },
	  { "term", required_argument, NULL, 't' },
	  { "noinit", no_argument, NULL, 'o' },
	  { "color", required_argument, NULL, 'c' },
	  { "attrib", required_argument, NULL, 'a' },
	  { "dial", required_argument, NULL, 'd' },
	  { "statline", no_argument, NULL, 'z' },
	  { "capturefile", required_argument, NULL, 'C' },
	  { "script", required_argument, NULL, 'S' },
	  { "8bit", no_argument, NULL, '8' },
	  { "version", no_argument, NULL, 'v' },
	  { "wrap", no_argument, NULL, 'w' },
	  { "disabletime", no_argument, NULL, 'T' },
	  { NULL, 0, NULL, 0 }
  };

  /* initialize locale support */
  setlocale(LC_ALL, "");
  bindtextdomain(PACKAGE, LOCALEDIR);
  textdomain(PACKAGE);

  /* Initialize global variables */
  portfd = -1;
  capfp = (FILE *)NULL;
  docap = 0;
  online = -1;
  linespd = 0;
  stdattr = XA_NORMAL;
  us = NIL_WIN;
  addlf = 0;
  wrapln = 0;
  disable_online_time = 0;
#ifdef HAVE_SELECT
  local_echo = 0;
#endif /*SELECT*/
  strcpy(capname, "minicom.cap");
  lockfile[0] = 0;
  tempst = 0;
  st = NIL_WIN;
  us = NIL_WIN;
  bogus_dcd = 0;
  usecolor = 0;
  screen_ibmpc = 0;
  screen_iso = 0;
  useattr = 1;
  strncpy(termtype, getenv("TERM") ? getenv("TERM") : "dumb", sizeof(termtype));
  stdattr = XA_NORMAL;
  use_port = "dfl";
  alt_override = 0;
  scr_name[0] = 0;
  scr_user[0] = 0;
  scr_passwd[0] = 0;
  dial_name = (char *)NULL;
  dial_number = (char *)NULL;
  dial_user = (char *)NULL;
  dial_pass = (char *)NULL;
  size_changed = 0;
  escape = 1;
  cmd_dial = NULL;
  real_uid = getuid();
  real_gid = getgid();
  eff_uid  = geteuid();
  eff_gid  = getegid();

/* fmg 1/11/94 colors (set defaults) */
/* MARK updated 02/17/95 to be more similiar to TELIX */
  mfcolor = YELLOW;
  mbcolor = BLUE;
  tfcolor = WHITE;
  tbcolor = BLACK;
  sfcolor = WHITE;
  sbcolor = RED;
  st_attr = XA_NORMAL;
  
/* acme@conectiva.com.br 28/02/1998 */
  /*  if (console_encoding != NULL)
    if (strncmp (console_encoding, "ISO-8859", 8) == 0)
    screen_iso++; */

/* kubota@debian.or.jp 12/07/1998 */
  {
    /* Boah, a hack .... should we switch to 8bit for all
     * and supply a 7bit option? Adam */
    char *v[] = { "LANG", "LC_ALL" };
    char *l[] = { "ja", "ko", "ru" };
    unsigned int i;
    int done = 0;

    for (i = 0; !done && i < sizeof(v)/sizeof(*v); i++) {
      char *lang = getenv(v[i]);
      if (lang != NULL) {
	unsigned int j = 0;
	for (; j < sizeof(l)/sizeof(*l); j++) {
	  printf("%s/%s\n", v[i], l[j]);
	  if (!strncmp(lang, l[j], strlen(l[j]))) {
	    args[argk++] = "-8";
	    done = 1;
	    break;
	  }
	}
      }
    }
  }

/* MARK updated 02/17/95 default history buffer size */
  num_hist_lines = 256;

/* fmg - but we reset these to F=WHITE, B=BLACK if -b flag found */

  /* Before processing the options, first add options
   * from the environment variable 'MINICOM'.
   */
  args[0] = "minicom";
  if ((mc = getenv("MINICOM")) != CNULL) {
 	strncpy(buf, mc, 80);
 	bufp = buf;
 	buf[79] = 0;
 	while(isspace(*bufp)) bufp++;
 	while(*bufp && argk < 19) {
 		for(s = bufp; !isspace(*bufp) && *bufp; bufp++)
 			;
 		args[argk++] = s;
 		while(isspace(*bufp)) *bufp++ = 0;
 	}
  }
  env_args = argk;

  /* Add command - line options */
  for(c = 1; c < argc && argk < 19; c++) args[argk++] = argv[c];
  args[argk] = CNULL;

  do {
	/* Process options with getopt */
	while((c = getopt_long(argk, args, "v8zhlLsomMbwTc:a:t:d:p:C:S:",
					long_options, NULL)) != EOF)
	  switch(c) {
		case 'v':
			printf(_("%s version %s"), PACKAGE, VERSION);
#ifdef __DATE__
			printf(_(" (compiled %s)"), __DATE__);
#endif
			printf("\n");
			printf(_("Copyright (C) Miquel van Smoorenburg.\n\n"));
			printf("This program is free software; you can redistribute it and/or\n"
			       "modify it under the terms of the GNU General Public License\n"
			       "as published by the Free Software Foundation; either version\n"
			       "2 of the License, or (at your option) any later version.\n\n");
			exit(1);
			break;
  		case 's': /* setup */
  			if (real_uid != 0 && real_uid != eff_uid) {
				fprintf(stderr, _("minicom: -s switch needs root privilige\n"));
				exit(1);
			}
  			dosetup = 1;
  			break;
		case 'h':
			helpthem();
			exit(1);
			break;
		case 'p': /* Pseudo terminal to use. */
			if (strncmp(optarg, "/dev/", 5) == 0)
				optarg += 5;
			if (((strncmp(optarg, "tty", 3) != 0)
					/* /dev/pts support --misiek. */
					&& (strncmp(optarg, "pts", 3) != 0)
					/* /dev/pty support --jl. */
					&& (strncmp(optarg, "pty", 3) != 0))
					|| !strchr("pqrstuvwxyz/", optarg[3])) {
				fprintf(stderr, _("minicom: argument to -p must be a pty\n"));
				exit(1);
			}
			snprintf(pseudo, sizeof(pseudo), "/dev/%s", optarg);
			dial_tty = pseudo;

			/* Drop priviliges. */
			drop_all_privs();
			break;
  		case 'm': /* ESC prefix metakey */
  			alt_override++;
			alt_code = 27;
			break;
		case 'M': /* 8th bit metakey. */
  			alt_override++;
			alt_code = 128;
  			break;
		case 'l': /* Literal ANSI chars */
			screen_ibmpc++;
			break;
		case 'L': /* Literal ISO8859 chars */
			screen_iso++;
			break;
		case 't': /* Terminal type */
			strncpy(termtype, optarg, sizeof(termtype));
#ifdef __GLIBC__
			/* Bug in older libc's (< 4.5.26 I think) */
			if ((s = getenv("TERMCAP")) != NULL && *s != '/')
				unsetenv("TERMCAP");
#endif
			break;
  		case 'o': /* DON'T initialize */
 	 		doinit = 0;
  			break;
  		case 'c': /* Color on/off */
  			if (strcmp("on", optarg) == 0) {
  				usecolor = 1;
  				stdattr = XA_BOLD;
  				break;
  			}
  			if (strcmp("off", optarg) == 0) {
  				usecolor = 0;
  				stdattr = XA_NORMAL;
  				break;
  			}
  			usage(env_args, optind - 1, mc);
  			break;
  		case 'a': /* Attributes on/off */
  			if (strcmp("on", optarg) == 0) {
  				useattr = 1;
  				break;
  			}
  			if (strcmp("off", optarg) == 0) {
  				useattr = 0;
  				break;
  			}
  			usage(env_args, optind - 1, mc);
  			break;
		case 'd': /* Dial from the command line. */
			cmd_dial = optarg;
			break;
		case 'z': /* Enable status line. */
			use_status = 1;
			break;
		case 'C': /* Capturing */
			capfp = sfopen(optarg, "a");
			if (capfp == NULL) {
				werror(_("Cannot open capture file"));
				exit(1);
			}
			docap = 1;
			vt_set(addlf, -1, capfp, docap, -1, -1, -1, -1);
			break;
		case 'S': /* start Script */
			strncpy(scr_name, optarg, 33);
			break;
		case '8': /* 8bit clean mode */
			vt_set(-1, -1, (FILE*)NULL, -1, -1, -1, -1, 1);
			screen_ibmpc++; screen_iso++;
			break;
		case 'w': /* Linewrap on */
			wrapln = 1;
			break;
		case 'T': /* disable online time */
			disable_online_time = 1;
			break;
		default:
  			usage(env_args, optind, mc);
  			break;
  	}

  	/* Now, get portname if mentioned. Stop at end or '-'. */
 	while(optind < argk && args[optind][0] != '-')
  		use_port = args[optind++];

    /* Loop again if more options */
  } while(optind < argk);

#ifdef SVR4_LOCKS
  if (real_uid == 0 && dosetup == 0) {
    fprintf(stderr, "%s",
_("minicom: WARNING: please don't run minicom as root when not maintaining\n"
  "                  it (with the -s switch) since all changes to the\n"
  "                  configuration will be GLOBAL !.\n"));
 	sleep(5);
  }
#endif

  /* Avoid fraude ! */	
  for(s = use_port; *s; s++) if (*s == '/') *s = '_';
  snprintf(parfile, sizeof(parfile), "%s/minirc.%s", CONFDIR, use_port);

  /* Get password file information of this user. */
  if ((pwd = getpwuid(real_uid)) == (struct passwd *)0) {
  	fputs(_("You don't exist. Go away.\n"), stderr);
  	exit(1);
  }

  /* Remember home directory and username. */
  if ((s = getenv("HOME")) == CNULL)
	strncpy(homedir, pwd->pw_dir, sizeof(homedir));
  else
	strncpy(homedir, s, sizeof(homedir));
  strncpy(username, pwd->pw_name, sizeof(username));

  /* Get personal parameter file */
  snprintf(pparfile, sizeof(pparfile), "%s/.minirc.%s", homedir, use_port);

  /* Check this user in the USERFILE */
  if (real_uid != 0 && real_uid != eff_uid) {
  	snprintf(userfile, sizeof(userfile), "%s/minicom.users", CONFDIR);
	if ((fp = fopen(userfile, "r")) != (FILE *)0) {
		while(fgets(buf, 70, fp) != CNULL && !userok) {
			/* Read first word */
			bufp = buf;
			s = getword(&bufp);
			/* See if the "use_port" matches */
			if (s && (!strcmp(pwd->pw_name, s) ||
				strcmp("ALL", s) == 0)) {
				if ((s = getword(&bufp)) == CNULL)
					userok = 1;
				else do {
					if (!strcmp(s, use_port)) {
						userok = 1;
						break;
					}
				} while((s = getword(&bufp)) != CNULL);
			}
		}
		fclose(fp);
		if (!userok) {
			fprintf(stderr,
   _("Sorry %s. You are not allowed to use configuration %s.\n"),
				pwd->pw_name, use_port);
			fprintf(stderr,
				_("Ask your sysadm to add your name to %s\n"),
				userfile);
			exit(1);
		}
	}
  }
  buf[0] = 0;

  read_parms();
  num_hist_lines = atoi(P_HISTSIZE);
  strcpy(logfname,P_LOGFNAME);

  stdwin = NIL_WIN; /* It better be! */

  /* Reset colors if we don't use 'em. */
  if (!usecolor) {
  	mfcolor = tfcolor = sfcolor = WHITE;
  	mbcolor = tbcolor = sbcolor = BLACK;
	st_attr = XA_REVERSE;
  }

  if (dial_tty == NULL) {
    if (!dosetup) {
      while((dial_tty = get_port(P_PORT)) != NULL && open_term(doinit) < 0)
	;
      if(dial_tty == NULL)
	exit(1);
    }
  }
  else {
    if (!dosetup && open_term(doinit) < 0) exit(1);
  }

  mc_setenv("TERM", termtype);

  if (win_init(tfcolor, tbcolor, XA_NORMAL) < 0) leave("");

  if (COLS < 40 || LINES < 10) {
  	leave(_("Sorry. Your screen is too small.\n"));
  }

  if (dosetup) {
  	if (config(1)) {
  		wclose(stdwin, 1);
  		exit(0);
  	}
	while((dial_tty = get_port(P_PORT)) != NULL && open_term(doinit) < 0)
	  ;
	if(dial_tty == NULL)
	  exit(1);
  }

  /* Signal handling */
  signal(SIGTERM, hangsig);
  signal(SIGHUP, hangsig);
  signal(SIGINT, SIG_IGN);
  signal(SIGQUIT, SIG_IGN);
  signal(SIGPIPE, SIG_IGN);

#ifdef SIGTSTP
  signal(SIGTSTP, shjump);
  signal(SIGTTIN, SIG_IGN);
  signal(SIGTTOU, SIG_IGN);
#endif
#ifdef SIGTINT
	signal(SIGTINT, SIG_IGN);
#endif
#ifdef SIGWINCH
  signal(SIGWINCH, change_size);
#endif

#if DEBUG
  for(c = 1; c < _NSIG; c++) {
	if (c == SIGTERM) continue; /* Saviour when hung */
	signal(c, signore);
  }
#endif

  keyboard(KINSTALL, 0);

  if (strcmp(P_BACKSPACE, "BS") != 0) 
	keyboard(KSETBS, P_BACKSPACE[0] == 'B' ? 8 : 127);
  if (alt_override)
	keyboard(KSETESC, alt_code);
  else if (strcmp(P_ESCAPE, "^A") != 0) {
	switch(P_ESCAPE[0]) {
		case '^':
			c = P_ESCAPE[1] & 31;
			break;
		case 'E':
			c = 27;
			break;
		default:
			c = 128;
			break;
	}
	keyboard(KSETESC, c);
  }

  st = NIL_WIN;
  us = NIL_WIN;

  init_emul(VT100, 1);
 
  if (doinit) modeminit();
 
  wprintf(us, "\n%s %s\r\n", _("Welcome to minicom"), VERSION);
  wprintf(us, "\n%s: %s%s%s%s%s\r\n", _("OPTIONS"),
	  CR_OPTION1,CR_OPTION2,CR_OPTION3,CR_OPTION4,CR_OPTION5);
#if defined (__DATE__) && defined (__TIME__)
  wprintf(us, "%s %s, %s.\r\n",_("Compiled on"), __DATE__,__TIME__);
#endif
  wprintf(us, _("\nPress %sZ for help on special keys%c\n\n"),esc_key(),'\r');

  /* Now that all initialization is done, drop our priviliges. */
  drop_privs();

  readdialdir();

  if (scr_name[0]) runscript (0, scr_name, "", "");

  if (cmd_dial) dialone(cmd_dial);

  /* The main loop calls do_terminal and gets a function key back. */
  while(!quit) {
	c = do_terminal();
dirty_goto:	
	switch(c + 32 *(c >= 'A' && c <= 'Z')) {
		case 'a': /* Add line feed */
			addlf = !addlf;
			vt_set(addlf, -1, NULL, -1, -1, -1, -1, -1);
			s = addlf ?
			  _("Add linefeed ON") : _("Add linefeed OFF");
			werror("%s", s);
			break;
#ifdef HAVE_SELECT
		case 'e': /* Local echo on/off. */
			local_echo = !local_echo;
			vt_set(-1, -1, NULL, -1, -1, local_echo, -1 ,-1);
			s = local_echo ?
			  _("Local echo ON") : _("Local echo OFF");
			werror("%s", s);
			break;
#endif
		case 'z': /* Help */
			c = help();
			if (c != 'z') goto dirty_goto;
			break;
		case 'c': /* Clear screen */
			winclr(us);
			break;	
		case 'f': /* Send break */
			sendbreak();
			break;
#if _HISTORY
		case 'b': /* Scroll back */
			scrollback();
			break;
#endif
		case 'm': /* Initialize modem */
			if (P_HASDCD[0]=='Y' && online >= 0) {
			  c = ask(_("You are online. Really initialize?"), c1);
			  if (c != 0)
			    break;
			}
			modeminit();
			break;	
		case 'q': /* Exit without resetting */
			c = ask(_("Leave without reset?"), c1);
			if (c == 0) quit = NORESET;
#if _HAVE_MACROS
			if (!strcmp(P_MACCHG,"CHANGED")) {
				c = ask (_("Save macros?"),c1);
				if (c == 0)
					if (dodflsave() < 0) /* fmg - error */
					{
						c = 'O'; /* hehe */
						quit = 0;
						goto dirty_goto;
					}
			}
#endif
			break;
		case 'x': /* Exit Minicom */
			c = ask(_("Leave Minicom?"), c1);
			if (c == 0) {
				quit = RESET;
				if(online >= 0)
					do_hang(0);
				modemreset();	 
			}
#if _HAVE_MACROS
			if (!strcmp(P_MACCHG,"CHANGED")) {
				c = ask (_("Save macros?"),c1);
				if (c == 0)
					if (dodflsave() < 0) /* fmg - error */
					{
						c = 'O'; /* hehe */
						quit = 0;
						goto dirty_goto;
					}
			}
#endif
			break;
		case 'l': /* Capture file */
			if (capfp == (FILE *)0 && !docap) {
				s = input(_("Capture to which file? "),
					  capname);
				if (s == CNULL || *s == 0) break;
				if ((capfp = sfopen(s, "a")) == (FILE *)NULL) {
					werror(_("Cannot open capture file"));
					break;
				}
				docap = 1;
			} else if (capfp != (FILE *)0 && !docap) {
				c = ask(_("Capture file"), c3);
				if (c == 0) {
					fclose(capfp);
					capfp = (FILE *)NULL;
					docap = 0;
				}
				if (c == 1) docap = 1;
			} else if (capfp != (FILE *)0 && docap) {
				c = ask(_("Capture file"), c2);
				if (c == 0) {
					fclose(capfp);
					capfp = (FILE *)NULL;
					docap = 0;
				}
				if (c == 1) docap = 0;
			}
			vt_set(addlf, -1, capfp, docap, -1, -1, -1, -1);
			break;
		case 'p': /* Set parameters */
			get_bbp(P_BAUDRATE, P_BITS, P_PARITY, P_STOPB, 0);
			port_init();
			if (st != NIL_WIN) mode_status();
			quit = 0;
			break;
		case 'k': /* Run kermit */
			kermit();
			break;
		case 'h': /* Hang up */
			do_hang(1);
			break;
		case 'd': /* Dial */
			dialdir();
			break;		
		case 't': /* Terminal emulation */
			c = dotermmenu();
			if (c > 0) init_emul(c, 1);
			break;
		case 'w': /* Line wrap on-off */	
			c = (!us->wrap);
			vt_set(addlf, c, capfp, docap, -1, -1, -1, -1);
			s = c ? _("Linewrap ON") : _("Linewrap OFF");
			werror("%s", s);
			break;
		case 'o': /* Configure Minicom */
			(void) config(0);
			break;
		case 's': /* Upload */
			updown('U', 0);
			break;
		case 'r': /* Download */
			updown('D', 0);
			break;	
		case 'j': /* Jump to a shell */
			shjump(0);
			break;
		case 'g': /* Run script */	
			runscript(1, "", "", "");
			break;
		case 'i': /* Re-init, re-open portfd. */
			cursormode = (cursormode == NORMAL) ? APPL : NORMAL;
			keyboard(cursormode == NORMAL ? KCURST : KCURAPP, 0);
			if (st) curs_status();
			break;
		default:
			break;
	}
  };

  /* Reset parameters */
  if (quit != NORESET)
	m_restorestate(portfd);
  else {
        if (P_LOGCONN[0] == 'Y' && online > 0)
	  do_log("%s", _("Quit without reset while online."));
	m_hupcl(portfd, 0);
  }
  if (capfp != (FILE *)0) fclose(capfp);
  wclose(us, 0);
  wclose(st, 0);
  wclose(stdwin, 1);
  set_privs();
  keyboard(KUNINSTALL, 0);
  if (lockfile[0]) unlink(lockfile);
  close(portfd);
  /* Please - if your system doesn't have uid_t and/or gid_t, define 'em
   * conditionally in "port.h".
   */
  chown(dial_tty, (uid_t)portuid, (gid_t)portgid);
  if (quit != NORESET && P_CALLIN[0])
	(void) fastsystem(P_CALLIN, CNULL, CNULL, CNULL);
  return(0);
}
