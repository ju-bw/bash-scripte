#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# Latex Kapitel *.tex 

# Latex
#   \chapter{Kapitel}
#   \input{tex/Kapitel}

# Variable
#work=~/tex/projekt
tex="tex"
file=inputKapitelLatex.txt 
info="Latex Kapitel *.tex"
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju -- https://ju1.eu -- Letztes Update: $timestamp_2"

#  --------------------------------
echo "+++ $info"
# File neu anlegen
printf "%% ---------------------------------\n"      >  $file
printf "%% $info \n"                                 >> $file
printf "%% $copyright\n"                             >> $file
printf "%% ---------------------------------\n"      >> $file
printf "%%\n"                                        >> $file

# book - print
printf "%% book - print: kopie nach inhalt.tex\n"    >> $file
printf "%% -------------\n"                          >> $file
cd $tex
for i in *.tex; do
	# dateiname ohne Endung
	texname=`basename "$i" .tex`
	# \chapter{Kapitel}
  # \input{Kapitelname}
	printf "\chapter{$texname}\n"                 >> ../$file
	printf "\input{$tex/$texname}\n\n"            >> ../$file
done

# artikel                             
printf "%% Artikel: kopie nach *-artikel.tex\n"  >> ../$file                                     >> $file
printf "%% ---------\n"                          >> ../$file
#cd $tex
for i in *.tex; do
	# dateiname ohne Endung
	texname=`basename "$i" .tex`
  # \input{Kapitelname}
	printf "\input{$tex/$texname}\n"               >> ../$file
done
cd ..

echo "fertig" 
