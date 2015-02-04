/*
 * config.c	Read and write the configuration file(s).
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 * // fmg 12/20/93 - Added color selection to Screen & Keyboard menu
 * // fmg 2/15/94 - Added macro filename & Macro define selection to
 *                  Screen & Keyboard menu. Added window for macro
 *                  definition.
 * // jl 04.09.97 - Added configuring the character conversion tables
 * // jl 09.09.97 - Save conversion table filename in the config file and
 *                  read the table at startup
 * // jl 22.02.98 - Setting for filename selection window
 * // acme 25.02.98 - i18n
 * // jl 05.04.98 - Handling the P_MUL option
 *    jl 06.07.98 - the P_CONVCAP option
 *    jl 10.07.98 - moved functions pfix_home and do_log to file common.c
 *    jl 29.11.98 - the P_SHOWSPD option
 *    jl 05.04.99 - logging options menu
 *    er 18-Apr-99 - the P_MULTILINE option
 *    jl 11.02.2000 - the P_STOPB option
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID("$Id: config.c,v 1.5 2003/04/21 23:56:46 al-guest Exp $")

#include "port.h"
#include "minicom.h"
#include "intl.h"

void doconv();   /* jl 04.09.97 */

/* Read in parameters. */
void read_parms()
{
  FILE *fp;
  int f;
  char buf[64];
  char *p;

  /* Read global parameters */
  if ((fp = fopen(parfile, "r")) == (FILE *)NULL) {
  	if (real_uid == 0) {
  		fputs(
  _("minicom: WARNING: configuration file not found, using defaults\n"),stderr);
  		sleep(2);
  		return;
  	}
  	fprintf(stderr,
	_("minicom: there is no global configuration file %s\n"), parfile);
  	fputs(_("Ask your sysadm to create one (with minicom -s).\n"), stderr);
  	exit(1);
  }
  readpars(fp, 1);
  fclose(fp);
  /* Read personal parameters */
  if ((fp = sfopen(pparfile, "r")) != (FILE *)NULL) {
	readpars(fp, 0);
	fclose(fp);
  }

  /* fmg - set colors from readin values (Jcolor Xlates name to #) */
  mfcolor = Jcolor(P_MFG); mbcolor = Jcolor(P_MBG);
  tfcolor = Jcolor(P_TFG); tbcolor = Jcolor(P_TBG);
  sfcolor = Jcolor(P_SFG); sbcolor = Jcolor(P_SBG);
 
#if _HAVE_MACROS
  /* fmg - Read personal macros */
  if (P_MACROS[0] != 0) { /* fmg - null length? */
	if ((fp = sfopen(pfix_home(P_MACROS), "r")) == NULL) {
		if (errno != ENOENT) {
                	fprintf(stderr,
                _("minicom: cannot open macro file %s\n"), pfix_home(P_MACROS));
                	sleep(1); /* fmg - give the "slow" ones time to read :-) */
		}
        } else {
                readmacs(fp, 0);
                fclose(fp);
        }
  } /* fmg - but it's perfectly OK if macros file name is NULL... */
  if (P_CONVF[0] != 0) { /* jl 09.09.97 */
    loadconv(P_CONVF);
  }
#endif

  /* This code is to use old configuration files. */
  for(f = PROTO_BASE; f < MAXPROTO; f++) {
	if (P_PNAME(f)[0] && P_PIORED(f) != 'Y' && P_PIORED(f) != 'N') {
		strncpy(buf, P_PNAME(f) - 2, sizeof(buf));
		strcpy(P_PNAME(f), buf);
		P_PIORED(f) = 'Y';
		P_PFULL(f) = 'N';
	}
  }
  if ((p = strrchr(P_LOCK, '/')) != NULL && strncmp(p, "/LCK", 4) == 0)
	*p = 0;
}

/*
 * fmg - Convert color word to number
 */
int Jcolor(s)
char *s;
{
        char c1, c3;

        c1 = toupper(s[0]); /* fmg - it's already up but why tempt it? */
        c3 = toupper(s[2]);

        switch (c1)
        {
                case 'G'        : return (GREEN);
                case 'Y'        : return (YELLOW);
                case 'W'        : return (WHITE);
                case 'R'        : return (RED);
                case 'M'        : return (MAGENTA);
                case 'C'        : return (CYAN);
                case 'B'        : if (c3 == 'A')
                                        return (BLACK);
                                  if (c3 == 'U')
                                        return (BLUE);
                                  else
                                        break;
        }
        return (-1); /* fmg - should never get here */
}
 
/*
 * See if we have write access to a file.
 * If it is not there, see if the directory is writable.
 */
int waccess(s)
char *s;
{
  char *p;
  char buf[128];
  struct stat stt;

  /* We use stat instead of access(s, F_OK) because I couldn't get
   * that to work under BSD 4.3 ...
   */
  if (stat(s, &stt) == 0) {
	if (access(s, W_OK) == 0)
		return(XA_OK_EXIST);
	return(-1);
  }
  strncpy(buf, s, sizeof(buf)-1);
  buf[sizeof(buf)-1]=0;
  if((p = strrchr(buf, '/')) == (char *)NULL)
  	strcpy(buf, ".");
  else
  	*p = '\0';
  if (access(buf, W_OK) == 0)
	return(XA_OK_NOTEXIST);
  return(-1);
}

#if _HAVE_MACROS
/*
 * fmg - Read in a macro, but first check to see if it's
 * allowed to do so.
 *
 * TODO: have System macros and user macros (in theory it's already there
 * since user can specify their own macros file (unless root makes it
 * private... that's silly) ... anyways, you know what I mean...)
 */
static void mgets(w, x, y, s, len, maxl)
WIN *w;
int x, y;
char *s;
int len;
int maxl;
{
  struct macs *m = (struct macs *)s;

  if ((m->flags & PRIVATE) && real_uid != 0) {
        werror(_("You are not allowed to change this parameter"));
        return;
  }
  wlocate(w, x, y);
  (void) wgets(w, s, len, maxl);
  m->flags |= CHANGED;
}
#endif

/*
 * Read in a string, but first check to see if it's
 * allowed to do so.
 */
static void pgets(w, x, y, s, len, maxl)
WIN *w;
int x, y;
char *s;
int len;
unsigned int maxl;
{
  struct pars *p = (struct pars *)s;
  char *home = NULL;

  if ((p->flags & PRIVATE) && real_uid != 0) {
  	werror(_("You are not allowed to change this parameter"));
  	return;
  }
  wlocate(w, x, y);
  (void) wgets(w, s, len, maxl);
  if (s[0] == '~' && (s[1] == '/' || s[1] == 0) &&
    (home = getenv("HOME")) && strlen(s) + strlen(home) <= maxl) {
    int i = 0;
    memmove(s + strlen(home), s + 1, strlen(s));
    memcpy(s, home, strlen(home));
    wlocate(w, x, y);
    for (i = 0; i < (len >= w->xs - x ? w->xs - x - 1 : len) && s[i]; i++)
      wputc(w, s[i]);
    wflush();
  }
  p->flags |= CHANGED;
}

/*
 * Mark a variable as changed.
 */
static void markch(s)
char *s;
{
  struct pars *p = (struct pars *)s;

  p->flags |= CHANGED;
}

/*
 * Set a string to a given value, but only if we're allowed to.
 */
static void psets(s, w)
char *s, *w;
{
  struct pars *p = (struct pars *)s;

  if ((p->flags & PRIVATE) && real_uid != 0) {
  	werror(_("You are not allowed to change this parameter"));
  	return;
  }
  strcpy(s, w);
  p->flags |= CHANGED;
}

/*
 * Get a a character from the keyboard. Translate lower
 * to uppercase and '\r' to '\n'.
 */
static int rwxgetch()
{
  int c;

  c = wxgetch();
  if (islower(c)) c = toupper(c);
  if (c == '\n' || c == '\r' || c == '\033') return('\n');
  return(c);
}

#ifdef LOGFILE
static void dologopt()
{
  WIN *w;
  int c;
  char *logfnstr = _(" A - File name (empty=disable) :"),
       *logconn  = _(" B - Log connects and hangups  :"),
       *logxfer  = _(" C - Log file transfers        :"),
       *question = _("Change which setting?");

  w = wopen(5, 4, 75, 8, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);

  wtitle(w, TMID, _("Logging options"));
  wprintf(w, "%s %s\n", logfnstr, P_LOGFNAME);
  wprintf(w, "%s %s\n", logconn, _(P_LOGCONN));
  wprintf(w, "%s %s\n", logxfer, _(P_LOGXFER));
  wlocate(w, 4, 4);
  wputs(w, question);
  wredraw(w, 1);
  while(1) {
    wlocate(w, strlen(question) + 5, 5);
    c = rwxgetch();
    switch(c) {
      case '\n':
	wclose(w, 1);
	return;
      case 'A':
	pgets(w, strlen(logfnstr) + 1, 0,
	      P_LOGFNAME, PARS_VAL_LEN, PARS_VAL_LEN);
	strcpy(logfname,P_LOGFNAME);
	break;
      case 'B':
	strcpy(P_LOGCONN, yesno(P_LOGCONN[0] == 'N'));
	wlocate(w, strlen(logconn) + 1, 1);
	wprintf(w, "%s  ", _(P_LOGCONN));
	markch(P_LOGCONN);
	break;
      case 'C':
	strcpy(P_LOGXFER, yesno(P_LOGXFER[0] == 'N'));
	wlocate(w, strlen(logxfer) + 1, 2);
	wprintf(w, "%s  ", _(P_LOGXFER));
	markch(P_LOGXFER);
	break;
      default:
	break;
    }
  }
}
#endif

static void dopath()
{
  WIN *w;
  int c;
  char* download_directory = _(" A - Download directory :"),
      * upload_directory = _(" B - Upload directory   :"),
      * script_directory = _(" C - Script directory   :"),
      * script_program = _(" D - Script program     :"),
      * kermit_program = _(" E - Kermit program     :"),
      * log_settings   = _(" F - Logging options"),
      * question = _("Change which setting?");
  
  w = wopen(5, 5, 75, 12, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
  wprintf(w, "%s %.44s\n", download_directory, P_DOWNDIR);
  wprintf(w, "%s %.44s\n", upload_directory, P_UPDIR);
  wprintf(w, "%s %.44s\n", script_directory, P_SCRIPTDIR);
  wprintf(w, "%s %.44s\n", script_program, P_SCRIPTPROG);
  wprintf(w, "%s %.44s\n", kermit_program, P_KERMIT);
#ifdef LOGFILE
  wprintf(w, "%s\n", log_settings);
#endif
  wlocate(w, 4, 8);
  wputs(w, question);

  wredraw(w, 1);

  while(1) {
      wlocate(w, strlen (question) + 5, 8);
      c = rwxgetch();
      switch(c) {
  	case '\n':
  		wclose(w, 1);
  		return;
  	case 'A':
  		pgets(w, strlen (download_directory) + 1, 0, P_DOWNDIR, 64, 64);
		init_dir('d');
  		break;
  	case 'B':
  		pgets(w, strlen (upload_directory) + 1, 1, P_UPDIR, 64, 64);
		init_dir('u');
  		break;
  	case 'C':
  		pgets(w, strlen (script_directory) + 1, 2, P_SCRIPTDIR, 64, 64);
  		break;
  	case 'D':
  		pgets(w, strlen (script_program) + 1, 3, P_SCRIPTPROG, 64, 64);
  		break;
  	case 'E':
  		pgets(w, strlen (kermit_program) + 1, 4, P_KERMIT, 64, 64);
  		break;
#ifdef LOGFILE
  	case 'F':
		dologopt();
		break;  
#endif
  	default:
  		break;
      }
  }
}

char *yesno(k)
int k;
{
  return(k ? N_("Yes") : N_("No "));
}

/*
 * Input the definition of an up/download protocol.
 */
static void inputproto(w, n)
WIN *w;
int n;
{
  int c = 0;

  mpars[PROTO_BASE + n].flags |= CHANGED;

  if (P_PNAME(n)[0] == '\0') {
  	P_PNN(n) = 'Y';
  	P_PUD(n) = 'U';
	P_PFULL(n) = 'N';
	P_PPROG(n)[0] = 0;
	P_PIORED(n) = 'Y';
  	wlocate(w, 4, n+1);
  	wputs(w, "       ");
  }
  wlocate(w, 4, n+1);
  (void ) wgets(w, P_PNAME(n), 10, 64);
  pgets(w, 15, n+1, P_PPROG(n), 31, 64);
  do {
	wlocate(w, 47, n+1);
	wprintf(w, "%c", P_PNN(n));
	c = rwxgetch();
	if (c == 'Y') P_PNN(n) = 'Y';
	if (c == 'N') P_PNN(n) = 'N';
  } while(c != '\r' && c != '\n');
  do {
	wlocate(w, 52, n+1);
	wprintf(w, "%c", P_PUD(n));
	c = rwxgetch();
	if (c == 'U') P_PUD(n) = 'U';
	if (c == 'D') P_PUD(n) = 'D';
  } while(c != '\r' && c != '\n');
  do {
	wlocate(w, 57, n+1);
	wprintf(w, "%c", P_PFULL(n));
	c = rwxgetch();
	if (c == 'Y') P_PFULL(n) = 'Y';
	if (c == 'N') P_PFULL(n) = 'N';
  } while(c != '\r' && c != '\n');
  do {
	wlocate(w, 65, n+1);
	wprintf(w, "%c", P_PIORED(n));
	c = rwxgetch();
	if (c == 'Y') P_PIORED(n) = 'Y';
	if (c == 'N') P_PIORED(n) = 'N';
  } while(c != '\r' && c != '\n');
  do {
    	wlocate(w, 73, n+1);
	wprintf(w, "%c", P_MUL(n));
	c = rwxgetch();
	if (c == 'Y') P_MUL(n) = 'Y';
	if (c == 'N') P_MUL(n) = 'N';
  } while (c != '\r' && c != '\n');
}

static void doproto()
{
  WIN *w;
  int f, c;
  char* zmodem_download = _("M  Zmodem download string activates..."),
      * use_filename_selection = _("N  Use filename selection window......"),
      * prompt_downdir =         _("O  Prompt for download directory......"),
      * question = _("Change which setting? (SPACE to delete)");

  w = wopen(1, 3, 78, 20, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
  wputs(w, _("     Name             Program"));
  wlocate(w, 46, 0);
  wputs(w, _("Name U/D FullScr IO-Red. Multi"));
  for(f = 0; f < 12; f++) {
     wlocate(w, 1, f+1);
     if (P_PNAME(f)[0])
  	wprintf(w, "%c  %-10.10s %-31.31s %c    %c    %c       %c       %c",
		'A' + f,
  		P_PNAME(f), P_PPROG(f),
  		P_PNN(f), P_PUD(f),
		P_PFULL(f), P_PIORED(f),
	  	P_MUL(f));
     else
        wprintf(w, "%c    -", 'A' + f);
  }
  wlocate(w, 1, 13);
  wprintf(w, "%s %c", zmodem_download, P_PAUTO[0]);
  wlocate(w, 1, 14);
  wprintf(w, "%s %s", use_filename_selection, _(P_FSELW));
  wlocate(w, 1, 15);
  wprintf(w, "%s %s", prompt_downdir, _(P_ASKDNDIR));

  wlocate(w, 3, 17);
  wputs(w, question);
  wredraw(w, 1);

  do {
  	wlocate(w, strlen (question) + 4, 17);
  	c = rwxgetch();
  	if (c >= 'A' && c <= 'L') inputproto(w, c - 'A');
  	if (c == ' ') {
  		wlocate(w, 3, 17);
  		wputs(w, _("Delete which protocol? "));
  		wclreol(w);
  		c = rwxgetch();
  		if (c >= 'A' && c <= 'L') {
  			P_PNAME(c - 'A')[0] = '\0';
  			mpars[PROTO_BASE + (c - 'A')].flags |= CHANGED;
  			wlocate(w, 3, c - 'A' + 1);
  			wclreol(w);
  			wputs(w, "   -");
  		}
		wlocate(w, 3, 17);
		wputs(w, question);
		c = ' ';
	}
	else if (c == 'M') {
		wlocate(w, strlen (zmodem_download) + 2, 13);
		wprintf(w, " \b");
		c = rwxgetch();
		if (c >= 'A' && c <= 'L') {
			P_PAUTO[0] = c;
			markch(P_PAUTO);
			wprintf(w, "%c", c);
		} else if (c == '\n' || c == ' ') {
			P_PAUTO[0] = ' ';
			markch(P_PAUTO);
		} else {
			wprintf(w, "%c", P_PAUTO[0]);
		}
		c = 0;
	}
	else if (c == 'N') {
		strcpy(P_FSELW, yesno(P_FSELW[0] == 'N'));
		if (P_FSELW[0] == 'N') {
		  strcpy(P_ASKDNDIR, "No ");
		  wlocate(w, strlen (prompt_downdir) + 2, 15);
		  wprintf(w, "%s ", _(P_ASKDNDIR));
		  markch(P_ASKDNDIR);
		}
		wlocate(w, strlen (use_filename_selection) + 2, 14);
		wprintf(w, "%s ", _(P_FSELW));
		markch(P_FSELW);
	}
	else if (c == 'O') {
	  	strcpy(P_ASKDNDIR, yesno(P_ASKDNDIR[0] == 'N'));
		if (P_ASKDNDIR[0] == 'Y') {
		  strcpy(P_FSELW, "Yes");
		  wlocate(w, strlen (use_filename_selection) + 2, 14);
		  wprintf(w, "%s ", _(P_FSELW));
		  markch(P_FSELW);
		}
		wlocate(w, strlen (prompt_downdir) + 2, 15);
		wprintf(w, "%s ", _(P_ASKDNDIR));
		markch(P_ASKDNDIR);
	}
  } while(c != '\n');
  wclose(w, 1);
}

static void doserial()
{
  WIN *w;
  char* serial_device = _(" A -    Serial Device      :"),
      * lockfile_location = _(" B - Lockfile Location     :"),
      * callin_program = _(" C -   Callin Program      :"),
      * callout_program = _(" D -  Callout Program      :"),
      * bps_par_bits = _(" E -    Bps/Par/Bits       :"),
      * hardware_flow_control = _(" F - Hardware Flow Control :"),
      * software_flow_control = _(" G - Software Flow Control :"),
      * question = _("Change which setting?");

  w = wopen(5, 4, 75, 12, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
  wprintf(w, "%s %.41s\n", serial_device, P_PORT);
  wprintf(w, "%s %.41s\n", lockfile_location, P_LOCK);
  wprintf(w, "%s %.41s\n", callin_program, P_CALLIN);
  wprintf(w, "%s %.41s\n", callout_program, P_CALLOUT);
  wprintf(w, "%s %s %s%s%s\n",
	  bps_par_bits, P_BAUDRATE, P_BITS, P_PARITY, P_STOPB);
  wprintf(w, "%s %s\n", hardware_flow_control, _(P_HASRTS));
  wprintf(w, "%s %s\n", software_flow_control, _(P_HASXON));
  wlocate(w, 4, 8);
  wputs(w, question);
  wredraw(w, 1);

  while(1) {
      wlocate(w, strlen (question) + 5, 8);
      switch(rwxgetch()) {
  	case '\n':
  		wclose(w, 1);
  		return;
  	case 'A':
  		pgets(w, strlen (serial_device) + 1, 0, P_PORT, 64, 64);
  		break;
  	case 'B':
  		pgets(w, strlen (lockfile_location) + 1, 1, P_LOCK, 64, 64);
  		break;
  	case 'C':
  		pgets(w, strlen (callin_program) + 1, 2, P_CALLIN, 64, 64);
  		break;
  	case 'D':
  		pgets(w, strlen (callout_program) + 1, 3, P_CALLOUT, 64, 64);
  		break;
  	case 'E':
  		get_bbp(P_BAUDRATE, P_BITS, P_PARITY, P_STOPB, 0);
  		if (portfd >= 0) port_init();
  		wlocate(w, strlen (bps_par_bits) + 1, 4);
		wprintf(w, "%s %s%s%s  \n",
			P_BAUDRATE, P_BITS, P_PARITY, P_STOPB);
		if (st != NIL_WIN) mode_status();
		markch(P_BAUDRATE);
		markch(P_BITS);
		markch(P_PARITY);
		markch(P_STOPB);
		break;
	case 'F':
		strcpy(P_HASRTS, yesno(P_HASRTS[0] == 'N'));
		wlocate(w, strlen (hardware_flow_control) + 1, 5);
		wprintf(w, "%s ", _(P_HASRTS));
  		if (portfd >= 0) port_init();
		markch(P_HASRTS);
		break;
	case 'G':
		strcpy(P_HASXON, yesno(P_HASXON[0] == 'N'));
		wlocate(w, strlen (software_flow_control) + 1, 6);
		wprintf(w, "%s ", _(P_HASXON));
  		if (portfd >= 0) port_init();
		markch(P_HASXON);
		break;
  	default:
  		break;
      }
  }
}

char * sspd(char *sptyp)
{
  if (sptyp[0] == 'd')
    return (_("DTE speed "));
  else
    return (_("line speed"));
}

static void domodem()
{
  WIN *w;
  char *str;
  int c, x, y, ypos, maxl, string_size;
  char* init_string = _(" A - Init string ........."),
      * reset_string = _(" B - Reset string ........"),
      * dialing_prefix_1 = _(" C - Dialing prefix #1...."),
      * dialing_suffix_1 = _(" D - Dialing suffix #1...."),
      * dialing_prefix_2 = _(" E - Dialing prefix #2...."),
      * dialing_suffix_2 = _(" F - Dialing suffix #2...."),
      * dialing_prefix_3 = _(" G - Dialing prefix #3...."),
      * dialing_suffix_3 = _(" H - Dialing suffix #3...."),
      * connect_string = _(" I - Connect string ......"),
      * no_connect_strings = _(" J - No connect strings .."),
      * hangup_string = _(" K - Hang-up string ......"),
      * dial_cancel_string = _(" L - Dial cancel string .."),
      * dial_time = _(" M - Dial time ..........."),
      * delay_before_redial = _(" N - Delay before redial ."),
      * number_of_tries = _(" O - Number of tries ....."),
      * dtr_drop_time = _(" P - DTR drop time (0=no)."),
      * auto_bps_detect = _(" Q - Auto bps detect ....."),
      * modem_has_dcd_line = _(" R - Modem has DCD line .."),
      * shown_speed = _(" S - Status line shows ..."),
      * multi_node = _(" T - Multi-line untag ...."),
      * question = _("Change which setting?");

  w = wopen(2, 2, 77, 22, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);

  dirflush = 0;
  wtitle(w, TMID, _("Modem and dialing parameter setup"));
  wprintf(w, "\n");
  wprintf(w, "%s %.48s\n", init_string, P_MINIT);
  wprintf(w, "%s %.48s\n", reset_string, P_MRESET);
  wprintf(w, "%s %.48s\n", dialing_prefix_1, P_MDIALPRE);
  wprintf(w, "%s %.48s\n", dialing_suffix_1, P_MDIALSUF);
  wprintf(w, "%s %.48s\n", dialing_prefix_2, P_MDIALPRE2);
  wprintf(w, "%s %.48s\n", dialing_suffix_2, P_MDIALSUF2);
  wprintf(w, "%s %.48s\n", dialing_prefix_3, P_MDIALPRE3);
  wprintf(w, "%s %.48s\n", dialing_suffix_3, P_MDIALSUF3);
  wprintf(w, "%s %.48s\n", connect_string, P_MCONNECT);
  wprintf(w, "%s %-20.20s  %.20s\n", no_connect_strings, P_MNOCON1, P_MNOCON2);
  wlocate(w, strlen (no_connect_strings) + 1, 11);
  wprintf(w, "%-20.20s  %.20s\n", P_MNOCON3, P_MNOCON4);
  wprintf(w, "%s %.48s\n", hangup_string, P_MHANGUP);
  wprintf(w, "%s %.48s\n", dial_cancel_string, P_MDIALCAN);
  wprintf(w, "\n");
  wprintf(w, "%s %.3s\n", dial_time, P_MDIALTIME);
  wprintf(w, "%s %.3s\n", delay_before_redial, P_MRDELAY);
  wprintf(w, "%s %.3s\n", number_of_tries, P_MRETRIES);
  wprintf(w, "%s %.3s\n", dtr_drop_time, P_MDROPDTR);
  wlocate(w, 34, 15);
  wprintf(w, "%s %s\n", auto_bps_detect, _(P_MAUTOBAUD));
  wlocate(w, 34, 16);
  wprintf(w, "%s %s\n", modem_has_dcd_line, _(P_HASDCD));
  wlocate(w, 34, 17);
  wprintf(w, "%s %s\n", shown_speed, sspd(P_SHOWSPD));
  wlocate(w, 34, 18); /* Option for multi-node untag */
  wprintf(w, "%s %s\n", multi_node, _(P_MULTILINE));	/* er 18-Apr-99 */

  wlocate(w, 1, 20);
  wprintf(w, "%s ", question);
  x = w->curx; y = w->cury;
  wprintf(w, _("      (Return or Esc to exit)"));
  wredraw(w, 1);

  while(1) {
  	wlocate(w, x, y);
  	wflush();
  	c = rwxgetch();
  	ypos = 1;
	maxl = 64;
	string_size = 0;
  	switch(c) {
  		case 'M':
			if (string_size == 0)
			  string_size = strlen (dial_time);
  		case 'N':
			if (string_size == 0)
			  string_size = strlen (delay_before_redial);
  		case 'O':
			if (string_size == 0)
			  string_size = strlen (number_of_tries);
	    	case 'P':
			if (string_size == 0)
			  string_size = strlen (dtr_drop_time);
			  
  			ypos++;
			maxl = 4;
  		case 'K':
			if (string_size == 0)
			  string_size = strlen (hangup_string);
  		case 'L':
			if (string_size == 0)
			  string_size = strlen (dial_cancel_string);

  			ypos -= 2;
  			c += 3;
  		case 'A':
			if (string_size == 0)
			  string_size = strlen (init_string);
  		case 'B':
			if (string_size == 0)
			  string_size = strlen (reset_string);
  		case 'C':
			if (string_size == 0)
			  string_size = strlen (dialing_prefix_1);
  		case 'D':
			if (string_size == 0)
			  string_size = strlen (dialing_suffix_1);
  		case 'E':
			if (string_size == 0)
			  string_size = strlen (dialing_prefix_2);
		case 'F':
			if (string_size == 0)
			  string_size = strlen (dialing_suffix_2);
		case 'G':
			if (string_size == 0)
			  string_size = strlen (dialing_prefix_3);
		case 'H':
			if (string_size == 0)
			  string_size = strlen (dialing_suffix_3);
		case 'I':
			if (string_size == 0)
			  string_size = strlen (connect_string);

  			/* Calculate adress of string tomodify */
  			str = P_MINIT + (c - 'A') * sizeof(struct pars);
  			pgets(w, string_size + 1, ypos + (c - 'A'), str, maxl, maxl);
  			break;
  		case 'J':
		        string_size = strlen (no_connect_strings);
  			/* Walk through all four */
  			pgets(w, string_size + 1, 10, P_MNOCON1, 20, 64);
  			pgets(w, string_size + 1 + 22, 10, P_MNOCON2, 20, 64);
  			pgets(w, string_size + 1 , 11, P_MNOCON3, 20, 64);
  			pgets(w, string_size + 1 + 22, 11, P_MNOCON4, 20, 64);
  			break;
  		case 'Q':
  			psets(P_MAUTOBAUD, yesno(P_MAUTOBAUD[0] == 'N'));
  			wlocate(w, 35 + strlen (auto_bps_detect), 15);
  			wputs(w, _(P_MAUTOBAUD));
  			break;
  		case 'R':
  			psets(P_HASDCD, yesno(P_HASDCD[0] == 'N'));
  			wlocate(w, 35 + strlen (modem_has_dcd_line), 16);
  			wputs(w, _(P_HASDCD));
  			break;
		case 'S':
			psets(P_SHOWSPD, P_SHOWSPD[0] == 'd' ? "l": "d");
			wlocate(w, 35 + strlen (shown_speed), 17);
			wputs(w, sspd(P_SHOWSPD));
			mode_status();
			break;
		case 'T': /* Update for multi-node */
			psets(P_MULTILINE, yesno(P_MULTILINE[0] == 'N' ));
			wlocate(w, 35 + strlen(multi_node), 18);
			wputs(w, _(P_MULTILINE));
			break;
							/* er 18-Apr-99 */
		case '\n':
  			dirflush = 1;
  			wclose(w, 1);
  			return;
  		default:
  			break;	
  	}
  }
}


/*
 * Screen and keyboard menu.
 */
static void doscrkeyb()
{
  WIN *w, *w1;
  int c;
  int once = 0;
  int clr = 1;
  int tmp_c;    /* fmg - need it to color keep in sanity checks */
  char buf[16];
  int miny = 4, 
  maxy = 17;
  int old_stat = P_STATLINE[0];
  char* command_key = _(" A - Command key is         :"),
      * backspace_key = _(" B - Backspace key sends    :"),
      * status_line = _(" C - Status line is         :"),
      * alarm_sound = _(" D - Alarm sound            :"),
      * foreground_color_menu = _(" E - Foreground Color (menu):"),
      * background_color_menu = _(" F - Background Color (menu):"),
      * foreground_color_term = _(" G - Foreground Color (term):"),
      * background_color_term = _(" H - Background Color (term):"),
      * foreground_color_stat = _(" I - Foreground Color (stat):"),
      * background_color_stat = _(" J - Background Color (stat):"),
      * history_buffer_size = _(" K - History Buffer Size    :"),
      * question = _("Change which setting?  (Esc to exit)");
#if _HAVE_MACROS
  char* macros_file = _(" L - Macros file            :"),
      * macros_enabled = _(" N - Macros enabled         :"),
      * character_conversion = _(" O - Character conversion   :");

  FILE	*fp;

  miny = 3;
  maxy = 20;
#endif

  w = wopen(15, miny, 69, maxy, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);

  wtitle(w, TMID, _("Screen and keyboard"));

  wprintf(w, "\n%s %s\n", command_key, P_ESCAPE);
  wprintf(w, "%s %s\n", backspace_key, P_BACKSPACE);
  wprintf(w, "%s %s\n", status_line, _(P_STATLINE));
  wprintf(w, "%s %s\n", alarm_sound, _(P_SOUND));
  /* fmg - colors support */
  wprintf(w, "%s %s\n", foreground_color_menu, _(J_col[mfcolor]));
  wprintf(w, "%s %s\n", background_color_menu, _(J_col[mbcolor]));
  wprintf(w, "%s %s\n", foreground_color_term, _(J_col[tfcolor]));
  wprintf(w, "%s %s\n", background_color_term, _(J_col[tbcolor]));
  wprintf(w, "%s %s\n", foreground_color_stat, _(J_col[sfcolor]));
  wprintf(w, "%s %s\n", background_color_stat, _(J_col[sbcolor]));
  
  /* MARK updated 02/17/95 - Configurable history buffer size */
  wprintf(w, "%s %s\n", history_buffer_size, P_HISTSIZE);

#if _HAVE_MACROS
  /* fmg - macros support */
  wprintf(w, "%s %s\n", macros_file, P_MACROS);
  wprintf(w, _(" M - Edit Macros\n"));
  wprintf(w, "%s %s\n", macros_enabled, _(P_MACENAB));
  wprintf(w, "%s %s\n", character_conversion, P_CONVF);
#endif

  wredraw(w, 1);

  while(1) {
  	if (clr) {
  		wlocate(w, 2, maxy - miny);
		wprintf(w, "%s ", question);
		wclreol(w);
		clr = 0;
	} else
  		wlocate(w, strlen (question) + 3, maxy - miny);

  	if (once) {	/* fmg - allow to force looping */
  		c = once;
  		once = 0;
	} else c = rwxgetch();
#if 0 /* This might save us someday */
	if (!usecolor && (c >= 'E' && c <= 'J')) {
		werror(_("You can't change colors in black and white mode"));
		continue;
	}
#endif
  	switch(c) {
  		case '\n':
                 /* fmg - sanity checks... "we found the enemy and he is us" :-) */

                 if (mfcolor == mbcolor)   /* oops... */
                 {
                    tmp_c=mfcolor;      /* save color (same for both, right?) */
                    mfcolor=WHITE;      /* make sure they can see error :-) */
                    mbcolor=BLACK;
                    werror(_("Menu foreground == background color, change!"));
                    mfcolor=tmp_c;      /* restore colors */
                    mbcolor=tmp_c;
                    break;
                 }
                 if (tfcolor == tbcolor)   /* oops... */
                 {
                    tmp_c=mfcolor;      /* save color (same for both, right?) */
                    mfcolor=WHITE;      /* make sure they can see error :-) */
                    mbcolor=BLACK;
                    werror(_("Terminal foreground == background color, change!"));
                    mfcolor=tmp_c;      /* restore colors */
                    mbcolor=tmp_c;
                    break;
                 }
                 /* fmg - I'll let them change sfcolor=sbcolor because it's just
                          another way of turning "off" the status line... */

			/* MARK updated 02/17/95, Warn user to restart */
			/* minicom if they changed history buffer size */
			if (atoi(P_HISTSIZE) != num_hist_lines) {
				w1 = wopen(14, 9, 70, 15, BSINGLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
				wtitle(w1, TMID, _("History Buffer Size"));
				wputs(w1, _("\n\
  You have changed the history buffer size.\n\
  You will need to save the configuration file and\n\
  restart minicom for the change to take effect.\n\n\
  Hit a key to Continue... "));
				wredraw(w1, 1);
				c = wxgetch();
				wclose(w1, 1);
			}

  			wclose(w, 1);
			/* If status line enabled/disabled resize screen. */
			if (P_STATLINE[0] != old_stat)
				init_emul(terminal, 0);
  			return;
  		case 'A':
  			w1 = wopen(11, 8, 73, 17, BSINGLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
			wtitle(w1, TMID, _("Program new command key"));
			wputs(w1, _("\n Press the new command key. If you want to use\n"));
			wputs(w1, _(" the META or ALT key enter:\n\n"));
			wputs(w1, _("  o SPACE if your meta key sets the 8th bit high\n"));
			wputs(w1, _("  o ESC   if your meta key sends the ESCAPE prefix (standard)\n"));
			wputs(w1, _("\n\n Press new command key: "));
			wredraw(w1, 1);
			c = wxgetch();
			wclose(w1, 1);
  			if (c  == ' ')
  				strcpy(buf, N_("Meta-8th bit "));
  			else if (c == 27)
				strcpy(buf, N_("Escape (Meta)"));
			else
  				sprintf(buf, "^%c           ", (c & 0x1f) + 'A' - 1);
  			psets(P_ESCAPE, buf);
  			wlocate(w, strlen (command_key) + 1, 1);
  			wputs(w, _(buf));
  			clr = 1;
  			alt_override = 0;
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
  			if (st) show_status();
  			break;
  		case 'B':
  			if (P_BACKSPACE[0] == 'D')
  				psets(P_BACKSPACE, "BS");
  			else
  				psets(P_BACKSPACE, "DEL");
  			wlocate(w, strlen (backspace_key) + 1, 2);
  			wprintf(w, "%s ", P_BACKSPACE);
			keyboard(KSETBS, P_BACKSPACE[0] == 'B' ? 8 : 127);
  			break;
  		case 'C':
  			if (P_STATLINE[0] == 'e') {
  				psets(P_STATLINE, N_("disabled"));
  				tempst = 1;
  			} else {
  				psets(P_STATLINE, N_("enabled"));
  				/* See if it fits on screen */
  				if (LINES > 24) tempst = 0;
  			}
  			wlocate(w, strlen (status_line) + 1, 3);
  			wprintf(w, "%s ", _(P_STATLINE));
  			break;
		case 'D':
			psets(P_SOUND, yesno(P_SOUND[0] == 'N'));
			wlocate(w, strlen (alarm_sound) + 1, 4);
			wprintf(w, "%s", _(P_SOUND));
			break;
                case 'E': /* fmg - letters cycle colors */
                        if (mfcolor == WHITE)
                                mfcolor = BLACK;
                        else
                                mfcolor++;
                        psets(P_MFG, J_col[mfcolor]);
                        wlocate(w, strlen (foreground_color_menu) + 1, 5);
                        wprintf(w, "%s   ", _(J_col[mfcolor]));
                        break;
                case 'F': /* fmg - letters cycle colors */
                        if (mbcolor == WHITE)
                                mbcolor = BLACK;
                        else
                                mbcolor++;
                        psets(P_MBG, J_col[mbcolor]);
                        wlocate(w, strlen (background_color_menu) + 1, 6);
                        wprintf(w, "%s   ", _(J_col[mbcolor]));
                        break;
                case 'G': /* fmg - letters cycle colors */
                        if (tfcolor == WHITE)
                                tfcolor = BLACK;
                        else
                                tfcolor++;
                        psets(P_TFG, J_col[tfcolor]);
                        wlocate(w, strlen (foreground_color_term) + 1, 7);
                        wprintf(w, "%s   ", _(J_col[tfcolor]));
			if (us) vt_pinit(us, tfcolor, tbcolor);
                        break;
                case 'H': /* fmg - letters cycle colors */
                        if (tbcolor == WHITE)
                                tbcolor = BLACK;
                        else
                                tbcolor++;
                        psets(P_TBG, J_col[tbcolor]);
                        wlocate(w, strlen (background_color_term) + 1, 8);
                        wprintf(w, "%s   ", _(J_col[tbcolor]));
			if (us) vt_pinit(us, tfcolor, tbcolor);
                        break;
                case 'I': /* fmg - letters cycle colors & redraw stat line */
                        if (sfcolor == WHITE)
                                sfcolor = BLACK;
                        else
                                sfcolor++;

                        /* fmg - this causes redraw of status line (if any)
                                 in current color */

                        if (st)
                        {
                                wclose(st,0);
                                st = wopen(0, LINES - 1, COLS - 1, LINES - 1, BNONE,
                                         XA_NORMAL, sfcolor, sbcolor, 1, 0, 1);
                                show_status();
                        }
                        psets(P_SFG, J_col[sfcolor]);
                        wlocate(w, strlen (foreground_color_stat) + 1, 9);
                        wprintf(w, "%s   ", _(J_col[sfcolor]));
                        break;
                case 'J': /* fmg - letters cycle colors & redraw stat line */
                        if (sbcolor == WHITE)
                                sbcolor = BLACK;
                        else
                                sbcolor++;

                        /* fmg - this causes redraw of status line (if any)
                                 in current color */

                        if (st)
                        {
                                wclose(st,0);
                                st = wopen(0, LINES - 1, COLS - 1, LINES - 1, BNONE,
                                         XA_NORMAL, sfcolor, sbcolor, 1, 0, 0);
                                show_status();
                        }
                        psets(P_SBG, J_col[sbcolor]);
                        wlocate(w, strlen (background_color_stat) + 1, 10);
                        wprintf(w, "%s   ", _(J_col[sbcolor]));
                        break;
		case 'K': /* MARK updated 02/17/95 - Config history size */
#if HISTORY
		  	pgets(w, strlen (history_buffer_size) + 1, 11,
			      P_HISTSIZE, 5, 5);
                        
                        /* In case gibberish or a value was out of bounds, */
                        /* limit history buffer size between 0 to 5000 lines */
                        /* 5000 line history at 80 columns consumes about */
                        /* 800 kilobytes including chars and attrs bytes! */
                        if (atoi(P_HISTSIZE) <= 0) 
                        	strcpy(P_HISTSIZE,"0");
                        else if (atoi(P_HISTSIZE) >= 5000)
                        	strcpy(P_HISTSIZE,"5000");
	                        
                        wlocate(w, strlen (history_buffer_size) + 1, 11);
                        wprintf(w, "%s     ", P_HISTSIZE);
#else
			werror(_("This system does not support history"));
#endif
			break;
#if _HAVE_MACROS
                case 'L': /* fmg - get local macros storage file */
                        pgets(w, strlen (macros_file) + 1, 12, P_MACROS, 64, 64);

			/* Try to open the file to read it in. */
			fp = sfopen(pfix_home(P_MACROS), "r+");
			if (fp == NULL) {
			    if (errno == EPERM) {
				/* Permission denied, hacker! */
				werror(_("ERROR: you do not have permission to create a file there!"));
				once = 'J'; /* fmg - re-enter it! */
				continue;
			    }
			    if (errno != ENOENT) {
				/* File does exist, but cannot be opened. */
				werror(_("ERROR: cannot open macro file %s"),
					pfix_home(P_MACROS));
			    }
			    continue;
			}
			/* Read macros from the file. */
			werror(_("Reading macros"));
			readmacs(fp, 0);
			fclose(fp);
                        break;
                case 'M': /* fmg - Bring up macro editing window */
                        domacros();
                        break;
		case 'N':
			psets(P_MACENAB, yesno(P_MACENAB[0] == 'N'));
			wlocate(w, strlen (macros_enabled) + 1, 14);
			wprintf(w, "%s", _(P_MACENAB));
			break;
	        case 'O': /* Character conversions - jl / 04.09.97 */
		        doconv();
			wlocate(w, strlen (character_conversion) + 1, 15);
			wprintf(w, "%-16.16s", _(P_CONVF));
			break;
#endif
  	}
  }
}

/*
 * This is the 'T' menu - terminal parameters. Does NOT set the new
 * terminal type, but returns it to the calling functions that has
 * to call init_emul itself.
 */
int dotermmenu()
{
  WIN *w;
  int c;
  int new_term = -1;
  int old_stat = P_STATLINE[0];
  extern int use_status;
  char buf[8];
  extern int vt_nl_delay;
  char* terminal_emulation = _(" A - Terminal emulation  :"),
      * backspace_key_sends = _(" B - Backspace key sends :"),
      * status_line = _(" C -      Status line is :"),
      * msg_nl_delay = _(" D -  Newline delay (ms) :"),
      * question = _("Change which setting?");

  w = wopen(20, 7, 59, 14, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
  wtitle(w, TMID, _("Terminal settings"));
  wprintf(w, "\n");
  wprintf(w, "%s %s\n", terminal_emulation, terminal == VT100 ? "VT102" : "ANSI");
  wprintf(w, "%s %s\n", backspace_key_sends, P_BACKSPACE);
  wprintf(w, "%s %s\n", status_line, _(P_STATLINE));
  wprintf(w, "%s %d\n", msg_nl_delay, vt_nl_delay);
  wlocate(w, 4, 6);
  wputs(w, question);

  wredraw(w, 1);

  while(1) {
      wlocate(w, strlen (question) + 5, 6);
      c = rwxgetch();
      switch(c) {
  	case '\n':
  		wclose(w, 1);
		/* If status line enabled/disabled resize screen. */
		if (P_STATLINE[0] != old_stat && new_term < 0)
			init_emul(terminal, 0);
  		return(new_term);
  	case 'A':
		if (new_term < 0) new_term = terminal;
		if (new_term == VT100) {
			new_term = ANSI;
  			psets(P_BACKSPACE, "BS");
		} else {
			new_term = VT100;
  			psets(P_BACKSPACE, "DEL");
		}
		wlocate(w, strlen (terminal_emulation) + 1, 1);
		wprintf(w, "%s ", new_term == VT100 ? "VT102" : "ANSI");
  		wlocate(w, strlen (backspace_key_sends) + 1, 2);
  		wprintf(w, "%s ", P_BACKSPACE);
		keyboard(KSETBS, P_BACKSPACE[0] == 'B' ? 8 : 127);
  		break;
  	case 'B':
  		if (P_BACKSPACE[0] == 'D')
  			psets(P_BACKSPACE, "BS");
  		else
  			psets(P_BACKSPACE, "DEL");
  		wlocate(w, strlen (backspace_key_sends) + 1, 2);
  		wprintf(w, "%s ", P_BACKSPACE);
		keyboard(KSETBS, P_BACKSPACE[0] == 'B' ? 8 : 127);
  		break;
  	case 'C':
		if (P_STATLINE[0] == 'e') {
			psets(P_STATLINE, N_("disabled"));
			tempst = 1;
		} else {
			psets(P_STATLINE, N_("enabled"));
			/* See if it fits on screen */
			if (LINES > 24 || use_status)
				tempst = 0;
		}
		wlocate(w, strlen (status_line) + 1, 3);
		wprintf(w, "%s ", _(P_STATLINE));
		break;
	case 'D':
		sprintf(buf, "%d", vt_nl_delay);
		wlocate(w, strlen(msg_nl_delay) +1, 4);
		wgets(w, buf, 4, 4);
		vt_nl_delay = atoi(buf);
		wlocate(w, strlen(msg_nl_delay) +1, 4);
		wprintf(w, "%-3d", vt_nl_delay);
		break;
  	default:
  		break;
      }
  }
}


/*
 * Save the configuration.
 */
void vdodflsave()
{
	dodflsave();
}

/*
 * Save the configuration.
 */
int dodflsave()
{
  FILE *fp;

  /* Root saves new configuration */
  if (real_uid == 0) {
  	if ((fp = fopen(parfile, "w")) == (FILE *)NULL) {
  		werror(_("Cannot write to %s"), parfile);
  		return(-1);
  	}
  	writepars(fp, 1);
	fclose(fp);
	werror(_("Configuration saved"));
  } else {
	/* Mortals save their own configuration */
	if ((fp = sfopen(pparfile, "w")) == (FILE *)NULL) {
  		werror(_("Cannot write to %s"), pparfile);
  		return (-1);
	}
	writepars(fp, 0);
	fclose(fp);
	werror(_("Configuration saved"));
  }
#if _HAVE_MACROS
  if (domacsave() < 0) /* fmg - something went wrong... */
	return(-1);
#endif
  return(0);
}

#if _HAVE_MACROS
/*
 * Save the macros. (fmg)
 */
int domacsave()
{
  FILE *fp;

  /* fmg - do some basic silly-mortal checks and allow for recovery */
  if (!strcmp(P_MACCHG,"CHANGED")) {
        if (strlen(P_MACROS) == 0) { /* fmg - they might want to know... */
                werror(_("ERROR: Macros have changed but no filename is set!"));
                return(-1);
        } else {
		if ((fp = sfopen(pfix_home(P_MACROS), "w")) == (FILE *)NULL) {
			werror(_("Cannot write macros file %s"),
				pfix_home(P_MACROS));
                        return(-1);
                }
		writemacs(fp, 0);
		fclose(fp);
		werror(_("Macros saved"));
		strcpy(P_MACCHG,"SAVED"); /* fmg - reset after save */
		return(0);
	}
  }
  return(0);
}
#endif
 
/*
 * Save the configuration, ask a name for it.
 */
static void donamsave()
{
  char ifile[128];
  char *s;

  if (real_uid != 0) {
  	werror(_("You are not allowed to create a configuration"));
	return;
  }

  ifile[0] = 0;
  s = input(_("Give name to save this configuration?"), ifile);
  if (s != (char *)0 && *s != 0) {
  	snprintf(parfile, sizeof(parfile), "%s/minirc.%s", CONFDIR, s);
  dodflsave();
  }
}

static void (*funcs1[])() = {
  dopath,
  doproto,
  doserial,
  domodem,
  doscrkeyb,
  vdodflsave,
  donamsave,
  NIL_FUN,
  NIL_FUN
};

char some_string[32];

static char *menu1[] = {
  N_("Filenames and paths"),
  N_("File transfer protocols"),
  N_("Serial port setup"),
  N_("Modem and dialing"),
  N_("Screen and keyboard"),
  some_string,
  N_("Save setup as.."),
  N_("Exit"),
  N_("Exit from Minicom"),
  MENU_END
};


int config(setup)
int setup;
{
  int c;
  char *s;

  /* Find out extension of parameter file */
  s = parfile + strlen(CONFDIR) + 8;
  snprintf(some_string, sizeof(some_string), _("Save setup as %s"), s);

  if (!setup) menu1[8] = MENU_END;

  c = wselect(13, 10, menu1, funcs1, _("configuration"), stdattr, mfcolor, mbcolor);
  if (c == 9) return(1);
  return(0);
}

/* fmg 1/11/94 Color names for menu */

char *J_col[] =
  { N_("BLACK"), N_("RED"), N_("GREEN"), N_("YELLOW"),
    N_("BLUE"), N_("MAGENTA"), N_("CYAN"), N_("WHITE") };

static char *speeds[] =
   { "300", "1200", "2400", "4800" , 
     "9600", "19200", "38400", "57600", "115200", "230400", "Curr" };

/*
 * Ask user for Baudrate, Bits and Parity
 */
void get_bbp(ba, bi, pa, stopb, curr_ok)
char *ba;
char *bi;
char *pa;
char *stopb;
int curr_ok;
{
  int c;
  WIN *w;
  int x, y;
  int max = m_getmaxspd();

  w = wopen(21, 3, 60, 20, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
  wtitle(w, TMID, _("Comm Parameters"));

  dirflush = 0;

  wlocate(w, 0, 3);
  wputs(w, _("   Speed          Parity          Data\n\n"));
  wputs(w, _(" A: 300           L: None         S: 5\n"));
  wputs(w, _(" B: 1200          M: Even         T: 6\n"));
  wputs(w, _(" C: 2400          N: Odd          U: 7\n"));
  wputs(w, _(" D: 4800          O: Mark         V: 8\n"));
  wputs(w, _(" E: 9600          P: Space\n"));
  if (max > 96)
	wputs(w, _(" F: 19200                      Stopbits\n"));
  else
	wputs(w, "                               Stopbits\n");
  if (max > 192)
	wputs(w, _(" G: 38400                         W: 1\n"));
  else
	wputs(w, _("                                    W: 1\n"));
  if (max > 384)
	wputs(w, _(" H: 57600                         X: 2\n"));
  else
	wputs(w, "                                    X: 2\n");
  if (max > 576)
	wputs(w, _(" I: 115200        Q: 8-N-1\n"));
  else
	wputs(w, _("                  Q: 8-N-1\n"));
  if (max > 1152)
	wputs(w, _(" J: 230400        R: 7-E-1\n"));
  else
	wputs(w, _("                  R: 7-E-1\n"));
  if (curr_ok)
	wputs(w, _(" K: Current\n"));
  else
	wputs(w, "\n");
  wputs(w, _("\n Choice, or <Enter> to exit? "));
  x = w->curx;
  y = w->cury;

  bi[1] = 0;
  pa[1] = 0;

  wredraw(w, 1);

  while(1) {
  	wlocate(w, 1, 1);
  	wprintf(w, _("Current: %5s %s%s%s  "), ba, bi, pa, stopb);
  	wlocate(w, x, y);
  	wflush();
  	c = wxgetch();
  	if (c >= 'a') c -= 32;
  	switch(c) {
  		case 'J':
			if (max < 2304) break;
  		case 'I':
			if (max < 1152) break;
  		case 'H':
			if (max < 576) break;
		case 'G':
			if (max < 384) break;
  		case 'F':
			if (max < 192) break;
  		case 'A':
  		case 'B':
  		case 'C':
  		case 'D':
  		case 'E':
  		case 'K':
			if (c == 'K' && !curr_ok) break;
  			strcpy(ba, speeds[c - 'A']);
  			break;
  		case 'L':
  			pa[0] = 'N';
  			break;
  		case 'M':
  			pa[0] = 'E';
  			break;
  		case 'N':
  			pa[0] = 'O';
  			break;
		case 'O':
			pa[0] = 'M';
			break;
		case 'P':
			pa[0] = 'S';
			break;
  		case 'Q':
  			pa[0] = 'N';
  			bi[0] = '8';
			stopb[0] = '1';
  			break;
  		case 'R':
  			pa[0] = 'E';
  			bi[0] = '7';
			stopb[0] = '1';
  			break;
  		case 'S':
  			bi[0] = '5';
  			break;
  		case 'T':
  			bi[0] = '6';
  			break;
  		case 'U':
  			bi[0] = '7';
  			break;
  		case 'V':
  			bi[0] = '8';
  			break;
  		case 'W':
  			stopb[0] = '1';
			break;
  		case 'X':
  			stopb[0] = '2';
			break;
  		case 27:
  		case '\n':
  		case '\r':
  			dirflush = 1;
  			wclose(w, 1);
  			return;
  		default:
  			break;
  	}
  }
}

#if _HAVE_MACROS
/*
 * fmg - part of the Macros menu, "[none]" beats (null) :-)
 */
static void out_mac(w, s, n)
WIN *w;
char *s;
char n;
{
  wprintf(w, " %c : %.67s\n", n, s ? s : "[none]");
}

/*
 * fmg - Macros editing window
 */
void domacros()
{
  WIN   *w;
  int   clr = 1;
  int   Jch='1', Jm=0; /* fmg - ok, so I was lazy.. */
  char* question = _("Change which setting?  (Esc to exit)");

  w = wopen(3, 6, 75, 21 , BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
  wtitle(w, TMID, _("F1 to F10 Macros"));

  wprintf(w, "\n");
  out_mac(w,mmacs[Jm++].value, Jch++);
  out_mac(w,mmacs[Jm++].value, Jch++);
  out_mac(w,mmacs[Jm++].value, Jch++);
  out_mac(w,mmacs[Jm++].value, Jch++);
  out_mac(w,mmacs[Jm++].value, Jch++);
  out_mac(w,mmacs[Jm++].value, Jch++);
  out_mac(w,mmacs[Jm++].value, Jch++);
  out_mac(w,mmacs[Jm++].value, Jch++);
  out_mac(w,mmacs[Jm++].value, Jch++);
  Jch = 'A'; /* fmg - ran out of single digits... */
  out_mac(w,mmacs[Jm++].value, Jch++);

  wredraw(w, 1);

  while(1) {
        wlocate(w, 1, 14);
        wputs(w, _(" (LEGEND: ^M = C-M, ^L = C-L, ^G = C-G, ^R = C-R, ^~ = pause 1 second,"));
	wlocate(w, 1, 15);
	wputs(w, _("  \\u = username, \\p = password, \\\\ = \\)"));
        if (clr) {
                wlocate(w, 1, 12);
                wprintf(w, "%s ", question);
                wclreol(w);
                clr = 0;
        } else wlocate(w, strlen (question) + 2, 12);

        switch(rwxgetch()) {
                case '\n': wclose(w, 1); return;
                case '1':
                        mgets(w, 5, 1, P_MAC1, 72, MAC_LEN);
                        strcpy(P_MACCHG,_("CHANGED")); /* fmg - ...I'm ashamed */
                        wlocate(w, 0, 1);
                        out_mac(w,P_MAC1, '1');
                        break;
                case '2':
                        mgets(w, 5, 2, P_MAC2, 72, MAC_LEN);
                        //mgets(w, 5, 2, P_MAC2, MAC_LEN, MAC_LEN);
                        strcpy(P_MACCHG,"CHANGED"); /* fmg - ... really, I am */
                        wlocate(w, 0, 2);
                        out_mac(w,P_MAC2, '2');
                        break;
                case '3':
                        mgets(w, 5, 3, P_MAC3, 72, MAC_LEN);
                        strcpy(P_MACCHG,"CHANGED"); /* fmg - ... this is the */
                        wlocate(w, 0, 3);
                        out_mac(w,P_MAC3, '3');
                        break;
                case '4':
                        mgets(w, 5, 4, P_MAC4, 72, MAC_LEN);
                        strcpy(P_MACCHG,"CHANGED"); /* fmg - ... first entry on */
                        wlocate(w, 0, 4);
                        out_mac(w,P_MAC4, '4');
                        break;
                case '5':
                        mgets(w, 5, 5, P_MAC5, 72, MAC_LEN);
                        strcpy(P_MACCHG,"CHANGED"); /* fmg - ... my TODO list. */
                        wlocate(w, 0, 5);
                        out_mac(w,P_MAC5, '5');
                        break;
                case '6':
                        mgets(w, 5, 6, P_MAC6, 72, MAC_LEN);
                        strcpy(P_MACCHG,"CHANGED"); /* fmg - ... and, come to think */
                        wlocate(w, 0, 6);
                        out_mac(w,P_MAC6, '6');
                        break;
                case '7':
                        mgets(w, 5, 7, P_MAC7, 72, MAC_LEN);
                        strcpy(P_MACCHG,"CHANGED"); /* fmg - ... of it, I no longer */
                        wlocate(w, 0, 7);
                        out_mac(w,P_MAC7, '7');
                        break;
                case '8':
                        mgets(w, 5, 8, P_MAC8, 72, MAC_LEN);
                        strcpy(P_MACCHG,"CHANGED"); /* fmg - ... even use this... */
                        wlocate(w, 0, 8);
                        out_mac(w,P_MAC8, '8');
                        break;
                case '9':
                        mgets(w, 5, 9, P_MAC9, 72, MAC_LEN);
                        strcpy(P_MACCHG,"CHANGED"); /* fmg - ... [sigh] */
                        wlocate(w, 0, 9);
                        out_mac(w,P_MAC9, '9');
                        break;
                case 'A':
                        mgets(w, 5, 10, P_MAC10, 72, MAC_LEN);
                        strcpy(P_MACCHG,"CHANGED"); /* fmg - ... [sigh] */
                        wlocate(w, 0, 10);
                        out_mac(w,P_MAC10, 'A');
                        break;
        }
  }
}

/* is this *REALLY* a printable or non-printable character?
 * the isprint() function seems to consider all chars > 127d non-printable..
 * jl 10.03.1998
 */
int prch(int c)
{
  if (c < 32 || c == 127 || c == 155)
    return (' ');
  else
    return (c);
}

/* Edit the character conversion tables. jl 04.09.97 */
void doconv()
{
  WIN *w;
  int i, j, k, l,
    offs=32,
    ymax=22,
    h,
    redraw=1;
  char buf[64];
  char *prompt;

  h = 16;
  w = wopen (1, 1, 77, ymax, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
  wtitle(w, TMID, _("Character conversion"));
  while(1) {
    if (redraw) {
      winclr(w);
      wprintf(w,
	      _(" char    in out    char    in out    char    in out    char    in out\n"));
      for (i=offs,j=i+h,k=j+h,l=k+h ;
	   i<offs+h && i<256 ; i++,j++,k++,l++){
	wprintf(w, "%3d (%c) %3d %3d   ",
		i, prch(i), (int) vt_inmap[i], (int) vt_outmap[i]);
	if (j<256)
	  wprintf(w, "%3d (%c) %3d %3d   ",
		  j, prch(j), (int) vt_inmap[j], (int) vt_outmap[j]);
	else
	  wprintf(w, "                  ");
	if (k<256)
	  wprintf(w, "%3d (%c) %3d %3d   ",
		  k, prch(k), (int) vt_inmap[k], (int) vt_outmap[k]);
	else
	  wprintf(w, "                  ");
	if (l<256)
	  wprintf(w, "%3d (%c) %3d %3d\n",
		  l, prch(l), (int) vt_inmap[l], (int) vt_outmap[l]);
	else
	  wprintf(w, "               \n");
      }
      wprintf(w, _("\n A - load table\tB - save table"));
      if (P_CONVF[0])
	wprintf(w, _("\tfile:%s"),P_CONVF);
      wprintf(w, _("\n C - edit char\tD - next screen\tE - prev screen\n"));
      wprintf(w, _(" F - convert capture: %s\n"), _(P_CONVCAP));
      
      wredraw(w, 1);
      redraw=0;
    }

    wlocate(w, 1, ymax - 1);
    wclreol(w);
    wflush();
    switch (toupper(rwxgetch())) {
    case '\n':
      wclose(w, 1); return;
      break;
    case 'A':
      strcpy(buf,P_CONVF);
      prompt=_("Load file: %s");
      wprintf(w, prompt, buf);
      pgets(w, strlen(prompt) - 1, ymax - 1, P_CONVF, 64, 64);
      if (loadconv(P_CONVF) == 0) {
	if(strcmp(P_CONVF,buf))
	  markch(P_CONVF);
	redraw=1;
      } else
	strcpy(P_CONVF,buf);
      break;
    case 'B':
      strcpy(buf,P_CONVF);
      prompt=_("Save as file: %s");
      wprintf(w, prompt, buf);
      pgets(w, strlen(prompt) - 1, ymax - 1, P_CONVF, 64, 64);
      if (saveconv(P_CONVF) == 0) {
	if(strcmp(P_CONVF,buf))
	  markch(P_CONVF);
	redraw=1;
      } else
	strcpy(P_CONVF,buf);
      break;
    case 'C':
      prompt=_("Character to be edited: ");
      wprintf(w, prompt);
      buf[0]=0; i=-1;
      wlocate(w, strlen(prompt), ymax - 1);
      wgets(w, buf, 4, 4);
      sscanf(buf,"%d",&i);
      if (i>255 || i<0) {
	werror(_("Input character ascii value 0-255"));
	break;
      }

      sprintf(buf,"%u",(unsigned int) vt_inmap[i]);
      wlocate(w, 30, ymax - 1);
      prompt=_("Change input to: %s");
      wprintf(w, prompt,buf);
      wlocate(w, strlen(prompt) + 28, ymax - 1);
      wgets(w, buf, 4, 4);
      sscanf(buf,"%d",&j);
      if (j>255 || j<0) {
        werror(_("Input character ascii value 0-255"));
        break;
      }
      else vt_inmap[i] = j;
      sprintf(buf,"%u",(unsigned int) vt_outmap[i]);
      wlocate(w, 54, ymax - 1);
      prompt=_("Change output to: %s");
      wprintf(w, prompt, buf);
      wlocate(w, strlen(prompt) + 52, ymax - 1);
      wgets(w, buf, 4, 4);
      sscanf(buf,"%d",&j);
      if (j>255 || j<0) {
        werror(_("Input character ascii value 0-255"));
        break;
      }
      else vt_outmap[i] = j;
      redraw=1;
      break;
    case 'D':
      offs += 4 * h;
      if (offs > 255)
	offs = 0;
      redraw=1;
      break;
    case 'E':
      offs -= 4 * h;
      if (offs < 0)
	offs = 0;
      redraw=1;
      break;
    case 'F':
      strcpy(P_CONVCAP, yesno(P_CONVCAP[0] == 'N'));
      markch(P_CONVCAP);
      redraw=1;
      break;
    }
  }
}

int loadconv(char *buf)
{
  FILE *fp;

  if ((fp = sfopen(pfix_home(buf), "rb")) == (FILE *)NULL) {
    werror(_("Cannot open conversion table %s"),pfix_home(buf));
    return 1;
  }
  fread(vt_inmap, sizeof(vt_inmap), (size_t)1, fp);
  fread(vt_outmap, sizeof(vt_outmap), (size_t)1, fp);
  fclose(fp);
  return 0;
}

int saveconv(char *buf)
{
  FILE *fp;

  if ((fp = sfopen(pfix_home(buf), "wb")) == (FILE *)NULL) {
    werror(_("Cannot write conversion table %s"),pfix_home(buf));
    return 1;
  }
  fwrite(vt_inmap, sizeof(vt_inmap), (size_t)1, fp);
  fwrite(vt_outmap, sizeof(vt_outmap), (size_t)1, fp);
  fclose(fp);
  return 0;
}
#endif
