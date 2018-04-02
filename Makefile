# Settings program and objects 
PROGRAM = ConsoleApp
OBJS = ConsoleApp.o

# Redefine macros
CC = gcc
CFLAGS = -Wall -g -O0

ifeq ($(OS),Windows_NT)
# for Windows
	CFLAGS += --exec-charset=cp932
endif

# Define extentions for suffix rule
.SUFFIXES: .c .o

# Primary target
$(PROGRAM): $(OBJS)
	$(CC) -o $(PROGRAM) $^

# suffix rule
.c.o:
	$(CC) $(CFLAGS) -c $<

# clean target
.PHONY: clean
clean:
	$(RM) $(PROGRAM) $(OBJS)
