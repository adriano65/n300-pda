/*
 * windiv.c	Some extra window routines for minicom, that
 *		I did not want to fold into window.c
 *
 *		This file is part of the minicom communications package,
 *		Copyright 1991-1995 Miquel van Smoorenburg.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 * hgk+jl 02.98 File selection window (no longer used this way..)
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID("$Id: windiv.c,v 1.2 2003/04/21 23:56:46 al-guest Exp $")

#include <dirent.h>
#include <sys/stat.h>
#include "port.h"
#include "minicom.h"
#include "intl.h"

#ifndef max
  #define max(a,b)	((a)>(b)?(a):(b))
#endif

#ifndef min
  #define min(a,b)	((a)<(b)?(a):(b))
#endif

/*
 * Popup a window and put a text in it.
 */  
/*VARARGS1*/
WIN *mc_tell(s, a1, a2, a3, a4)
char *s, *a1, *a2, *a3, *a4;
{
  WIN *w;
  char buf[128];

  if (stdwin == NIL_WIN) return(NULL);

  snprintf(buf, sizeof(buf), s, a1, a2, a3, a4);

  w = wopen((COLS / 2) - 2 - strlen(buf) / 2, 8,
	    (COLS / 2) + 2 + strlen(buf) / 2, 10,
  	     BDOUBLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
  wcursor(w, CNONE);	
  wlocate(w, 2, 1);
  wputs(w, buf);
  wredraw(w, 1);
  return(w);
}

/*
 * Show an error message.
 */
/*VARARGS1*/
void werror(s, a1, a2, a3, a4)
char *s, *a1, *a2, *a3, *a4;
{
  WIN *tellwin;
  
  tellwin = mc_tell(s, a1, a2, a3, a4);
  sleep(2);
  wclose(tellwin, 1);
}

/*
 * Vertical "wselect" function.
 */
int ask(what, s)
char *what;
char *s[];
{
  int num = 0;
  int cur = 0, ocur = 0;
  int f, c;
  WIN *w;
  unsigned int size, offs;

  for(f = 0; s[f]; f++) num++;

  size = 5 * num;
  offs = 0;
  if (strlen(what) > 2 * size + 4) {
	size = strlen(what) / 2 + 2;
	offs = size - 5*num;
  }
  w = wopen((COLS / 2) - size , 8, (COLS / 2) + 1 + size, 9,
		BSINGLE, stdattr, mfcolor, mbcolor, 0, 0, 1);
	
  dirflush = 0;

  wcursor(w, CNONE);
  wlocate(w, 1 + size - (strlen(what) / 2), 0);
  wputs(w, what);

  for(f = 1; f < num; f++) {
  	wlocate(w, 2 + offs + 10*f, 1);
  	wputs(w, _(s[f]));
  }
  wredraw(w, 1);

  while(1) {
  	wlocate(w, 2 + offs + 10*cur, 1);
	if (!useattr)
		wprintf(w, ">%s", _(s[cur]) + 1);
	else {
	  	wsetattr(w, XA_REVERSE | stdattr);
  		wputs(w, _(s[cur]));
	}
  	ocur = cur;
  	wflush();
  	switch(c = wxgetch()) {
  		case ' ':
  		case 27:
  		case 3:
  			dirflush = 1;
  			wclose(w, 1);
  			return(-1);
  		case '\r':
  		case '\n':
  			dirflush = 1;
  			wclose(w, 1);
  			return(cur);
  		case K_LT:
  		case 'h':
  			cur--;
  			if (cur < 0) cur = num - 1;
  			break;
  		default:
  			cur = (cur + 1) % num;
  			break;
  	}
  	wlocate(w, 2 + offs + 10*ocur, 1);
  	wsetattr(w, stdattr);
	if (!useattr)
		wputs(w, " ");
	else
  		wputs(w, _(s[ocur]));
  }
}

extern int editline();

/*
 * Popup a window and ask for input.
 */
char *input(s, buf)
char *s;
char *buf;
{
  WIN *w;

  w = wopen((COLS / 2) - 20, 11, (COLS / 2) + 20, 12,
		BDOUBLE, stdattr, mfcolor, mbcolor, 1, 0, 1);
  wputs(w, s);
  wlocate(w, 0, 1);
  wprintf(w, "> %-38.38s", buf);
  wlocate(w, 2, 1);
  if (wgets(w, buf, 38, 128) < 0) buf = CNULL;
  wclose(w, 1);
  return(buf);
}
#if 0 	/* these functions have been replaced */
/*--- File-Select-Extension by H.G.Keller, modified by jl ------------
 *
 * 
 * a bit simpler as Smoorenburg's but considerably more convinient 
 * than the previous case
 *
 */
/* Compare two directory entries. */
static int cmpdir(d1, d2)
struct dirent *d1;
struct dirent *d2;
{
  return(strcmp(d1->d_name, d2->d_name));
}

/* Sort the directory list. */
static void sortdir( base, elements )
void *base;
size_t elements;
{
  qsort (base, elements, sizeof(struct dirent), cmpdir);
}

char *fselect(file_dir)
char *file_dir;
{
  #define ESC	0x1B
  #define CR	0xD
  #define TRUE  (1==1)
  #define FALSE	(1==0)
  char* SELECTION_TITLE = _("Select File(s) to Upload");
  static char fname[2048];
  static char buf[160];
  WIN *w;
  DIR *dir;
  struct dirent *dirent;
  struct dirent *dirlist;
  int *selflag;
  int	nMaxFiles, nCnt;
  int	nNrOfRows, nMaxWidth;
  int	strow, nMaxRows, nOldAttr;
  int   nRunFlag, hlight;
  struct stat statBuf;

  /*
   * generate File-List
   */
  *fname = '\0';
  if ((dir = opendir(file_dir)) == NULL) {
    wbell();
    return(fname); 
  }
  nMaxFiles = 0;
  while(1){  				/* count all the entries */
    dirent = readdir (dir);
    if (dirent)
      nMaxFiles++;
    else
      break;
  }
  closedir(dir);

  /*
   * allocate memory for the list and fill the list
   */
  dirlist = (struct dirent *)malloc( sizeof(struct dirent) * (nMaxFiles+1) );
  selflag = calloc(nMaxFiles+1, sizeof(int));
  if( dirlist ){
    dir = opendir (file_dir);		/* check is not needed again	*/
    nCnt = nMaxWidth = 0;
    while( (dirent = readdir( dir )) ){

      /* skip dir's, special-files, sockets ... */
      if((strcmp(dirent->d_name, ".") == 0 ) 
	 || (strcmp( dirent->d_name, ".." ) == 0))
	continue;
      stat(dirent->d_name, &statBuf);
      if (!S_ISREG(statBuf.st_mode))
	continue;

      /* get regular files */
      dirlist[nCnt].d_ino    = dirent->d_ino;
      dirlist[nCnt].d_off    = dirent->d_off;
      dirlist[nCnt].d_reclen = dirent->d_reclen;
      strcpy(dirlist[nCnt].d_name, dirent->d_name );
      nMaxWidth = max(nMaxWidth, strlen(dirent->d_name));
      nCnt++;
    }
    sortdir( dirlist, nMaxRows=nCnt ); 
    nNrOfRows  = min( 18, nCnt );
    nMaxWidth  = max(min( COLS-4, nMaxWidth ), strlen(SELECTION_TITLE)+5);
    nMaxWidth /= 2; nMaxWidth++;
    
    w = wopen( (COLS / 2)-nMaxWidth,   12-nNrOfRows/2, 
               (COLS / 2)+nMaxWidth-1, 12+nNrOfRows/2-((nNrOfRows+1)&0x1),
		BDOUBLE, stdattr, mfcolor, mbcolor, 1, 0, 1);
    wcursor(w, CNONE);	
    wtitle( w, TMID, SELECTION_TITLE );

    nRunFlag = TRUE;
    hlight = strow = 0;
    buf[0]='\0';
    while( nRunFlag ){
      wlocate(w, 1, 0);
      for( nCnt=0; nCnt < nNrOfRows; nCnt++ ){
        if( strlen(dirlist[nCnt+strow].d_name) ){
          nOldAttr = w->attr;
          if( nCnt == hlight )
	    w->attr = COLATTR(mfcolor, mbcolor);
	  else if(selflag[nCnt+strow])
	    w->attr = COLATTR(mbcolor, mfcolor);
          strncpy(fname,dirlist[nCnt+strow].d_name,
		  2*nMaxWidth-1);
          *(fname+2*nMaxWidth-1) = '\0';
          wputs(w, fname );  wclreol(w);
          wlocate(w, 1, 1+nCnt);
          w->attr = nOldAttr;
        }
        wflush();
      }
      
      switch( wxgetch() ){
        case K_UP:  
        case '+':
        case 'k':
        case 'K':
          if( hlight )
	    hlight--;
          else if( strow )
	    strow--;
	  break;
        case '-':
        case K_DN:
        case 'j':
        case 'J':
          if( hlight < nNrOfRows-1 )
	    hlight++;
          else if( nMaxRows - strow > nNrOfRows )
	    strow++;
	  break;
        case ESC:   
          nRunFlag=FALSE;			
	  break;
        case CR:    
	  nRunFlag = FALSE;
        case ' ':  /* do this also with CR.. */
	  if(strlen(buf) + strlen(dirlist[strow+hlight].d_name) <
	     sizeof(buf) + 2 && selflag[strow+hlight]==0) {
	    strcat(buf, dirlist[strow+hlight].d_name);
	    strcat(buf," ");
	    selflag[strow+hlight] = 1;
	  }
	  if (hlight < nNrOfRows-1)
	    hlight++;
	  break;
      }
    }
    free( dirlist );
    wclose(w, 1);
  }
  else{
    /*
     * Memory-Allocation-Error
     */
  }
  return( (char *)buf);
}
#endif
#if 0
/* Here I mean to work on a file selection window. */
/* Maybe minicom 1.70 - MvS. */

struct file {
  char *name;
  char isdir;
};
static struct filelist **list;
static int nrlist;

/* Compare two directory entries. */
static int cmpdir(d1, d2)
struct file *d1;
struct file *d2;
{
  if (strcmp(d1->name, "..")) return(-1);
  return(strcmp(d1->name, d2->name));
}

/* Sort the directory list. */
static int sortdir()
{
  qsort(list, nrlist, sizeof(struct file *), cmpdir);
}

/* Create file list of directory. */
static int makelist()
{
  DIR *dir;
  struct dirent *d;
  struct file **new;
  int left = 0;
  int f;

  if ((dir = opendir(".")) == NULL) {
	wbell();
	return(-1);
  }

  /* Free the old list if nessecary. */
  if (list) {
	for(f = 0; f < nrlist; f++) free(list[f]);
	free(list);
	list = NULL;
  }

  while(d = readdir(dir)) {

	/* Skip "." entry. */
	if (strcmp(d->d_name, ".") == 0) continue;

	/* Add this to our list. */
	if (left == 0) {
		/* Re-malloc. */
		if ((new = malloc(nrents + 10 * sizeof(void *))) == NULL) {
			closedir(dir);
			return(-1);
		}
		if (list) {
			memcpy(new, list, nrlist * sizeof(struct file **));
			free(list);
		}
		list = new;
		left = 10;
	}

	/* Stat this file. */
#ifdef S_IFLNK
	(void) lstat(d->d_name, &st);
#else
	(void) stat(d->d_name, &st);
#endif
	list[nrlist]->isdir = S_ISDIR(st.st_mode);
	f = 0;
	if (S_ISDIR(st.st_mode)) f = '/';
#ifdef S_ISLNK
	if (S_ISLNK(st.st_mode)) f = '@';
#endif
#ifdef S_ISFIFO
	if (S_ISFIFO(st.st_mode)) f = '|';
#endif
#ifdef S_ISSOCK
	if (S_ISSOCK(st.st_mode)) f = '=';
#endif
	if (S_ISREG(st.st_mode) && (st.st_mode & 0x111)) f = '*';

	/* Fill in name. */
	if ((list[nrlist]->name = malloc(strlen(d->d_name + 2))) == NULL) {
		closedir(dir);
		return(-1);
	}
	sprintf(list[nrlist]->name, "%s%c", d->d_name, f);
	nrlist++;
	left--;
  }
  closedir(dir);
  return(0);
}

/* Select a file. */
char *wfilesel()
{
  WIN *w;
  char cwd[64];

  /* Open one window. */
  w = wopen((COLS / 2) - 20, 5, (COLS / 2) + 20, 20,
		BDOUBLE, stdattr, mfcolor, mbcolor, 1, 0, 1);
  getcwd(cwd, 64);

  while(1) {
	makelist();
	sortdir();


#endif /* DEVEL */
