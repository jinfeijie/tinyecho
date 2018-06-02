dnl $Id$
dnl config.m4 for extension tinyecho

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(tinyecho, for tinyecho support,
dnl Make sure that the comment is aligned:
dnl [  --with-tinyecho             Include tinyecho support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(tinyecho, whether to enable tinyecho support,
Make sure that the comment is aligned:
[  --enable-tinyecho           Enable tinyecho support])

if test "$PHP_TINYECHO" != "no"; then
  dnl Write more examples of tests here...

  dnl # get library FOO build options from pkg-config output
  dnl AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
  dnl AC_MSG_CHECKING(for libfoo)
  dnl if test -x "$PKG_CONFIG" && $PKG_CONFIG --exists foo; then
  dnl   if $PKG_CONFIG foo --atleast-version 1.2.3; then
  dnl     LIBFOO_CFLAGS=`$PKG_CONFIG foo --cflags`
  dnl     LIBFOO_LIBDIR=`$PKG_CONFIG foo --libs`
  dnl     LIBFOO_VERSON=`$PKG_CONFIG foo --modversion`
  dnl     AC_MSG_RESULT(from pkgconfig: version $LIBFOO_VERSON)
  dnl   else
  dnl     AC_MSG_ERROR(system libfoo is too old: version 1.2.3 required)
  dnl   fi
  dnl else
  dnl   AC_MSG_ERROR(pkg-config not found)
  dnl fi
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBDIR, TINYECHO_SHARED_LIBADD)
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)

  dnl # --with-tinyecho -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/tinyecho.h"  # you most likely want to change this
  dnl if test -r $PHP_TINYECHO/$SEARCH_FOR; then # path given as parameter
  dnl   TINYECHO_DIR=$PHP_TINYECHO
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for tinyecho files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       TINYECHO_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$TINYECHO_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the tinyecho distribution])
  dnl fi

  dnl # --with-tinyecho -> add include path
  dnl PHP_ADD_INCLUDE($TINYECHO_DIR/include)

  dnl # --with-tinyecho -> check for lib and symbol presence
  dnl LIBNAME=tinyecho # you may want to change this
  dnl LIBSYMBOL=tinyecho # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $TINYECHO_DIR/$PHP_LIBDIR, TINYECHO_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_TINYECHOLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong tinyecho lib version or lib not found])
  dnl ],[
  dnl   -L$TINYECHO_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(TINYECHO_SHARED_LIBADD)
  PHP_REQUIRE_CXX()    dnl 通知Make使用g++
  PHP_ADD_LIBRARY(stdc++, 1, EXTRA_LDFLAGS)    dnl 加入C++标准库

  PHP_NEW_EXTENSION(tinyecho, tinyecho.cpp, $ext_shared)
  dnl PHP_NEW_EXTENSION(tinyecho, tinyecho.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
fi
