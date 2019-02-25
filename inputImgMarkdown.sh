#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# Bilder in Markdown einfügen

# Markdown
# (siehe pic. bildname.)
# ![bildname](img/bildname.pdf)

# Variable
#work=~/tex/projekt
file=Input-Img-Markdown.txt 
img="img"
liste="liste.txt"
info="Bilder in Markdown einfügen"
# Zeit
timestamp=$(date +"%Y-%h-%d_%H:%M")
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
cd $img
for i in *.pdf; do
	# dateiname ohne Endung
	picname=`basename "$i" .pdf`
	# (siehe pic. bildname.)
	# ![bildname](img/bildname.pdf)
	printf "(siehe pic. $picname.)\n"           >> ../$file
	printf "![$picname]($img/$i)\n\n"           >> ../$file
done
cd ..

echo "fertig"
