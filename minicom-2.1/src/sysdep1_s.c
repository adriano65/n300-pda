/*
 * sysdep1_s.c	system dependant routines.
 * 		sysdep1.c has a dependeny to function not needed
 * 		for runscript so put m_flush (the only needed sysdep
 * 		function by runscript) into a separate object.
 *
 *		m_flush		- flush
 *
 *		If it's possible, Posix termios are preferred.
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
RCSID("$Id: sysdep1_s.c,v 1.1 2003/04/01 23:59:51 al-guest Exp $")

#include "sysdep.h"
#include "minicom.h"

#ifdef USE_SOCKET
int portfd_is_socket;
int portfd_is_connected;
struct sockaddr_un portfd_sock_addr;
#endif

/*
 * Flush the buffers
 */
void m_flush(fd)
int fd;
{
#ifdef USE_SOCKET
  if (portfd_is_socket)
    return;
#endif
/* Should I Posixify this, or not? */
#ifdef TCFLSH
  ioctl(fd, TCFLSH, 2);
#endif
#ifdef TIOCFLUSH
  {
    int out = 0;
    ioctl(fd, TIOCFLUSH, &out);
  }
#endif
}

