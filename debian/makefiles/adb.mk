# Makefile for adb; based on core/adb/Android.mk

VPATH+= ../adb
SRCS+= adb.c
SRCS+= console.c
SRCS+= transport.c
SRCS+= transport_local.c
SRCS+= transport_usb.c
SRCS+= commandline.c
SRCS+= adb_client.c
SRCS+= adb_auth_host.c
SRCS+= sockets.c
SRCS+= services.c
SRCS+= file_sync_client.c
SRCS+= get_my_path_linux.c
SRCS+= usb_linux.c
SRCS+= usb_vendors.c
SRCS+= fdevent.c

VPATH+= ../libcutils
SRCS+= load_file.c
SRCS+= socket_inaddr_any_server.c
SRCS+= socket_local_client.c
SRCS+= socket_local_server.c
SRCS+= socket_loopback_client.c
SRCS+= socket_loopback_server.c
SRCS+= socket_network_client.c

CPPFLAGS+= -DADB_HOST=1
CPPFLAGS+= -DHAVE_FORKEXEC=1
CPPFLAGS+= -DHAVE_SYMLINKS
CPPFLAGS+= -DHAVE_TERMIO_H
CPPFLAGS+= -I.
CPPFLAGS+= -I../adb
CPPFLAGS+= -I../include
CPPFLAGS+= -I../../../external/zlib

LIBS+= -lc -lpthread -lz -lcrypto

OBJS= $(SRCS:.c=.o)

all: adb

adb: $(OBJS)
	$(CC) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)

clean:
	rm -rf $(OBJS) adb
