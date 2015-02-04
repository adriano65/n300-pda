/*
 * rwconf.c	Routines to deal with ASCII configuration files.
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1996 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 *	When adding options, remember to add them here in the mpars structure
 *	AND to the macro definitions in configsym.h.
 *
 * // fmg 12/20/93 - kludged in color "support" (hey, it works)
 * // fmg 2/15/94 - added 9 x MAC_LEN char macros for F1 to F10 which can be
 *                  save to a specified file so that old defaults file
 *                  works with these patches. TODO: make these alloc
 *                  memory dynamically... it's nice to have a 15K macro
 *                  _WHEN_ it's being (not like now with -DMAC_LEN) :-)
 * // jl  23.06.97 - changed mdropdtr to numeric
 * // jl  04.09.97 - conversion table filename added to mpars table
 * // jl  22.02.98 - file selection window setting added to mpars table
 * // acme 26.02.98 - i18n
 * // acme 18.03.98 - more i18n
 * // jl  05.04.98 - added the multifile parameter for transfer protocols
 *    jl  06.07.98 - added option P_CONVCAP
 *    jl  28.11.98 - added P_SHOWSPD
 *    jl  05.04.99 - logging options
 *    er  18-Apr-99 - added P_MULTILINE for "multiline"
 *    jl  10.02.2000 - added P_STOPB
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID("$Id: rwconf.c,v 1.3 2003/03/31 08:40:09 godisch Exp $")

#include "port.h"
#include "minicom.h"
#include "intl.h"

#define ADM_CHANGE	1
#define USR_CHANGE	2

#if _HAVE_MACROS
/* fmg macros stuff */
#define MAX_MACS        10       /* fmg - header files? what's that... */
struct macs mmacs[] = {
  { "",       PUBLIC,   "pmac1" },
  { "",       PUBLIC,   "pmac2" },
  { "",       PUBLIC,   "pmac3" },
  { "",       PUBLIC,   "pmac4" },
  { "",       PUBLIC,   "pmac5" },
  { "",       PUBLIC,   "pmac6" },
  { "",       PUBLIC,   "pmac7" },
  { "",       PUBLIC,   "pmac8" },
  { "",       PUBLIC,   "pmac9" },
  { "",       PUBLIC,   "pmac10" },

  /* That's all folks */

  { "",                 0,         (char *)NULL },
};
#endif

struct pars mpars[] = {
  /* Protocols */
  /* Warning: minicom assumes the first 12 entries are these proto's ! */
  { "YUNYYzmodem",	PUBLIC,   "pname1" },
  { "YUNYYymodem",	PUBLIC,   "pname2" },
  { "YUNYNxmodem",	PUBLIC,   "pname3" },
  { "NDNYYzmodem",	PUBLIC,   "pname4" },
  { "NDNYYymodem",	PUBLIC,   "pname5" },
  { "YDNYNxmodem",	PUBLIC,   "pname6" },
  { "YUYNNkermit",	PUBLIC,   "pname7" },
  { "NDYNNkermit",	PUBLIC,   "pname8" },
  { "YUNYNascii",	PUBLIC,   "pname9" },
  { "",			PUBLIC,   "pname10" },
  { "",			PUBLIC,   "pname11" },
  { "",			PUBLIC,   "pname12" },
#if defined(__linux__) || defined(__GNU__)
  { "/usr/bin/sz -vv -b",	PUBLIC,   "pprog1" },
  { "/usr/bin/sb -vv",		PUBLIC,   "pprog2" },
  { "/usr/bin/sx -vv",		PUBLIC,   "pprog3" },
  { "/usr/bin/rz -vv -b -E",	PUBLIC,   "pprog4" },
  { "/usr/bin/rb -vv",		PUBLIC,   "pprog5" },
  { "/usr/bin/rx -vv",		PUBLIC,   "pprog6" },
  { "/usr/bin/kermit -i -l %l -s", PUBLIC, "pprog7" },
  { "/usr/bin/kermit -i -l %l -r", PUBLIC, "pprog8" },
#else
  /* Most sites have this in /usr/local, except Linux. */
  { "/usr/local/bin/sz -vv",	PUBLIC,   "pprog1" },
  { "/usr/local/bin/sb -vv",	PUBLIC,   "pprog2" },
  { "/usr/local/bin/sx -vv",	PUBLIC,   "pprog3" },
  { "/usr/local/bin/rz -vv",	PUBLIC,   "pprog4" },
  { "/usr/local/bin/rb -vv",	PUBLIC,   "pprog5" },
  { "/usr/local/bin/rx -vv",	PUBLIC,   "pprog6" },
  { "/usr/local/bin/kermit -i -l %l -s", PUBLIC, "pprog7" },
  { "/usr/local/bin/kermit -i -l %l -r", PUBLIC, "pprog8" },
#endif
  { "/usr/bin/ascii-xfr -dsv", PUBLIC,   "pprog9" },
  { "",			PUBLIC,   "pprog10" },
  { "",			PUBLIC,   "pprog11" },
  { "",			PUBLIC,   "pprog12" },
  /* Serial port & friends */
  { DFL_PORT,		PRIVATE,  "port" },
  { CALLIN,		PRIVATE,  "callin" },
  { CALLOUT,		PRIVATE,  "callout" },
  { UUCPLOCK,		PRIVATE,  "lock" },
  { DEF_BAUD,		PUBLIC,   "baudrate" },
  { "8",		PUBLIC,   "bits" },
  { "N",		PUBLIC,   "parity" },
  { "1",		PUBLIC,   "stopbits" },
  /* Kermit the frog */
  { KERMIT,		PRIVATE,  "kermit" },
  { N_("Yes"),		PRIVATE,  "kermallow" },
  { N_("No"),		PRIVATE,  "kermreal" },
  { "3",		PUBLIC,   "colusage" },
  /* The script program */
  { "runscript",	PUBLIC,   "scriptprog" },
  /* Modem parameters */
  { "~^M~AT S7=45 S0=0 L1 V1 X4 &c1 E1 Q0^M",   PUBLIC,   "minit" },
  { "^M~ATZ^M~",	PUBLIC,   "mreset" },
  { "ATDT",		PUBLIC,   "mdialpre" },
  { "^M",		PUBLIC,   "mdialsuf" },
  { "ATDP",		PUBLIC,   "mdialpre2" },
  { "^M",		PUBLIC,   "mdialsuf2" },
  { "ATX1DT",		PUBLIC,   "mdialpre3" },
  { ";X4D^M",		PUBLIC,   "mdialsuf3" },
  { "CONNECT",		PUBLIC,   "mconnect" },
  { "NO CARRIER",	PUBLIC,   "mnocon1" },
  { "BUSY",		PUBLIC,   "mnocon2" },
  { "NO DIALTONE",	PUBLIC,   "mnocon3" },
  { "VOICE",		PUBLIC,   "mnocon4" },
  { "~~+++~~ATH^M",	PUBLIC,   "mhangup" },
  { "^M",		PUBLIC,   "mdialcan" },
  { "45",		PUBLIC,   "mdialtime" },
  { "2",		PUBLIC,   "mrdelay" },
  { "10",		PUBLIC,   "mretries" },
  { "1",		PUBLIC,   "mdropdtr" },   /* jl 23.06.97 */
  { "No",		PUBLIC,   "mautobaud" },
  { "d",		PUBLIC,   "showspeed" },  /* d=DTE, l=line speed */
  { "",			PUBLIC,   "updir" },
  { "",			PUBLIC,   "downdir" },
  { "",			PUBLIC,   "scriptdir" },
  { "^A",		PUBLIC,   "escape-key" },
  { "BS",		PUBLIC,   "backspace" },
  { N_("enabled"),	PUBLIC,   "statusline" },
  { N_("Yes"),		PUBLIC,   "hasdcd" },
  { N_("Yes"),		PUBLIC,   "rtscts" },
  { N_("No"),		PUBLIC,   "xonxoff" },
  { "D",		PUBLIC,   "zauto" },

  /* fmg 1/11/94 colors */
  /* MARK updated 02/17/95 to be more like TELIX. After all its configurable */

  { "YELLOW",           PUBLIC,   "mfcolor" },
  { "BLUE",             PUBLIC,   "mbcolor" },
  { "WHITE",            PUBLIC,   "tfcolor" },
  { "BLACK",            PUBLIC,   "tbcolor" },
  { "WHITE",            PUBLIC,   "sfcolor" },
  { "RED",              PUBLIC,   "sbcolor" },

  /* fmg 2/20/94 macros */

  { ".macros",          PUBLIC,   "macros" },
  { "",                 PUBLIC,   "changed" },
  { "Yes",		PUBLIC,   "macenab" },

  /* Continue here with new stuff. */
  { "Yes",		PUBLIC,   "sound"  },
  /* MARK updated 02/17/95 - History buffer size */
  { "2000",             PUBLIC,   "histlines" },

  /* Character conversion table - jl / 04.09.97 */
  { "",                	PUBLIC,    "convf" },
  { "Yes",		PUBLIC,	   "convcap" },
  /* Do you want to use the filename selection window? */
  { "Yes",		PUBLIC,	   "fselw" },
  /* Do you want to be prompted for the download directory? */
  { "No",		PUBLIC,    "askdndir" },

  /* Logfile options - jl 05.04.99 */
#ifdef LOGFILE
  { LOGFILE,		PUBLIC,    "logfname" },
#else
  { "/dev/null",       	PUBLIC,    "logfname" },
#endif
  { "Yes",		PUBLIC,    "logconn" },
  { "Yes",		PUBLIC,    "logxfer" },

  { "No", 		PUBLIC,    "multiline"},

  /* That's all folks */
  { "",                 0,         (char *)NULL },
};
 
#if _HAVE_MACROS
/*
 * fmg - Write the macros to a file.
 */
int writemacs(fp, all)
FILE *fp;
int all;
{
  struct macs *m;

  for(m = mmacs; m->desc; m++)
        if ((all && (m->flags & ADM_CHANGE))
        || ((m->flags & PUBLIC) && (m->flags & USR_CHANGE)))
                fprintf(fp, "%s %-16.16s %s\n", m->flags &
                        PUBLIC ? "pu" : "pr", m->desc, m->value);
  return(0);
}
#endif

/*
 * Write the parameters to a file.
 */
int writepars(fp, all)
FILE *fp;
int all;
{
  struct pars *p;

  if (all)
	fprintf(fp, _("# Machine-generated file - use \"minicom -s\" to change parameters.\n"));
  else
	fprintf(fp, _("# Machine-generated file - use setup menu in minicom to change parameters.\n"));

  for(p = mpars; p->desc; p++)
  	if ((all && (p->flags & ADM_CHANGE)) ||
  	   ((p->flags & PUBLIC) && (p->flags & USR_CHANGE)))
  		fprintf(fp, "%s %-16.16s %s\n",
  			p->flags & PUBLIC ? "pu" : "pr", p->desc, p->value);
  return(0);
}

/*
 * Read the parameters from a file.
 */
int readpars(fp, init)
FILE *fp;
int init;
{
  struct pars *p;
  char line[80];
  char *s;
  int public;
  int dosleep = 0;
  int lineno = 0;
  int matched;

  if (init) strcpy(P_SCRIPTPROG, "runscript");

  while(fgets(line, 80, fp) != (char *)0) {

	lineno++;

  	s = strtok(line, "\n\t ");
	if (s == NULL) continue;
	if (*s == '#') continue;

  	/* Here we have pr for private and pu for public */
  	public = -1;
  	if (strcmp(s, "pr") == 0) {
  		public = 0;
  		s = strtok((char *)NULL, "\n\t ");
  	}
  	if (strcmp(line, "pu") == 0) {
  		public = 1;
  		s = strtok((char *)NULL, "\n\t ");
  	}
	if (s == NULL || public < 0) {
		fprintf(stderr,
			_("** Line %d of the %s config file not understood\n"),
		        lineno, init ? _("global") : _("personal"));
		dosleep = 1;
		continue;
	}

  	/* Don't read private entries if prohibited */
  	if (!init && public == 0) continue;

	matched = 0;
  	for(p = mpars; p->desc != (char *)0; p++) {
  		if (strcmp(p->desc, s) == 0) {
		  	matched = 1;

			/* See if this makes sense. */
			if (((p->flags & PRIVATE) && public) ||
			    ((p->flags & PUBLIC)  && !public)) {
				fprintf(stderr,
			_("** Parameter %s is %s, but is marked %s in %s config file\n"),
					s,
					(p->flags & PRIVATE) ? _("private") : _("public"),
					public ? _("public") : _("private"),
					init ? _("global") : _("personal"));
				dosleep = 1;
			}
			/* See if user is allowed to change this flag. */
			if ((p->flags & PRIVATE) && public == 1) {
				fprintf(stderr,
		       _("== Attempt to change private parameter %s - denied.\n"),
					p->desc);
				dosleep = 1;
				continue;
			}

  			/* Set value */
  			if ((s = strtok((char *)NULL, "\n")) == (char *)0)
  				s = "";
  			while(*s && (*s == '\t' || *s == ' ')) s++;

			/* We must be prepared for config files saved before
			   the P_MUL parameter was added. So, we make room
			   for P_MUL if necessary - jl 5.4.98 */
			if (!strncmp(p->desc,"pname",(size_t) 5)) {
			  if (s[4] != 'N' && s[4] != 'Y') {
#ifdef _SYSV
			    memcpy (s+5, s+4, strlen(s+4));
#else
#ifdef _BSD43
			    bcopy (s+4, s+5, strlen(s+4));
#else
			    memmove (s+5, s+4, strlen(s+4));
#endif /* _BSD43 */
#endif /* _SYSV */
			    *(s+4)='N';
			  }
			}

  			/* If the same as default, don't mark as changed */
  			if (strcmp(p->value, s) == 0) {
  				p->flags &= ~CHANGED;
  			} else {
				if (init)
					p->flags |= ADM_CHANGE;
				else
					p->flags |= USR_CHANGE;
  				strcpy(p->value, s);
  			}
#if 0 /* Ehm. This makes no sense, Mike. */
  			/* Set flags */
  			p->flags |= (public ? PUBLIC : PRIVATE);
  			p->flags &= ~(public ? PRIVATE : PUBLIC);
#endif
  			break;
  		}
  	}
	if (! matched) {
		fprintf (stderr,
			 _("** Line %d of the %s config file is unparsable.\n"),
		         lineno, init ? _("global") : _("personal"));
		dosleep = 1;
  	}
  }
  /* To get over a bug in minicom 1.60 :( */
  if (strcmp(P_BAUDRATE, "Curr") == 0) strcpy(P_BAUDRATE, "38400");

  if (dosleep) sleep(3);

  return(0);
}

#if _HAVE_MACROS
/*
 * fmg - Read the macros from a file.
 */
int readmacs(fp, init)
FILE *fp;
int init;
{
  struct        macs *m;
  char          line[MAC_LEN];
  int           public, max_macs=MAX_MACS+1000;
  char          *s;

  while(fgets(line, MAC_LEN, fp) != (char *)0 && max_macs--) {
        s = strtok(line, "\n\t ");
        /* Here we have pr for private and pu for public */
        public = 0;
        if (strcmp(s, "pr") == 0) {
                public = 0;
                s = strtok((char *)NULL, "\n\t ");
        }
        if (strcmp(line, "pu") == 0) {
                public = 1;
                s = strtok((char *)NULL, "\n\t ");
        }
        if (strcmp(line, "#") == 0) {
		continue;
        }
        /* Don't read private entries if prohibited */
        if (!init && public == 0) continue;

        for(m = mmacs; m->desc != (char *)0; m++) {
                if (strcmp(m->desc, s) == 0) {
                                ;
                        /* Set value */
                        if ((s = strtok((char *)NULL, "\n")) == (char *)0)
                                s = "";
                        while(*s && (*s == '\t' || *s == ' ')) s++;

                        /* If the same as default, don't mark as changed */
                        if (strcmp(m->value, s) == 0) {
                                m->flags = 0;
                        } else {
                                if (init)
                                        m->flags |= ADM_CHANGE;
                                else
                                        m->flags |= USR_CHANGE;
                                strcpy(m->value, s);
                        }
#if 0
                        /* Set flags */
                        m->flags |= (public ? PUBLIC : PRIVATE);
#endif
                        break;
                }
        }
  }
  return(0);
}
#endif
