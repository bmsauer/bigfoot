#makefile for termbox-ada demo
SHELL=/bin/bash

all: clean build bind linkall

build: main.adb
	gnatmake -aI./include -aI./pkg -c main.adb

bind:
	gnatbind main.ali

linkall:
	gnatlink main.ali ./lib/libmpv.so ./lib/libtermbox.so  -Wl,-rpath=./lib/

clean:
	gnatclean main
