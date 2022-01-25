SHELL = /bin/sh
CC = gcc
CFLAGS = -O2 -shared -fPIC
LDFLAGS = -Wl,--strip-all
SRC = c-lib.c

# https://stackoverflow.com/questions/14884126/build-so-file-from-c-file-using-gcc-command-line
# https://www.baeldung.com/linux/a-so-extension-files

ifeq ($(OS),Windows_NT)
	OUTNAME = libc-lib.dll
	IFLAGS =
	LIBS =
	LDIRFLAGS =
	RM = rm -f
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OUTNAME = libc-lib.so
		IFLAGS =
		LIBS =
		LDIRFLAGS =
		RM = rm -f
#	else ifeq ($(UNAME_S),Darwin))
#		I don't have access to MacOS, you're on your own :)
	endif
endif

# https://stackoverflow.com/questions/13768515/how-to-do-static-linking-of-libwinpthread-1-dll-in-mingw

.PHONY: run clean

$(OUTNAME): $(SRC)
	$(CC) $(CFLAGS) $(IFLAGS) $(SRC) $(DFLAGS) -o $(OUTNAME) $(LDFLAGS) $(LDIRFLAGS) $(LIBS)

run: $(OUTNAME)
	./$(OUTNAME)

clean:
	$(RM) ./$(OUTNAME)