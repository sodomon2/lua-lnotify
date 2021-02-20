LDOC        = ldoc
LUA         = 5.1
LUA_INCLUDE = -I/usr/include/lua$(LUA)

PREFIX      = /usr
LIBDIR      = $(PREFIX)/lib/lua/$(LUA)

WARN        = -Wall -Wmissing-prototypes -Wmissing-declarations -ansi -pedantic -fPIC
CFLAGS      = -O2 $(WARN) $(LUA_INCLUDE) `pkg-config --cflags --libs gtk+-3.0 lua$(LUA) libnotify`
CXXFLAGS    = -O2 $(WARN) $(LUA_INCLUDE)
CC          = gcc

all: moonnotify.so

doc: 
	$(LDOC) doc/moonnotify.luadoc

moonnotify.so: moonnotify.o
	$(CC) -o $@ -shared moonnotify.o $(CFLAGS)

clean:
	rm -f moonnotify.so *.o doc/*.html doc/*.css
  
install:
	install -m 755 moonnotify.so $(DESTDIR)$(LIBDIR)/moonnotify.so

uninstall:
	rm -f $(DESTDIR)$(LIBDIR)/moonnotify.so
  
.PHONY: moonnotify doc