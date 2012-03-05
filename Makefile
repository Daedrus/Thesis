SRC_DIR=./src
IMG_DIR=$(SRC_DIR)/img
MAIN=thesis.tex

build: thesis.pdf clean-tmp

thesis.pdf: images
	pdflatex $(MAIN)
	bibtex thesis.aux
	pdflatex $(MAIN)
	pdflatex $(MAIN)

# Make this more generic
images:
	epstopdf $(IMG_DIR)/LinkUniv_sigill.eps
	epstopdf $(IMG_DIR)/LinkUniv_staende.eps
	epstopdf $(IMG_DIR)/virtmem.eps
	epstopdf $(IMG_DIR)/virtmemlayout.eps
	epstopdf $(IMG_DIR)/stacklayout.eps

.PHONY: clean-tmp
clean-tmp:
	rm $(IMG_DIR)/*.pdf
	rm *.chg *.log *.lot *.lof *.blg *.bbl *.out *.toc *.aux || exit 0
	find . -name *.aux | xargs rm
