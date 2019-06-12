# Settings program and objects 
SUFFIX = .c

# Redefine macros
CC = gcc
CFLAGS = -Wall -g -O0

SOURCES = $(wildcard *$(SUFFIX))
OBJECTS = $(notdir $(SOURCES:$(SUFFIX)=.o))
TARGETS = $(notdir $(basename $(SOURCES)))
RMTARGETS = $(TARGETS)

ifeq ($(OS),Windows_NT)
# for Windows
	CFLAGS += --exec-charset=cp932
	RMTARGETS = $(notdir $(SOURCES:$(SUFFIX)=.exe))
endif

# make all target
.PHONY: all
all: $(TARGETS)

# clean target
.PHONY: clean
clean:
	$(RM) $(RMTARGETS) $(OBJECTS)
