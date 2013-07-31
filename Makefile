PS2PDF:=ps2pdf
PS2PDFOPTS:=-dSAFER -dNOPLATFONTS -dNOPAUSE -dBATCH -sPAPERSIZE=letter -dPDFSETTINGS=/prepress -dMaxSubsetPct=0 -dEmbedAllFonts=true
NAME=paper
FINALNAME:=$(NAME)
GRAPHS=$(wildcard figs/*.pdf)
FILES=$(wildcard *.tex)
REFS=$(wildcard *.bib)

all: $(FINALNAME).pdf ${NAME}.pdf

${NAME}.pdf: ${NAME}.tex ${GRAPHS} ${FILES} ${REFS}
	pdflatex ${NAME}
	bibtex ${NAME}
	pdflatex ${NAME}
	pdflatex ${NAME}

%-cameraready.pdf: %.ps
	$(PS2PDF) $(PS2PDFOPTS) $< $@

clean:
	rm -f ${NAME}.pdf ${FINALNAME}.pdf ${NAME}.dvi ${NAME1}.dvi *.bbl *.aux \
	*.log *.blg *.ascii *.out *~
cleaner: clean
	rm -f *.texshop
