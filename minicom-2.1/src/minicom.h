/*
 * minicom.h	Constants, defaults, globals etc.
 *
 * 		$Id: minicom.h,v 1.6 2003/04/26 07:31:06 al-guest Exp $
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 * fmg 1/11/94 colors
 * fmg 8/22/97 History Buffer Search support
 * jl  23.06.97 sec parameter to m_dtrtoggle
 * jl  04.09.97 conversion tables
 * jl  09.09.97 loadconv and saveconv protos
 * jl  05.10.97 changed return value of dial() to long
 * jseymour@jimsun.LinxNet.com (Jim Seymour) 03/26/98 - Added prototype
 *    for new "get_port()" function in util.c.
 */

/* First include all other application-dependant include files. */
#include "config.h"
#include "configsym.h"
#include "window.h"
#include "keyboard.h"
#include "vt100.h"
#include "libport.h"

#ifdef USE_SOCKET
#include <sys/socket.h>
#include <sys/un.h>
#endif

#ifdef _HISTORY
#define CR_OPTION1 "History Buffer, "
#else
#define CR_OPTION1 ""
#endif /*HISTORY*/
#ifdef _HAVE_MACROS
#define CR_OPTION2 "F-key Macros, "
#else
#define CR_OPTION2 ""
#endif /*HAVE_MACROS*/
#ifdef _RH_FIX
#define CR_OPTION3 "RedHat fix, "
#else
#define CR_OPTION3 ""
#endif /*RH_FIX*/
#ifdef _SEARCH_HISTORY
#define CR_OPTION4 "Search History Buffer, "
#else
#define CR_OPTION4 ""
#endif /*SEARCH_HISTORY*/
#ifdef ENABLE_NLS
#define CR_OPTION5 "I18n "
#else
#define CR_OPTION5 ""
#endif

/*
 * kubota@debian.or.jp 08/08/98
 * COLS must be equal to or less than MAXCOLS.
 */
#define MAXCOLS 256

#define XA_OK_EXIST	1
#define XA_OK_NOTEXIST	2

#ifndef EXTERN
# define EXTERN extern
#endif

#ifdef _UWIN2P0
EXTERN int LINES;
EXTERN int COLS;
#endif

EXTERN char stdattr;	/* Standard attribute */

EXTERN WIN *us;		/* User screen */
EXTERN WIN *st;		/* Status Line */

EXTERN int real_uid;	/* Real uid */
EXTERN int real_gid;	/* Real gid */
EXTERN int eff_uid;	/* Effective uid */
EXTERN int eff_gid;	/* Effective gid */
EXTERN short terminal;	/* terminal type */
EXTERN time_t online;	/* Time online in minutes */
EXTERN long linespd;	/* Line speed */
EXTERN short portfd;	/* File descriptor of the serial port. */
EXTERN short lines;	/* Nr. of lines on the screen */
EXTERN short cols;	/* Nr. of cols of the screen */
EXTERN int keypadmode;	/* Mode of keypad */
EXTERN int cursormode;	/* Mode of cursor (arrow) keys */

EXTERN int docap;	/* Capture data to capture file */
EXTERN FILE *capfp;	/* File to capture to */
EXTERN int addlf;	/* Add LF after CR */
EXTERN int wrapln;	/* Linewrap default */
EXTERN int tempst;	/* Status line is temporary */
EXTERN int escape;	/* Escape code. */
EXTERN int disable_online_time; /* disable online time display */

EXTERN char lockfile[128]; /* UUCP lock file of terminal */
EXTERN char homedir[256];  /* Home directory of user */
EXTERN char logfname[PARS_VAL_LEN]; /* Name of the logfile */
EXTERN char username[16];  /* Who is using minicom? */

EXTERN int bogus_dcd;	/* This indicates the dcd status if no 'real' dcd */
EXTERN int alt_override;/* -m option */

EXTERN char parfile[256]; /* Global parameter file */
EXTERN char pparfile[256]; /* Personal parameter file */

EXTERN char scr_name[33];   /* Name of last script */
EXTERN char scr_user[33];   /* Login name to use with script */
EXTERN char scr_passwd[33]; /* Password to use with script */

EXTERN char termtype[32];  /* Value of getenv("TERM"); */
EXTERN char *dial_tty;     /* tty to use. */

EXTERN int portuid, portgid; /* Uid and Gid of /dev/ttyS... */
EXTERN char *dial_name;	    /* System we're conneced to */
EXTERN char *dial_number;   /* Number we've dialed. */
EXTERN char *dial_user;     /* Our username there */
EXTERN char *dial_pass;     /* Our password */

#ifdef USE_SOCKET
EXTERN int portfd_is_socket;	/* File descriptor is a unix socket */
EXTERN int portfd_is_connected;	/* 1 if the socket is connected */
EXTERN struct sockaddr_un portfd_sock_addr;	/* the unix socket address */
#define portfd_connected ((portfd_is_socket && !portfd_is_connected) \
                           ? -1 : portfd)
#else
#define portfd_connected portfd
#define portfd_is_socket 0
#define portfd_is_connected 0
#endif /* USE_SOCKET */

/*
 * fmg 8/22/97
 * Search pattern can be THIS long (x characters)
 */
#if _SEARCH_HISTORY
#define MAX_SEARCH      30
#endif /*SEARCH_HISTORY*/

/* fmg 1/11/94 colors */

EXTERN int mfcolor;     /* Menu Foreground Color */
EXTERN int mbcolor;     /* Menu Background Color */
EXTERN int tfcolor;     /* Terminal Foreground Color */
EXTERN int tbcolor;     /* Terminal Background Color */
EXTERN int sfcolor;     /* Status Bar Foreground Color */
EXTERN int sbcolor;     /* Status Bar Background Color */
EXTERN int st_attr;	/* Status Bar attributes. */

/* jl 04.09.97 conversion tables */
EXTERN unsigned char vt_outmap[256], vt_inmap[256];

/* MARK updated 02/17/95 - history buffer */
EXTERN int num_hist_lines;  /* History buffer size */

/* fmg 1/11/94 colors - convert color word to # */

_PROTO(int Jcolor, ( char * ));

EXTERN int size_changed;    /* Window size has changed */
extern char *Version;	    /* Minicom verson */

#ifdef HAVE_SELECT
EXTERN int local_echo;      /* Local echo on/off. */
#endif

/* Forward declaration. */
struct dialent;

/* Global functions */

/*      Prototypes from file: " config.c "      */

_PROTO(void read_parms, ( void ));
_PROTO(int waccess, ( char *s ));
_PROTO(int config, ( int setup ));
_PROTO(void get_bbp, ( char *ba , char *bi , char *pa , char *stopb , int curr_ok ));
_PROTO(char *yesno, ( int k ));
_PROTO(int dotermmenu, ( void ));
_PROTO(int dodflsave, ( void ));	/* fmg - need it */
_PROTO(void vdodflsave, ( void ));	/* fmg - need it */
_PROTO(int domacsave, ( void ));	/* fmg - need it */
_PROTO(int loadconv, ( char *));	/* jl */
_PROTO(int saveconv, ( char *));	/* jl */

/*	Prototypes from file: " common.c "    */
_PROTO(char *pfix_home, ( char *s ));
_PROTO(void do_log, ( char *line, ... ));

/*      Prototypes from file: " dial.c "      */

_PROTO(void mputs, ( char *s , int how ));
_PROTO(void modeminit, ( void ));
_PROTO(void modemreset, ( void ));
_PROTO(void hangup, ( void ));
_PROTO(void sendbreak, ( void ));
_PROTO(long dial, ( struct dialent *d , struct dialent **d2 ));
_PROTO(int readdialdir, ( void ));
_PROTO(void dialone, ( char *entry ));
_PROTO(void dialdir, ( void ));

/*      Prototypes from file: " file.c "      */

_PROTO(char *filedir, (int how_many, int downloading));
_PROTO(void init_dir, (char dir));

/*      Prototypes from file: " util.c "      */

_PROTO(int fastexec, ( char *cmd ));
_PROTO(int fastsystem, ( char *cmd , char *in , char *out , char *err ));
_PROTO(char * get_port, ( char * ));

/*      Prototypes from file: " help.c "      */

_PROTO(int help, ( void ));

/*      Prototypes from file: " ipc.c "      */

_PROTO(int check_io, ( int fd1, int fd2, int tmout, char *buf , int *buflen ));
_PROTO(int keyboard, ( int cmd , int arg ));

/*      Prototypes from file: " keyserv.c "      */

_PROTO(void handler, ( int dummy ));
_PROTO(void sendstr, ( char *s ));
_PROTO(int main, ( int argc , char **argv ));

/*      Prototypes from file: " main.c "      */

_PROTO(void leave, ( char *s ));
_PROTO(char *esc_key, ( void ));
_PROTO(void term_socket_connect, ( void ));
_PROTO(void term_socket_close, ( void ));
_PROTO(int open_term, ( int doinit ));
_PROTO(void init_emul, ( int type , int do_init ));
_PROTO(void timer_update, (void ));
_PROTO(void mode_status, ( void ));
_PROTO(void time_status, ( void ));
_PROTO(void curs_status, ( void ));
_PROTO(void show_status, ( void ));
_PROTO(void scriptname, ( char *s ));
_PROTO(int do_terminal, ( void ));

/*      Prototypes from file: " minicom.c "      */

_PROTO(void port_init, ( ));

/*
 * fmg 8/22/97
 * Prototypes needed...
 */
#if _SEARCH_HISTORY
_PROTO(void drawhist_look, (WIN *w, int y, int r, char *look, int case_matters));
_PROTO(void searchhist, (WIN *w_hist, char *str));
_PROTO(int find_next, (WIN *w, WIN *w_hist, int hit_line, char *look, int case_matters));
_PROTO(const char *upcase, (char *dest, char *src));
_PROTO(char *StrStr, (char *str1, char *str2, int case_matters));
#endif /*SEARCH_HISTORY*/

/*      Prototypes from file: " rwconf.c "      */

_PROTO(int writepars, ( FILE *fp , int all ));
_PROTO(int writemacs, ( FILE *fp , int all )); /* fmg */
_PROTO(int readpars, ( FILE *fp , int init ));
_PROTO(int readmacs, ( FILE *fp , int init )); /* fmg */

#if 0 /* Only if you don't have it already */
_PROTO(char *strtok, ( char *s , char *delim ));
#endif
#ifdef _SVR2
_PROTO(int dup2, ( int from, int to ));
#endif

/*      Prototypes from file: " sysdep1.c "      */

_PROTO(void m_sethwf, ( int fd , int on ));
_PROTO(void m_dtrtoggle, ( int fd , int sec ));
_PROTO(void m_break, ( int fd ));
_PROTO(int m_getdcd, ( int fd ));
_PROTO(void m_setdcd, ( int fd , int what ));
_PROTO(void m_savestate, ( int fd ));
_PROTO(void m_restorestate, ( int fd ));
_PROTO(void m_nohang, ( int fd ));
_PROTO(void m_hupcl, ( int fd, int on ));
_PROTO(void m_flush, ( int fd ));
_PROTO(void m_flush_script, ( int fd ));
_PROTO(int m_getmaxspd, ( void ));
_PROTO(void m_setparms, ( int fd , char *baudr , char *par , char *bits, char *stopb, int hwf, int swf ));
_PROTO(int m_wait, ( int *st ));

/*      Prototypes from file: " sysdep2.c "      */

_PROTO(void getrowcols, ( int *rows , int *cols ));
_PROTO(int setcbreak, ( int mode ));
_PROTO(void enab_sig, ( int onoff , int intrchar ));
_PROTO(void drop_all_privs, ( void ));
_PROTO(void drop_privs, ( void ));
_PROTO(void set_privs, ( void ));
_PROTO(FILE *sfopen, ( char *file, char *mode ));

#if 0 /* Only if you don't have it already */
_PROTO(char *strtok, ( char *s , char *delim ));
#endif
#ifdef _SVR2
_PROTO(int dup2, ( int from, int to ));
#endif

/*      Prototypes from file: " updown.c "      */

_PROTO(void updown, ( int what, int nr ));
_PROTO(int mc_setenv, (char *, char *));
_PROTO(void kermit, ( void ));
_PROTO(void runscript, ( int ask, char *s , char *l , char *p ));

/*      Prototypes from file: " windiv.c "      */

/* Should use stdarg et al. */
WIN *mc_tell();
void werror();
_PROTO(int ask, ( char *what , char *s []));
_PROTO(char *input, ( char *s , char *buf ));

/*      Prototypes from file: " wkeys.c "      */

_PROTO(int wxgetch, ( void ));

/*      Prototypes from file: " config.c "      */

_PROTO(void domacros, ( void ));






/* We want the ANSI offsetof macro to do some dirty stuff. */
#ifndef offsetof
#  define offsetof(type, member) ((int) &((type *)0)->member)
#endif

/* Values for the "flags". */
#define FL_ECHO		0x01	/* Local echo on/off. */
#define FL_DEL		0x02	/* Backspace or DEL */
#define FL_WRAP		0x04	/* Use autowrap. */
#define FL_ANSI		0x08	/* Type of term emulation */
#define FL_TAG		0x80	/* This entry is tagged. */
#define FL_SAVE		0x0f	/* Which portions of flags to save. */

