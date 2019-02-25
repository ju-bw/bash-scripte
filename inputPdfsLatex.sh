#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# ExcelPDFs in Latex einfügen

# \usepackage{pdfpages}
# alle PDF Seiten im Querformat
#   \includepdf[landscape=true,pages=-]{excel.pdf}
# eine Seite pro Seite
#   \includepdf[landscape=true,pages={1}]{excel.pdf}
# zwei Seiten pro Seite: nup=<Anzahl der Spalten>x<Anzahl der Zeilen>
#   \includepdf[pages=-,nup= 1x2]{excel.pdf}

# Variable
#work=~/tex/projekt
tex="tex"
excel="excel"
file=inputPdfsLatex.txt # InputExcelPDFs.sh
liste="liste.txt"
info="PDFs in Latex einfügen"
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju -- https://ju1.eu -- Letztes Update: $timestamp_2"

# --------------------------------
echo "+++ $info"
# File neu anlegen
printf "%% ---------------------------------\n"      >  $file
printf "%% $info \n"                                 >> $file
printf "%% $copyright\n"                             >> $file
printf "%% ---------------------------------\n"      >> $file
printf "%% \n"                                       >> $file

# 
cd $excel
for i in *.pdf; do
	# Dateiname ohne Endung
	pdfname=`basename "$i" .pdf`
	# zwei Seiten pro Seite: nup=<Anzahl der Spalten>x<Anzahl der Zeilen>
	printf "\section{$pdfname}\n"                                      >> ../$file
	printf "%% -------\n"                                              >> ../$file
	printf "\includepdf[scale=0.9, pages=-,nup= 1x2]{$excel/$i}\n\n"   >> ../$file
done
cd ..

echo "fertig"
