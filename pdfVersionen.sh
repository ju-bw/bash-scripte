#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# PDF - Versionen erstellen

# ANPASSEN
pdfname="notizenDummy-v02-Ubuntu"

# Variable
info="PDF - Versionen erstellen"
pdf=pdf
#dateiname ohne Endung
filename1=`basename "main-book" .pdf`
filename2=`basename "main-print" .pdf`
file="MD5-Hash.txt"
timestamp=$(date +"%Y-%h-%d_%H:%M")
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju -- https://ju1.eu -- Letztes Update: $timestamp_2"

# ------------------------------
echo "+++ $info"

# git commit (hashwert) = id
ID=$(git rev-parse --short HEAD)

# main-book
printf "# -------------------------------------\n"   >  $file
printf "# PDF: 				    'main-book'          \n"   >> $file
printf "# Datum: 			  	'$timestamp'         \n"   >> $file
printf "# Git - Hashwert: '$ID'                \n"   >> $file
printf "# -------------------------------------\n\n" >> $file

printf "# md5sum \n"                >> $file

if [ ! -e "$filename1".pdf  ]; then echo "Fehler: '$filename1'.pdf nicht vorhanden."; exit; fi
#build - Versionen erstellen - _6dc708-2016-04-03-15-53-48
cp "$filename1".pdf "$filename1"-"$ID"-"$timestamp".pdf
echo "$filename1"-"$ID"-"$timestamp".pdf    >> $file
printf "\n# md5sum - Prüfsumme\n"           >> $file
#hashwert
md5sum "$filename1"-"$ID"-"$timestamp".pdf  >> $file

printf "\n" >> $file

# main-print
printf "# -------------------------------------\n"   >> $file
printf "# PDF: 				    'main-print'         \n"   >> $file
printf "# Datum: 				  '$timestamp'         \n"   >> $file
printf "# Git - Hashwert: '$ID'                \n"   >> $file
printf "# -------------------------------------\n\n" >> $file

printf "# md5sum \n"                >> $file

if [ ! -e "$filename2".pdf  ]; then echo "Fehler: '$filename2'.pdf nicht vorhanden."; exit; fi
#build - Versionen erstellen - _6dc708_2016-04-03_15-53-48
cp "$filename2".pdf "$filename2"-"$ID"-"$timestamp".pdf
echo "$filename2"-"$ID"-"$timestamp".pdf    >> $file
printf "\n# md5sum - Prüfsumme\n"           >> $file
#hashwert
md5sum "$filename2"-"$ID"-"$timestamp".pdf  >> $file



cp -Rp main-book*pdf $pdfname/$pdf/
cp -Rp main-print*pdf $pdfname/$pdf/
cp -Rp $file $pdfname/

echo "fertig"
