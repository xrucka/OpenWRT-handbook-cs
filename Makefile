#!/usr/bin/make

DESTDIR ?= ..

all: navod.pdf navod.html

navod.pdf: navod.md
	pandoc navod.md --latex-engine=xelatex -o navod.pdf

navod.html: navod.md
	pandoc -s navod.md -o navod.html

clean:
	rm -f *.pdf *.html
