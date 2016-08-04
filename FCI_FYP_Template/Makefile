all:
	pdflatex thesis
	bibtex thesis
	pdflatex thesis
	pdflatex thesis

ifeq ($(shell uname -s), Darwin)
	open thesis.pdf
endif
