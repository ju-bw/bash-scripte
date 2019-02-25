#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# Projekt erstellen

# ANPASSEN
pdfname="notizenDummy-v02-Ubuntu"

# Variable
info="Projekt erstellen"
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
timestamp=$(date +"%Y-%h-%d_%H:%M")
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju -- https://ju1.eu -- $timestamp_2"

# ----------------------------
echo "+++ $info"

echo "+++ Verz. erstellen, wenn nicht vorhanden"
if [ ! -d ./$html ];            then mkdir -p ./$html; fi
if [ ! -d ./$html_wp ];         then mkdir -p ./$html_wp; fi
if [ ! -d ./$tex ];             then mkdir -p ./$tex; fi
if [ ! -d ./$archiv ];          then mkdir -p ./$archiv; fi
if [ ! -d ./$tex_pandoc ];      then mkdir -p ./$tex_pandoc; fi
if [ ! -d ./$img_in ];          then mkdir -p ./$img_in; fi
if [ ! -d ./$img_out ];         then mkdir -p ./$img_out; fi
if [ ! -d ./$excel ];           then mkdir -p ./$excel; fi
# projekt
if [ ! -d ./$pdfname ];          then mkdir -p ./$pdfname; fi
if [ ! -d ./$pdfname/$md ];      then mkdir -p ./$pdfname/$md; fi
if [ ! -d ./$pdfname/$html ];    then mkdir -p ./$pdfname/$html; fi
if [ ! -d ./$pdfname/$html_wp ]; then mkdir -p ./$pdfname/$html_wp; fi
if [ ! -d ./$pdfname/$tex ];     then mkdir -p ./$pdfname/$tex; fi
if [ ! -d ./$pdfname/$pdf ];     then mkdir -p ./$pdfname/$pdf; fi
if [ ! -d ./$pdfname/$excel ];   then mkdir -p ./$pdfname/$excel; fi
if [ ! -d ./$pdfname/$img ];     then mkdir -p ./$pdfname/$img; fi
if [ ! -d ./$pdfname/$code ];    then mkdir -p ./$pdfname/$code; fi
if [ ! -d ./$pdfname/$scripte ]; then mkdir -p ./$pdfname/$scripte; fi
if [ ! -d ./$pdfname/$content ]; then mkdir -p ./$pdfname/$content; fi


# git
git init

echo "fertig"
