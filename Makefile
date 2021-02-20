LUA         = 5.1
LUA_INCLUDE = -I/usr/include/lua$(LUA)

PREFIX      = /usr
LIBDIR      = $(PREFIX)/lib/lua/$(LUA)

WARN        = -Wall -Wmissing-prototypes -Wmissing-declarations -ansi -pedantic -fPIC
CFLAGS      = -O2 $(WARN) $(LUA_INCLUDE) `pkg-config --cflags --libs gtk+-3.0 lua$(LUA) libnotify`
CXXFLAGS    = -O2 $(WARN) $(LUA_INCLUDE)
CC          = gcc

all: notify.so

notify.so: notify.o
	$(CC) -o $@ -shared notify.o $(CFLAGS)

clean:
	rm -f notify.so *.o
  
install:
	install -m 755 notify.so $(DESTDIR)$(LIBDIR)/notify.so

uninstall:
	rm -f $(DESTDIR)$(LIBDIR)/notify.so
  
.PHONY: notify