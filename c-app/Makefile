SHELL = /bin/sh
CC = gcc
CFLAGS = -O2
LDFLAGS = -Wl,--strip-all
SRC = c-app.c
C_LIB_DIR = ../c-lib

# https://stackoverflow.com/questions/726014/linking-a-shared-library-using-gcc

ifeq ($(OS),Windows_NT)
	OUTNAME = c-app.exe
	IFLAGS = -I$(C_LIB_DIR)
	LIBS = -lc-lib
	LDIRFLAGS = -L$(C_LIB_DIR)
	RM = rm -f
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OUTNAME = c-app
		IFLAGS = -I$(C_LIB_DIR)
		LIBS = -lc-lib
		LDIRFLAGS = -L$(C_LIB_DIR)
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
	if [ -v OS ] && [ $(OS) -eq "Windows_NT" ] ; \
	then \
		./win_run.sh ; \
	else \
		if [ $(shell uname -s) = "Linux" ] ; \
		then \
			LD_LIBRARY_PATH=../c-lib ./$(OUTNAME) ; \
		fi \
	fi

clean:
	if [ -v OS ] && [ $(OS) = "Windows_NT" ] ; \
	then \
		$(RM) ./libc-lib.dll ; \
	fi && \
	$(RM) ./$(OUTNAME)