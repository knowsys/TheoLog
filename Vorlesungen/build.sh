#!/bin/sh
#
# Script to prepare final PDFs for presentation and print.
#
# Usage sh build.sh <lectureNumberAsString>

fileprefix="TheoLog2017-Vorlesung-" # the start of generated PDFs

inputfilename=lecture-${1}.tex
printfilename=${fileprefix}${1}-print.pdf
overlayfilename=${fileprefix}${1}-overlay.pdf

latexmk -lualatex -pdflatex="lualatex --shell-escape %O %S" ${inputfilename}
cp lecture-${1}-print.pdf ${printfilename}
cp lecture-${1}.pdf ${overlayfilename}

echo
echo
echo "*** Finished creating files '${overlayfilename}' and '${printfilename}' ***"
echo
