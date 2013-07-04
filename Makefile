.PHONY: all pdf dvi clean cleanall

PAPER_IN = msc
PAPER_OUT = Kotelnikov_MSc

all: pdf

pdf: paper $(PAPER_OUT).pdf

dvi: paper $(PAPER_OUT).dvi

paper: $(PAPER_IN).toc bibliography

bibliography: $(PAPER_IN).bbl
	pdflatex $(PAPER_IN).tex

$(PAPER_OUT).pdf: $(PAPER_IN).tex
	pdflatex $(PAPER_IN).tex

$(PAPER_OUT).dvi: $(PAPER_IN).tex
	pdflatex $(PAPER_IN).tex

$(PAPER_IN).toc: $(PAPER_IN).tex
	pdflatex $(PAPER_IN).tex

$(PAPER_IN).bbl: $(PAPER_IN).aux
	bibtex $(PAPER_IN).aux

clean:
	rm -rf $(PAPER).pdf

cleanall:
	rm -rf *.log *.aux *.ins *.idx *.out *.pdf *.dvi *.toc *.bbl *.blg
