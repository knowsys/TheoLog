#!/bin/sh
#
# Script to prepare final PDFs for presentation and print.
#
# Usage sh build.sh <lectureNumberAsString>

fileprefix="TheoLog2017-Vorlesung-" # the start of generated PDFs
tmpfilename="`mktemp tmplecturefile-XXX`" # generate a name that doesn't collide with anything present

printfilename=$fileprefix$1-print.pdf
overlayfilename=$fileprefix$1-overlay.pdf

printf "\\documentclass[aspectratio=1610,onlymath,handout]{beamer}\n\n" > $tmpfilename.tex
tail -n +3 lecture-$1.tex >> $tmpfilename.tex
latexmk -lualatex ${tmpfilename}.tex
latexmk -c ${tmpfilename}.tex
pdfnup --nup 2x2 --outfile $printfilename $tmpfilename.pdf

printf "\\documentclass[aspectratio=1610,onlymath]{beamer}\n\n" > $tmpfilename.tex
tail -n +3 lecture-$1.tex >> $tmpfilename.tex
latexmk -lualatex ${tmpfilename}.tex
latexmk -c ${tmpfilename}.tex
mv $tmpfilename.pdf $overlayfilename

rm $tmpfilename $tmpfilename}.*

printf "\n\n*** Finished creating files '$overlayfilename' and '$printfilename' ***\n"
