#!/usr/bin/make

PDFLATEX = pdflatex
#DVILATEX = latex
#PSLATEX = dvips
#BIBTEX = bibtex
VIEW = atril
#INDEX = csindex
GLOSSARIES = makeglossaries
VLNA = vlna
DESTDIR ?= ..

SOURCE = navod
SOURCE_FILE = $(SOURCE).tex

all:
ifdef PDFLATEX
	make pdf
endif
ifdef DVILATEX
	make dvi
endif
ifdef PSLATEX
	make ps
endif

bibtex:
	$(BIBTEX) $(SOURCE)

pdf: clean vlna
ifdef INDEX
	touch $(SOURCE).ind
endif
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(SOURCE_FILE)
ifdef BIBTEX
	make bibtex
endif
ifdef INDEX
	$(INDEX) $(SOURCE).idx
endif
ifdef GLOSSARIES
	$(GLOSSARIES) $(SOURCE)
endif
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(SOURCE_FILE)
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error $(SOURCE_FILE)
	mkdir -p $(DESTDIR)
	cp $(SOURCE).pdf $(DESTDIR)/

dvi: clean vlna
ifdef INDEX
	touch $(SOURCE).ind
endif
	$(DVILATEX) $(SOURCE_FILE)
ifdef BIBTEX
	make bibtex
endif
ifdef INDEX
	$(INDEX) $(SOURCE).idx
endif
ifdef GLOSSARIES
	$(GLOSSARIES) $(SOURCE)
endif
	$(DVILATEX) $(SOURCE_FILE)
	$(DVILATEX) $(SOURCE_FILE)

ps: dvi
	$(PSLATEX) $(SOURCE).dvi

show: pdf
	$(VIEW) $(SOURCE).pdf

vlna:
ifdef VLNA

	$(VLNA) $(SOURCE_FILE)
endif


clean:
	rm -f *.aux *.log *.out *.nav *.snm *.bbl *.blg *.toc *.idx *.ind *.ilg *.ps *.dvi *.glo *.ist *.bcf *.glsdefs *.lof *.lot *.xdy
