dnl $Id: acinclude.m4,v 1.1.1.1 2003/03/30 18:55:35 al-guest Exp $
dnl ---------------------------------------------------------------
dnl AC_DEFINE_DIR(VARNAME, DIR)

dnl defines (with AC_DEFINE) VARNAME to the expansion of the DIR
dnl variable, expanding ${prefix} and such
dnl example: AC_DEFINE_DIR(DATADIR, datadir)
dnl by Alexandre Oliva <oliva@dcc.unicamp.br>

AC_DEFUN(AC_DEFINE_DIR, [
        ac_expanded=`(
            test "x$prefix" = xNONE && prefix="$ac_default_prefix"
            test "x$exec_prefix" = xNONE && exec_prefix="${prefix}"
            eval echo \""[$]$2"\"
        )`
        AC_DEFINE_UNQUOTED($1, "$ac_expanded")
])

