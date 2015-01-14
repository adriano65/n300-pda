/*
 * ipc.c	talk to the keyserv process.
 *
 *		Entry point:
 *
 *		keyserv(command, arg)
 *		command can be KINSTALL, KUNINSTALL, or a command for keyserv.
 *		arg is a 1 byte argument.
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
RCSID("$Id: ipc.c,v 1.6 2003/04/19 16:31:27 al-guest Exp $")

#include <strings.h>

#include "port.h"
#include "minicom.h"
#include "intl.h"

#ifndef HAVE_SELECT

static int tokeyserv, fromkeyserv;	/* File desciptors of ipc pipes */
static int keypid;			/* pid of keyserv  		*/
static jmp_buf ackjmp;			/* To jump to after ACK signal  */
static int waiting = 0;			/* Do we expect an ACK signal?	*/
static int keypress = -1;		/* A key was pressed.		*/

/*
 * We got the "ksigio" signal. This means that CTRL-A was pressed in
 * the main terminal loop, or any key if requested by keyserv(KSIGIO).
 */
/*ARGSUSED*/
static void ksigio(dummy)
int dummy;
{
  unsigned char c[8];
  int n;

  signal(HELLO, ksigio);
  while ((n = read(fromkeyserv, c, 8)) < 0 && errno == EINTR)
  	errno = 0;
  keypress = n ? c[n - 1] : -1;
}

/*
 * After we have sent a signal to "keyserv", we wait for it to signal
 * us back. Otherwise "keyserv" would be swamped with signals and
 * die ungracefully....
 */
static void sigack(dummy)
int dummy;
{
  signal(ACK, sigack);
  if (waiting) longjmp(ackjmp, 1);
  printf(_("sigack: unexpected ACK signal &^%%$!! (pardon my French)%c\n"),
	   '\r');
}

/*
 * Install the keyserv process. This involves setting up the communications
 * channels (pipes) and forking the child process.
 */
static void kinstall()
{
  char mpid[8];
  int pipe1[2], pipe2[2];
  char buf[2];
  char prog[128];

  if (pipe(pipe1) < 0 || pipe(pipe2) < 0)
  	leave(_("minicom: out of file descriptors\n"));
  tokeyserv = pipe1[1];
  fromkeyserv = pipe2[0];

  /* Set signal handler */
  signal(HELLO, ksigio);
  signal(ACK, sigack);

  sprintf(mpid, "%d", (int)getpid());

  switch(keypid = fork()) {
  	case -1:
  		leave(_("minicom: could not fork.\n"));
  		break;
  	case 0: /* Child */

  		/* Set up fd #1 : stdout */
  		dup2(portfd, 1);
  		close(portfd);

		/* Set up fd #3 : minicom ---> keyserv */
		dup2(pipe1[0], 3);

		/* Set up fd #4 : minicom <--- keyserv */
		dup2(pipe2[1], 4);

		/* Close unused file descriptors */
		close(pipe1[1]);
		close(pipe2[0]);
		snprintf(prog, sizeof(prog), "%s/keyserv", CONFDIR);
  		execl(prog, "keyserv", mpid, (char *)NULL);
  		exit(0);
  	default: /* Parent */
		if (setjmp(ackjmp) == 0) {
#ifdef DEBUG
			printf("keyserv has PID %d\r\n", keypid);
#endif
  			sleep(2); /* Wait for keyserv to initialize */
			waiting = 1;
  			buf[0] = KSTOP;
  			write(tokeyserv, buf, 2);
  			if (kill(keypid, HELLO) < 0) {
  				leave(_("minicom: could not exec keyserv\n"));
  			}
			/* Do nothing 'till ACK signal */
			while(1) pause();
		}
		waiting = 0;
		/* close unused pipes */
		close(pipe1[0]);
		close(pipe2[1]);
		break;
  }
}


/*
 * Install / tell /de-install "keyserv" program.
 */
int keyboard(cmd, arg)
int cmd, arg;
{
  char ch[2];
  int pid, stt;
  static int lastcmd = -1;
  int c;

  lastcmd = cmd;

  if (cmd == KINSTALL) {
  	kinstall();
  	return(0);
  }

  if (cmd == KUNINSTALL) {
	close(fromkeyserv);
	close(tokeyserv);
	(void) kill(keypid, SIGKILL);
	pid = m_wait(&stt);
	keypid = 0;
	return(0);
  }

  if (cmd == KGETKEY) {
	if (keypress >= 0)
		/* Return the command key from keyserv. */
		c = keypress;
	else {
		/* Just read it. */
		read(0, ch, 1);
		c = ch[0];
	}
	keypress = -1;
	return(c);
  }

  if (cmd == KSETESC) {
	/* Store this because the code expects it. */
	escape = arg;
  }

  /* Do nothing if keyserv doesn't run yet. */
  if (keypid == 0) return(0);

  if (setjmp(ackjmp) == 0) {
	waiting = 1;
	ch[0] = cmd;
	ch[1] = arg;
	write(tokeyserv, ch, 2);
	(void) kill(keypid, HELLO);
	/* Do nothing 'till ACK signal */
	while(1) pause();
  }
  waiting = 0;
  return(0);
}

/* Dummy function, e.g. sigalarm handler. */
void empty_function()
{
}

/* Wait for I/O to happen. We might get interrupted by keyserv.
 *
 * Socket-mode: If reading fd1 fails and fd1 is our portfd and it's the
 *              socket, the socket is closed.
 */

int check_io(fd1, fd2, tmout, buf, buflen)
int fd1;
int fd2;
int tmout;
char *buf;
int *buflen;
{
  int n;
  int x = 0;

  /* OK, set the alarm if needed. */
  signal(SIGALRM, empty_function);
  if (tmout) alarm((tmout + 500) / 1000);

  /* We do a read on the first fd, the second one is always stdin. */
  if (keypress < 0) {
	if (fd1 >= 0) {
		/* Read gets interrupted by keypress or alarm. */
		n = read(fd1, buf, 127);
#ifdef USE_SOCKET
		if (!n && portfd_is_socket && portfd == fd1)
			term_socket_close();
#endif /* USE_SOCKET */
		buf[n > 0 ? n : 0] = 0;
		if (buflen) *buflen = n;
		if (n > 0) x |= 1;
	} else
		/* Wait for keypress or alarm. */
		pause();
  }
  alarm(0);

  if (keypress >= 0) x |= 2;

  return(x);
}

#else /* HAVE_SELECT */

/* Check if there is IO pending. */
int check_io(fd1, fd2, tmout, buf, buflen)
int fd1;
int fd2;
int tmout;
char *buf;
int *buflen;
{
  int n = 0, i;
  struct timeval tv;
  fd_set fds;
  extern int io_pending; /* wkeys.c */

  tv.tv_sec = tmout / 1000;
  tv.tv_usec = (tmout % 1000) * 1000L;

  i = fd1;
  if (fd2 > fd1) i = fd2;

  FD_ZERO(&fds);
  if (fd1 >= 0) FD_SET(fd1, &fds); else fd1 = 0;
  if (fd2 >= 0) FD_SET(fd2, &fds); else fd2 = 0;

  if (fd2 == 0 && io_pending)
	n = 2;
  else if (select(i+1, &fds, NULL, NULL, &tv) > 0)
	n = 1 * (FD_ISSET(fd1, &fds) > 0) + 2 * (FD_ISSET(fd2, &fds) > 0);

  /* If there is data put it in the buffer. */
  if (buf) {
	i = 0;
	if ((n & 1) == 1) {
		i = read(fd1, buf, 127);
#ifdef USE_SOCKET
		if (!i && portfd_is_socket && portfd == fd1)
			term_socket_close();
#endif /* USE_SOCKET */
	}
	buf[i > 0 ? i : 0] = 0;
	if (buflen) *buflen = i;
  }

  return(n);
}

int keyboard(cmd, arg)
int cmd, arg;
{
  switch(cmd) {	
	case KSTART:
	case KSTOP:
		break;
	case KSIGIO:
		break;
	case KGETKEY:
		return(wxgetch());
	case KSETESC:
		escape = arg;
		break;
	case KSETBS:
		vt_set(-1, -1, NULL, -1, arg, -1, -1, -1);
		break;
	case KCURST:
		vt_set(-1, -1, NULL, -1, -1, -1, NORMAL, -1);
		break;
	case KCURAPP:
		vt_set(-1, -1, NULL, -1, -1, -1, APPL, -1);
		break;
	default:
		/* The rest is only meaningful if a keyserv runs. */
		break;
  }
  return(0);
}

#endif /* HAVE_SELECT */
