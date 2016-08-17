#!/usr/bin/make

all:
	make -C src all
	
%: 
	make -C src $@
