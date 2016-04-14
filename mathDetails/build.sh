# Builds the vignette in the glmnetLRC package
# Usage:  ./mathDetails/build.sh
cd mathDetails
pdflatex glmnetLRC
bibtex glmnetLRC
pdflatex glmnetLRC
pdflatex glmnetLRC
rm glmnetLRC.aux
rm glmnetLRC.bbl
rm glmnetLRC.blg
rm glmnetLRC.log
