/*
 * $Id: rcsid.h,v 1.2 2003/04/21 23:56:46 al-guest Exp $
 */
#define PKG_VER " $Package: " PACKAGE " $ $Version: " VERSION " $ "

#if defined(NO_RCSID) || defined(lint)
# define RCSID(x) /* empty */
#else
/* some foo to avoid compiler warnings, we should use
 *   __attribute__((unused)) ... */
# define RCSID(x) static char rcsid[] = x; static char *_rcsid(void) { _rcsid(); return rcsid; }
#endif
