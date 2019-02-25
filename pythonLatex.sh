#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# alle Python - Scripte in Latex speichern

# Variable
#work=~/tex/projekt   
code="code"    # quellcode          
file="alle-python-files.tex" 
info="alle Python - Scripte in Latex speichern"
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju -- https://ju1.eu -- Letztes Update: $timestamp_2"

# ---------------------------------
echo $info

# File neu anlegen
printf "%% ---------------------------------\n"              >  $file
printf "%% $info \n"                                         >> $file
printf "%% $copyright\n"                                     >> $file
printf "%% ---------------------------------\n"              >> $file
printf "%%\n"                                                >> $file
printf "\section{Python - Scripte}\label{pythonscripte}\n"   >> $file
printf "%% ------\n\n"                                       >> $file

# quellcode
# anpassen --------------------------------
cd ../$code
for i in *.py; do               
	# Dateiname ohne Endung
	scriptname=`basename "$i" .py` # anpassen
  # latex quellcode
	printf "\subsection{$scriptname}\n"                                >> ../$file
	printf "%% ---------\n\n"                                          >> ../$file
	echo "(Programm~\ref{code:$scriptname} $i)."                       >> ../$file
  printf "%%\n"                                                      >> ../$file
  # anpassen --------------------------------------------------------
  printf "\lstset{language=Python}%% C, [LaTeX]TeX, Bash, Python\n"    >> ../$file   
  printf "\lstinputlisting[numbers=left, frame=l, framerule=0.1pt,%%\n"  >> ../$file
  printf "caption={Quellcode in Python, $i},%% Caption\n"              >> ../$file
  # anpassen --------------------------------------------------------
  printf "label={code:$scriptname},%% Label \n"                      >> ../$file
  printf "]{$code/$i}%% ext. file\n\n"                               >> ../$file
  echo "\newpage"                                                    >> ../$file
done
cd ..

echo "fertig"
