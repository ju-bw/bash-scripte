#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# Projekt files in Latex speichern

# Variable
#work=~/tex/projekt   
code="scripte"     # bash files    *.sh     
content="content"  # projekt files *.tex  
file="Projekt-files.tex" 
info="Projekt files in Latex speichern"
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju -- https://ju1.eu -- Letztes Update: $timestamp_2"

# ---------------------------------
echo "+++ $info"

# File neu anlegen
printf "%% ---------------------------------\n"              >  $file
printf "%% $info \n"                                         >> $file
printf "%% $copyright\n"                                     >> $file
printf "%% ---------------------------------\n"              >> $file
printf "%%\n"                                                >> $file

printf "\chapter{Projekt files}\n"                           >> $file
printf "%% ------\n\n"                                       >> $file

printf "\section{Bash - Scripte}\label{bashscripte}\n"       >> $file
printf "%% ------\n\n"                                       >> $file

# quellcode bash
# anpassen --------------------------------
cd $code 
for i in *.sh; do               
	# Dateiname ohne Endung
	scriptname=`basename "$i" .sh` # anpassen
  # latex quellcode
	printf "\subsection{$scriptname}\n"                                >> ../$file
	printf "%% ---------\n\n"                                          >> ../$file
	echo "(Programm~\ref{code:$scriptname} $i)."                       >> ../$file
  printf "%%\n"                                                      >> ../$file
  # anpassen --------------------------------------------------------
  printf "\lstset{language=Bash}%% C, [LaTeX]TeX, Bash, Python\n"    >> ../$file   
  printf "\lstinputlisting[numbers=left, frame=l, framerule=0.1pt,%%\n"  >> ../$file
  printf "caption={Quellcode in Bash, $i},%% Caption\n"              >> ../$file
  # anpassen --------------------------------------------------------
  printf "label={code:$scriptname},%% Label \n"                      >> ../$file
  printf "]{$code/$i}%% ext. file\n\n"                               >> ../$file
  echo "\newpage"                                                    >> ../$file
done

printf "\section{Latex}\label{latexscripte}\n"               >> $file
printf "%% ------\n\n"                                       >> $file

# quellcode Latex
# anpassen --------------------------------
cd ../$content 
for i in *.tex; do               
	# Dateiname ohne Endung
	scriptname=`basename "$i" .tex` # anpassen
  # latex quellcode
	printf "\subsection{$scriptname}\n"                                >> ../$file
	printf "%% ---------\n\n"                                          >> ../$file
	echo "(Programm~\ref{code:$scriptname} $i)."                       >> ../$file
  printf "%%\n"                                                      >> ../$file
  # anpassen --------------------------------------------------------
  printf "\lstset{language=[LaTeX]TeX}%% C, [LaTeX]TeX, Bash, Python\n"    >> ../$file   
  printf "\lstinputlisting[numbers=left, frame=l, framerule=0.1pt,%%\n"  >> ../$file
  printf "caption={Quellcode in LaTeX, $i},%% Caption\n"              >> ../$file
  # anpassen --------------------------------------------------------
  printf "label={code:$scriptname},%% Label \n"                      >> ../$file
  printf "]{$content/$i}%% ext. file\n\n"                               >> ../$file
  echo "\newpage"                                                    >> ../$file
done
cd ..

echo "fertig"
