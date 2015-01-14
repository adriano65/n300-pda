@BOTTOM@

/* Defines from old config.h */
#define LOGFILE	"minicom.log"        /* Not defined = not used */
#define CALLOUT	""                   /* Gets run to get into dial out mode */
#define CALLIN	""                   /* Gets run to get into dial in mode */

/* This defines a special mode in the wwxgetch() routine. The
 * basic idea behind this probably works on the consoles of
 * most PC-based unices, but it's only implemented for Linux.
 */
#if defined (__linux__)
#  define KEY_KLUDGE 1
#endif

/* And this for the translation tables (vt100 -> ASCII) */
#if __STDC__
#  define TRANSLATE 1
#  define CONST const
#else
#  define TRANSLATE 0
#  define CONST
#endif

/* Define to 1 if NLS is requested.  */
#undef ENABLE_NLS

/* Define as 1 if you have catgets and don't want to use GNU gettext.  */
#undef HAVE_CATGETS

/* Define as 1 if you have gettext and don't want to use GNU gettext.  */
#undef HAVE_GETTEXT

/* Define if your locale.h file contains LC_MESSAGES.  */
#undef HAVE_LC_MESSAGES

/* Define to 1 if you have the stpcpy function.  */
#undef HAVE_STPCPY

/* Directory where *.mo files live */
#undef LOCALEDIR

/* Directory for configuration files */
#undef CONFDIR

/* Default baud rate */
#undef DEF_BAUD

/* Default /dev/.. modem device */
#undef DFL_PORT

/* History buffer */
#undef HISTORY
#undef _HISTORY

/* History buf searching */
#undef _SEARCH_HISTORY

/* Define if your system supports POSIX termios */
#undef POSIX_TERMIOS 

/* Other */
#undef KERMIT
#undef UUCPLOCK
#undef VC_MUSIC
#undef USE_SOCKET
#undef HAVE_SELECT
#undef _DGUX_SOURCE
#undef _HAVE_MACROS
#undef _HPUX_SOURCE
#undef _RH_FIX
