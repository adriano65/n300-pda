/*
 * getsdir.c
 *
 *	Get and return a sorted directory listing
 *
 *	Copyright (c) 1998 by James S. Seymour (jseymour@jimsun.LinxNet.com)
 *
 *	This code is free software; you can redistribute it and/or
 *	modify it under the terms of the GNU General Public License
 *	as published by the Free Software Foundation; either version
 *	2 of the License, or (at your option) any later version.
 *
 *	Note: this code uses "wildmat.c", which has different copyright
 *	and licensing conditions.  See the source, Luke.
 */
#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "rcsid.h"
RCSID("$Id: getsdir.c,v 1.1.1.1 2003/03/30 18:55:51 al-guest Exp $")

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>

#include "port.h"	/* from minicom: for needed for _PROTO macro only */
#include "getsdir.h"
#include "intl.h"

_PROTO(extern int wildmat, (char *, char *));	/* pattern matcher */


/* locally defined constants */
 
#define MAX_CNT 100		/* number of entries to hold in holding buf */

typedef struct dat_buf {		/* structure of input buffers */
    struct dat_buf *nxt;		/* pointer to next buffer */
    unsigned cnt;			/* data count in present buffer */
    GETSDIR_ENTRY data[MAX_CNT];	/* data in present buffer */
} DAT_BUF;

static DAT_BUF *datb_frst;		/* pointer to first data buffer */
static DAT_BUF *datb_cur;		/* pointer to current data buffer */
static int g_sortflags;			/* sort flags */

/* sort compare routines */
_PROTO(static int namecmpr, (GETSDIR_ENTRY *d1, GETSDIR_ENTRY *d2));
_PROTO(static int timecmpr, (GETSDIR_ENTRY *d1, GETSDIR_ENTRY *d2));

_PROTO(static void free_up, (void));		/* free-up used memory */

/*
 * name:	getsdir
 *
 * purpose:	To return a directory listing - possibly sorted
 *
 * synopsis:	#include <dirent.h>
 *
 *		int getsdir(dirpath, pattern, sortflags, modemask, datptr, len)
 *		char *dirpath;
 *		char *pattern;
 *		int sortflags;
 *		mode_t modemask;
 *		GETSDIR_ENTRY **datptr;
 *		int *len;
 *
 * input:	 *dirpath - pointer to path to directory to get list of
 *			    files from
 *		 *pattern - pointer to optional wildmat pattern
 *		sortflags - specification flags of how to sort the
 *			    resulting list.  See descriptions below.
 *		 modemask - caller-supplied mode mask.  Bits in this will
 *			    be ANDed against directory entries to determine
 *			    whether to return them.  Ignored if 0.
 *		 **datptr - pointer to a destination pointer variable.
 *			    getsdir will allocate the required amount
 *			    of memory for the results and will return a
 *			    pointer to the returned data in this variable.
 *
 *			    The data will be in the form:
 *				typedef struct dirEntry {
 *				    char fname[MAXNAMLEN + 1];
 *				    time_t time;
 *				    mode_t mode;
 *				} GETSDIR_ENTRY;
 *		     *len - pointer to int to contain length of longest
 *			    string in returned array.
 *
 * process:	For each 0..MAX_CNT values read from specified directory,
 *		allocates a temporary buffer to store the entries into.
 *		When end of directory is detected, merges the buffers into
 *		a single array of data and sorts into order based on key.
 *
 * output:	Count of number of data items pointed to by datptr or
 *		-1 if error.  errno may or may not be valid, based on
 *		type of error encountered.
 *
 * notes:	If there is any error, -1 is returned.
 *
 *		It is the caller's responsibility to free the memory
 *		block pointed to by datptr on return when done with the
 *		data, except in case of error return.
 *
 *		See also: opendir(3C), readdir(3C), closedir(3C), qsort(3C)
 *
 *		The pattern parameter is optional and may be 0-length or
 *		a NULL pointer.
 *
 *		The sort flags affect the output as follows:
 *
 *		    GETSDIR_PARNT - include parent dir (..)
 *		    GETSDIR_NSORT - sort by name
 *		    GETSDIR_TSORT - sort by time (NSORT wins if both)
 *
 *		    The following are only meaningful if GETSDIR_NSORT or
 *		    GETSDIR_TSORT are specified:
 *
 *			GETSDIR_DIRSF - dirs first
 *			GETSDIR_DIRSL - dirs last
 *			GETSDIR_RSORT - reverse sort (does not affect
 *					GETSDIR_DIRSF/GETSDIR_DIRSL)
 *
 *		So-called "hidden" files (those beginning with a ".") are
 *		not returned unless a pattern like ".*" is specified.
 *
 *		The present directory (".") is never returned.
 */

int
getsdir(dirpath, pattern, sortflags, modemask, datptr, len)
char *dirpath;
char *pattern;
int sortflags;
mode_t modemask;
GETSDIR_ENTRY **datptr;
int *len;
{
    unsigned cnt;		/* data count */

    DIR *dirp;			/* point to open dir */
    struct dirent *dp;		/* structure of dir as per system */
    struct stat statbuf;	/* structure of file stat as per system */
    char fpath[BUFSIZ];		/* filename with dir path prepended */
    int indx;			/* g-p array indexer */
    int cmprstat;
    DAT_BUF *datb_sav;		/* pointer to previous data buffer */

    g_sortflags = sortflags;		/* for sort funcs */
    *len = 0;				/* longest name */
    datb_frst = (DAT_BUF *) NULL;	/* init pointers to first data buff */
    datb_cur  = (DAT_BUF *) NULL;

    /* open the specified directory */
    if ((dirp = opendir(dirpath)) == NULL)	
        return(-1);

    /* discard current, and possibly parent, dir entries */
    if(readdir(dirp) == NULL || 
	(!(sortflags & GETSDIR_PARNT) && readdir(dirp) == NULL))
    {
	fprintf(stderr, _("DBUG: initial readdir() failed (errno == %d)\n"),
	    errno);
	perror("readdir");
	fflush(stderr);
    }

    for(cnt = 1;; ++cnt)	/* for buffer count 1 to whatever... */
    {
	datb_sav = datb_cur;	/* save pointer to previous buffer */

	/* get a new buffer */
        if((datb_cur = (DAT_BUF*)calloc(1,sizeof(DAT_BUF))) == (DAT_BUF*)NULL)
	{
	    closedir(dirp);
            return(-1);
	}

	/* init new buffer link pointer */
	datb_cur->nxt = (DAT_BUF *) NULL;

	if(datb_frst == (DAT_BUF *) NULL)	/* if first buff... */
            datb_frst = datb_cur;		/* ...init first buff pointer */
	else					/* else... */
	    datb_sav->nxt = datb_cur;		/* ...link to new */

	/* while the current buffer is not full, get directory entries */
        for(datb_cur->cnt = 0; datb_cur->cnt < MAX_CNT; )
            if((dp = readdir(dirp)) != NULL)	/* get next directory entry */
	    {
		if((sortflags & GETSDIR_PARNT) &&
		   strcmp(dp->d_name, "..") == 0)
		{
		    cmprstat = 1;
		}
		else if(pattern && strlen(pattern))
		    cmprstat = wildmat(dp->d_name, pattern);
		else
		    cmprstat = 1;

		if(cmprstat)	/* matching name? */
		{
		    int l;

		    /* copy the filename */
		    strncpy(datb_cur->data[datb_cur->cnt].fname,
			    dp->d_name,
			    MAXNAMLEN);

	            /* get information about the directory entry */
	            snprintf(fpath, sizeof(fpath), "%s/%s", dirpath, dp->d_name);
                    if(stat(fpath, &statbuf))	/* if error getting stat... */
		    {
#if 0
			free_up();		/* free-up used memory */
		        closedir(dirp);		/* close file pointer */
		        return(-1);		/* nobody home */
#endif
			continue;
		    }

		    if(modemask && !(S_IFMT & modemask & statbuf.st_mode))
			continue;

		    if((l = strlen(dp->d_name)) > *len)
			*len = l;

		    datb_cur->data[datb_cur->cnt].time = statbuf.st_mtime;
		    datb_cur->data[datb_cur->cnt].mode = statbuf.st_mode;

		    ++datb_cur->cnt;	/* bump array index / data count */
		}
	    }
	    else
	        break;			/* at end of directory */

	if(datb_cur->cnt < MAX_CNT)	/* if less than full buffer... */
	    break;			/* ...all done */
    }
    
    closedir(dirp);		/* close file pointer */

    /* get memory for single array */
    if((*datptr = (GETSDIR_ENTRY *) calloc(cnt, sizeof(datb_cur->data)))
	== NULL)
    {
	/* couldn't get space, clear everything up */
	free_up();		/* free-up used memory */
        return(-1);		/* error */
    }

    /* copy/concatenate the data */
    cnt = indx = 0;			/* init final count and dest index */
    do
    {
	datb_cur = datb_frst;
	/* copy data in one swell foop */
	memcpy(*datptr+indx*MAX_CNT, datb_cur->data, sizeof(datb_cur->data));
	cnt += datb_cur->cnt;	/* adjust data count */
	++indx;			/* bump destination index */
	datb_frst = datb_cur->nxt;
	free(datb_cur);		/* free no longer needed buffer */
    } while (datb_frst);  /* while more to go */

    free_up();	/* free-up used memory */

    /* post-process array by option */
    if(cnt && sortflags) {
	if(sortflags & GETSDIR_NSORT)
	    qsort(*datptr, cnt, sizeof(GETSDIR_ENTRY),
		  (int (*)(const void *, const void *))namecmpr);
	else if(sortflags & GETSDIR_TSORT)
	    qsort(*datptr, cnt, sizeof(GETSDIR_ENTRY),
		  (int (*)(const void *, const void *))timecmpr);
    }

    return(cnt);

} /* getsdir */


/*
 * name:	free_up
 *
 * purpose:	free up memory allocated for temporary buffers
 *
 * synopsis:	static void freeup()
 *
 * input:	none
 *
 * process:	as under purpose
 *
 * output:	none
 *
 * notes:	none
 */

static void
free_up()
{
    if((datb_cur = datb_frst) != (DAT_BUF *) NULL)	/* start with first */
	do				/* and free 'em all */
	{
	    datb_frst = datb_cur->nxt;
	    free(datb_cur);
	} while ((datb_cur = datb_frst));

} /* free_up */


/*
 * name:	namecmpr
 *
 * purpose:	return stat to qsort on comparison between name fields in
 *		directory entry.
 *
 * synopsis:	static in namecmpr(d1, d2)
 *		GETSDIR_ENTRY *d1;
 *		GETSDIR_ENTRY *d2;
 *
 * input:	See explanation of qsort
 *
 * process:	See explanation of qsort
 *
 * output:	See explanation of qsort
 *
 * notes:	See explanation of qsort
 */

static int
namecmpr(d1, d2)
GETSDIR_ENTRY *d1, *d2;
{
    if(g_sortflags & (GETSDIR_DIRSF | GETSDIR_DIRSL)) {
	if(S_ISDIR((d1->mode)) && ! S_ISDIR((d2->mode)))
	    return((g_sortflags & GETSDIR_DIRSF)? -1 : 1);
	else if(S_ISDIR((d2->mode)) && ! S_ISDIR((d1->mode)))
	    return((g_sortflags & GETSDIR_DIRSF)? 1 : -1);
    }

    return((g_sortflags & GETSDIR_RSORT)?
	strcmp(d2->fname, d1->fname) : strcmp(d1->fname, d2->fname));

} /* namecmpr */


/*
 * name:	timecmpr
 *
 * purpose:	return stat to qsort on comparison between time fields in
 *		directory entry.
 *
 * synopsis:	static in timecmpr(d1, d2)
 *		GETSDIR_ENTRY *d1;
 *		GETSDIR_ENTRY *d2;
 *
 * input:	See explanation of qsort
 *
 * process:	See explanation of qsort
 *
 * output:	See explanation of qsort
 *
 * notes:	See explanation of qsort
 */

static int
timecmpr(d1, d2)
GETSDIR_ENTRY *d1, *d2;
{
    if(g_sortflags & (GETSDIR_DIRSF | GETSDIR_DIRSL)) {
	if(S_ISDIR((d1->mode)) && ! S_ISDIR((d2->mode)))
	    return((g_sortflags & GETSDIR_DIRSF)? -1 : 1);
	else if(S_ISDIR((d2->mode)) && ! S_ISDIR((d1->mode)))
	    return((g_sortflags & GETSDIR_DIRSF)? 1 : -1);
    }

    return((g_sortflags & GETSDIR_RSORT)?
	(d2->time - d1->time) : (d1->time - d2->time));

} /* timecmpr */


#ifdef GETSDIR_STANDALONE_TEST

/*
 * debug for getsdir()
 *
 * usage: getsdir <dirpath>
 *
 */

extern char *ctime();

void
main(argc, argv)
int argc;
char *argv[];
{
    GETSDIR_ENTRY *dirdat;
    int cnt, index;
    int sortflags = 0;
    mode_t modemask = (mode_t) 0;
    int len;

    if(argc != 4)
    {
      fprintf(stderr,"usage: %s <dirpath> <pattern> <sortflags>\n", argv[0]);
      exit(1);
    }

    switch(argv[3][0]) {
	case 'n': sortflags = GETSDIR_NSORT;
		  break;
	case 't': sortflags = GETSDIR_TSORT;
		  break;
    }

/*    sortflags |= GETSDIR_DIRSL | GETSDIR_RSORT; */
    sortflags |= GETSDIR_DIRSF;
/*    sortflags |= GETSDIR_PARNT; */
/*    modemask = S_IFDIR | S_IFREG; */

    printf("modemask==%x\n", modemask);

    if((cnt = getsdir(argv[1], argv[2], sortflags, modemask, &dirdat, &len)) == -1)
    {
	fprintf(stderr, "%s: error getting directory\n", argv[0]);
	exit(1);
    }

    printf(_("%d files:\n"), cnt);
    for(index = 1; index <= cnt; ++index, ++dirdat)
        printf("%2d: %-20s%s",
	    index, dirdat->fname, ctime(&dirdat->time));

    free(dirdat);
    exit(0);

}
#endif
