LUA         = lua5.1
LUA_INCLUDE = -I/usr/include/$(LUA)

WARN        = -Wall -Wmissing-prototypes -Wmissing-declarations -ansi -pedantic -fPIC
CFLAGS      = -O2 $(WARN) $(LUA_INCLUDE) `pkg-config --cflags --libs gtk+-2.0 $(LUA) libnotify`
CXXFLAGS    = -O2 $(WARN) $(LUA_INCLUDE)
CC          = gcc

all: notify.so

notify.so: notify.o
	$(CC) -o $@ -shared notify.o $(CFLAGS)


clean:
	rm -f notify.so *.o $(TARBALL)


