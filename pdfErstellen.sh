#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# PDF erstellen - pdflatex: tex -> pdf 

# ANPASSEN
pdfname="notizenDummy-v02-Ubuntu"

# Variable
info="PDF erstellen - pdflatex: tex -> pdf"
scripte="scripte"
code="code"
img="img"
img_in="img-in"
img_out="img-out"
pdf="pdf"
md="md"
tex="tex"
tex_pandoc="tex-pandoc"
html="html"
html_wp="html-wp"
archiv="archiv"
excel="excel"
content="content"
timestamp=$(date +"%Y-%h-%d")
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju -- https://ju1.eu -- Letztes Update: $timestamp_2"

# -------------------------------
echo "+++ $info"

# pdflatex: Latex --> PDF

# -------------------------------
# artikel
pdflatex main-artikel.tex
# Literatur
biber main-artikel
# Index
#texindy -g  --module ff-ranges-only main-artikel.idx
 # IndexKonfig.xdy
#xindy -L german-din -I latex --module IndexKonfig main-artikel.idx
pdflatex main-artikel.tex
pdflatex main-artikel.tex

# -------------------------------
# artikel ohne Inhaltsverzeichnis
pdflatex main-light.tex
# Literatur
biber main-light
# Index
#texindy -g  --module ff-ranges-only main-artikel.idx
# IndexKonfig.xdy
#xindy -L german-din -I latex --module IndexKonfig main-artikel.idx
pdflatex main-light.tex
pdflatex main-light.tex

# -------------------------------
# book
pdflatex main-book.tex
# Literatur
biber main-book
# Index
#texindy -g --module ff-ranges-only main-book.idx
# IndexKonfig.xdy
#xindy -L german-din -I latex --module IndexKonfig main-book.idx
pdflatex main-book.tex
pdflatex main-book.tex

# -------------------------------
# print
pdflatex main-print.tex
# Literatur
biber main-print
# Index
#texindy -g  --module ff-ranges-only main-print.idx
# IndexKonfig.xdy
#xindy -L german-din -I latex --module IndexKonfig main-print.idx
pdflatex main-print.tex
pdflatex main-print.tex

# -------------------------------
# latexmk 
#latexmk -f -pdf main-book
#latexmk -f -pdf main-print
#latexmk -f -pdf main-artikel

# -------------------------------
# Latex aufraeumen
rm -f *~ *.aux *.bbl *.blg *.fls *.log *.nav *.out *.snm *.synctex *.toc \
  *.idx *.ilg *.ind *.thm *.lof *.lol *.lot *.nlo *.run.xml *blx.bib *.bcf

# -------------------------------
# kopie
# Datei umbenennen
cp -Rp "main-book".pdf          $pdfname/$pdf/$pdfname-book.pdf
cp -Rp "main-print".pdf         $pdfname/$pdf/$pdfname-print.pdf
cp -Rp "main-artikel".pdf       $pdfname/$pdf/$pdfname-artikel.pdf
cp -Rp "main-light".pdf         $pdfname/$pdf/$pdfname-light.pdf
cp -Rp *.tex                    $pdfname/
cp -Rp projekt.sh               $pdfname/


# Wenn pdf-erstellung erfolgreich,
rsync -avpEh --delete $tex/     $pdfname/$tex
rsync -avpEh --delete $md/      $pdfname/$md
rsync -avpEh --delete $html/    $pdfname/$html
rsync -avpEh --delete $html_wp/ $pdfname/$html_wp
rsync -avpEh --delete $excel/   $pdfname/$excel
rsync -avpEh --delete $scripte/ $pdfname/$scripte
rsync -avpEh --delete $content/ $pdfname/$content
rsync -avpEh --delete $code/    $pdfname/$code
rsync -avpEh --delete $img/     $pdfname/$img

# Scriptaufruf
./$scripte/projektInhalt.sh
cp -Rp Projekt-Inhalt.txt       $pdfname/

# archiv Kapitel Handarbeit tex
#work=~/tex/projekt
cd $tex
tar cvfz ../$archiv/"$timestamp"-Handarbeit-$tex.tar.gz .
cd ..

echo "fertig"
