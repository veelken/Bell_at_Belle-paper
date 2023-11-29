#!/bin/bash

# produce elsarticle.cls
latex elsarticle.ins

# delete old files
rm -fv bell_at_belle.blg bell_at_belle.aux bell_at_belle.out bell_at_belle.log bell_at_belle.pdf bell_at_belle_grayscale.pdf

# compile latex sources
pdflatex bell_at_belle.tex
bibtex bell_at_belle
pdflatex bell_at_belle.tex
pdflatex bell_at_belle.tex

# convert to grayscale
if [[ -f bell_at_belle.pdf ]] && [[ "$1" = "grayscale" ]]; then
  gs \
   -sOutputFile=bell_at_belle_grayscale.pdf \
   -sDEVICE=pdfwrite \
   -sColorConversionStrategy=Gray \
   -dProcessColorModel=/DeviceGray \
   -dCompatibilityLevel=1.4 \
   -dNOPAUSE \
   -dBATCH \
   bell_at_belle.pdf
fi
