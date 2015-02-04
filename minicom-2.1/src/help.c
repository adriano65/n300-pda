/*
 * help		Print a help window.
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 *  26.02.1998 - acme@conectiva.com.br - i18n
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID("$Id: help.c,v 1.1.1.1 2003/03/30 18:55:51 al-guest Exp $")

#include "port.h"
#include "minicom.h"
#include "intl.h"

/* Draw a help screen and return the keypress code. */
int help()
{
  WIN *w;
  int c;
  int i;
  int x1, x2;

#if HISTORY
  i = 1;
#else
  i = 0;
#endif
  x1 = (COLS / 2) - 34;
  x2 = (COLS / 2) + 32;
  w = wopen(x1, 2, x2, 20 + i, BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
  
  wlocate(w, 21, 0);
  wputs(w, _("Minicom Command Summary"));
  wlocate(w, 10, 2);

  wprintf(w, _("Commands can be called by %s<key>"), esc_key());

  wlocate(w, 15, 4);
  wputs(w, _("Main Functions"));
  wlocate(w, 47, 4);
  wputs(w, _("Other Functions"));
  wlocate(w, 0, 6);
  wputs(w, _(" Dialing directory..D  run script (Go)....G | Clear Screen.......C\n"));
  wputs(w, _(" Send files.........S  Receive files......R | cOnfigure Minicom..O\n"));
  wputs(w, _(" comm Parameters....P  Add linefeed.......A | "));
#ifdef SIGTSTP
  wputs(w, _("Suspend minicom....J\n"));
#else
  wputs(w, _("Jump to a shell....J\n"));
#endif
  wputs(w, _(" Capture on/off.....L  Hangup.............H | eXit and reset.....X\n"));
  wputs(w, _(" send break.........F  initialize Modem...M | Quit with no reset.Q\n"));
  wputs(w, _(" Terminal settings..T  run Kermit.........K | Cursor key mode....I\n"));
  wputs(w, _(" lineWrap on/off....W"));
#ifdef HAVE_SELECT
  wputs(w, _("  local Echo on/off..E | Help screen........Z"));
#else
  wputs(w, _("                       | Help screen........Z"));
#endif
#if HISTORY
  wlocate(w, 44, 13);
  wputs(w, _("| scroll Back........B"));
#endif

  wlocate(w, 13, 16 + i);
  wputs(w, _("Written by Miquel van Smoorenburg 1991-1995"));
  wlocate(w, 13, 17 + i);
  wputs(w, _("Some additions by Jukka Lahtinen 1997-2000"));
  wlocate(w, 13, 18 + i);
  wputs(w, _("i18n by Arnaldo Carvalho de Melo 1998"));
  wlocate(w, 6, 14 + i);
  wputs(w, _("Select function or press Enter for none."));
  wredraw(w, 1);

  c = wxgetch();
  wclose(w, 1);
  return(c);
}
