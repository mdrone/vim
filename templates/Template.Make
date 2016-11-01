:insert
CC=gcc
CFLAGS=-std=c11 -v -Wall -Wconversion -ggdb -O0 -fbuiltin -W -Wstrict-prototypes -Wreturn-type -Wsequence-point -pedantic -Wextra -Werror -ffreestanding -fbounds-check -fsanitize=undefined -fdiagnostics-color=auto
CFLAGSPROF=$(CFLAGS) -pg -fprofile-arcs -ftest-coverage
all: Template

Template: Template.o

clean:
	rm -f Template
