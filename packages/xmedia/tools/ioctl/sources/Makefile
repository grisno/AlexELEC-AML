#
# Licence: GPL
# Created: 2015-05-15 10:04:49+02:00
# Main authors:
#     - Jérôme Pouiller <jezz@sysmic.org>
#
CC ?= gcc
CFLAGS ?= -Wall
PREFIX ?= /usr/local

all: ioctl

ioctl: ioctl.o
ioctl: ioctls_list.o
-include ioctl.d
-include ioctls_list.d

ioctls_list.c: gen_ioctls_list.sh
	bash $< $(CC) > $@

%.o: %.c
	$(COMPILE.c) -MMD -c -o $@ $<

clean:
	rm -f *.o *.d

distclean: clean
	rm ioctl

install:
	install -s -D -m 755 ioctl $(PREFIX)/bin


