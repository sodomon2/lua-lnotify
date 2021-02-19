ifndef LUA_INC
	LUA = lua5.1
endif

WARN= -Wall -Wmissing-prototypes -Wmissing-declarations -ansi -pedantic -fPIC
INCS= -I/usr/include/$(LUA)
CFLAGS= -O2 $(WARN) $(INCS) $(DEFS) `pkg-config --cflags --libs gtk+-2.0 $(LUA) libnotify` 
CXXFLAGS= -O2 $(WARN) $(INCS) $(DEFS)
CC= gcc


LIBNAME= notify.so

OBJS= notify.o
SRCS= notify.c

all: $(LIBNAME)

$(LIBNAME): $(OBJS)
	$(CC) -o $@ -shared $(OBJS) $(CFLAGS)

clean:
	rm -f $(LIBNAME) *.o $(TARBALL)


