# $Id: Makefile,v 1.4 2008-04-05 03:36:09 david Exp $
#
# Makefile for my LaTeX source, used for CTeX system.

SOURCES := $(wildcard *.tex)
MAINFLE := monad.tex

AUXFILE := $(patsubst %.tex, %.aux, $(MAINFLE))
LOGFILE := $(patsubst %.tex, %.log, $(MAINFLE))
OUTFILE := $(patsubst %.tex, %.out, $(MAINFLE))
PDFFILE := $(patsubst %.tex, %.pdf, $(MAINFLE))
TOCFILE := $(patsubst %.tex, %.toc, $(MAINFLE))

ifeq ($(OS), Windows_NT)
RM	:= del
endif

TEX	:= xelatex

all: pdf

pdf: $(SOURCES)
	$(TEX) $(MAINFLE)
	$(TEX) $(MAINFLE)

.PHONY: clean
clean:
	$(RM) *~ *.bak $(AUXFILE) $(LOGFILE) $(TOCFILE) $(OUTFILE) $(PDFFILE)
