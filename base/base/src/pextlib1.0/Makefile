OBJS=		Pextlib.o strsed.o fgetln.o md5cmd.o setmode.o xinstall.o \
		fs-traverse.o strcasecmp.o vercomp.o filemap.o \
		sha1cmd.o compat.o curl.o rmd160cmd.o readline.o uid.o\
		tracelib.o tty.o
SHLIB_NAME=	Pextlib${SHLIB_SUFFIX}
INSTALLDIR= ${DESTDIR}${datadir}/macports/Tcl/pextlib1.0

include ../../Mk/macports.autoconf.mk
include ../../Mk/macports.tea.mk

CFLAGS+= ${CURL_CFLAGS} ${MD5_CFLAGS} ${READLINE_CFLAGS}
LIBS+= ${CURL_LIBS} ${MD5_LIBS} ${READLINE_LIBS}

.PHONY: test

test:: ${SHLIB_NAME}
	${TCLSH} tests/curl.tcl ${SHLIB_NAME}
	${TCLSH} tests/checksums.tcl ${SHLIB_NAME}
	${TCLSH} tests/filemap.tcl ${SHLIB_NAME}
	${TCLSH} tests/fifo.tcl ${SHLIB_NAME}
	${TCLSH} tests/fs-traverse.tcl ${SHLIB_NAME}
	${TCLSH} tests/socketpair.tcl ${SHLIB_NAME}
