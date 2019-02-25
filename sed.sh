#!/bin/bash -e
# Letztes Update: 15-Feb-2019

# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
# loeschen:            sed -i '/suchen/d' "$i"


# ANPASSEN
codelanguage=Bash      # HTML5, Python, Bash, C, C++, [LaTeX]TeX


# Variable
tex_pandoc="tex-pandoc"
html="html"
html_wp="html-wp"

# ---------------------------
echo "+++ sed - html5"
cd $html
for i in *.html; do
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '/---/ s//-/g' "$i"
	sed -i 's/<embed/<img/g' "$i"
	sed -i '/"img/ s//"..\/img/g' "$i"
	sed -i '/.pdf/ s//.jpg/g' "$i"
done

# ---------------------------
echo "+++ sed - Wordpress"
cd ../$html_wp
for i in *.html; do
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '/---/ s//-/g' "$i"
	sed -i 's/<embed/<img/g' "$i"
	sed -i '/"img/ s//"..\/img/g' "$i"
	sed -i '/.pdf/ s//.jpg/g' "$i"
done

# ---------------------------
echo "+++ sed - Latex"
cd ../$tex_pandoc
for i in *.tex; do
	# Abbildung
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '/\\caption/d' "$i"
	sed -i '/\\begin{figure}/ s//\\begin{figure}\[!hp\]% hier/g' "$i"
	sed -i '/\\includegraphics/ s/$/\n	% ---------------------------\n	\\caption[ ]{ } % Caption\n	%\\label{pic:}	% Referenz\n	% ---------------------------/g' "$i"
	sed -i '/\\centering/ s//	\\centering/g' "$i"
	sed -i '/\\includegraphics/ s//	\\includegraphics[width=0.8\\textwidth]/g' "$i"
	sed -i '/siehe pic. / s//% Bild Referenz\n(\\autoref{pic: } ). % Bildverweis = /g' "$i"

	# Tabellen
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '/\\strut/ s///g' "$i"
	sed -i '/\\end{minipage}/ s///g' "$i"
	sed -i '/@{}/ s///g' "$i"
  sed -i '/\[c\]/ s///g' "$i"
	sed -i '/\\begin{longtable}/ s//% Tabelle \n\\begin{tabular} /g' "$i"
	sed -i '/\\endhead/d' "$i"
  sed -i '/^\\begin{tabular}/ s//\\begin{table}[!hp] % hier \n	\\centering \n	%\\setlength{\\tabcolsep}{5mm} % Spaltenlänge fest \n	\\rowcolors{1}{}{lightgray!20}  % Farbe  \n	%\\begin{tabularx}{\\textwidth}{XX} % auto. Spaltenumbruch \n\	\\begin{tabular}/g' "$i"
	sed -i '/\\toprule/ s//	\\toprule % Inhalt \n	% ----------------------- /g' "$i"
	sed -i '/tabularnewline/ s//\\/g' "$i"
	sed -i '/\\midrule/ s//	\\midrule/g' "$i"
	sed -i '/\\bottomrule/ s//	\\bottomrule\n	%\\end{tabularx} \n	\\end{tabular}/g' "$i"
	sed -i '/\\end{longtable}/ s//	\\caption[ ]{ }	% Caption \n	%\\label{tab: }	% Referenz \n	%----------------------------- \n\\end{table}/g' "$i"
	#sed -i '/siehe tab./ s/$/ % Referenz\n/g' "$i"
	sed -i '/siehe tab. / s//(\\autoref{tab: } ). % Tabellenverweis = /g' "$i"

	# Loeschen
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '/\\begin{minipage}/d' "$i"
	sed -i '/\\strut\\end{minipage}/ s///g' "$i"

	# Quellcode
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i "/\\\\begin{verbatim}/ s//% Quellcode \n\\\\lstset{language=$codelanguage} % C, [LaTeX]TeX, Bash, Python \n\\\\begin{lstlisting}[numbers=left, frame=l, framerule=0.1pt,% \n% ----------------------------- \n	caption={ }, % Caption \n	label={code: }  % Label \n]% ---------------------------= \n/g" "$i"
	sed -i '/\\end{verbatim}/ s//\\end{lstlisting}/g' "$i"
	sed -i '/siehe code./ s/$/ /g' "$i"
	sed -i '/siehe code. / s//(\\autoref{code: } ). % Codeverweis = /g' "$i"
	# Quellcode - Ausgabe
	sed -i '/siehe ausgabecode./ s/$/ /g' "$i"
	sed -i '/siehe ausgabecode. / s//(\\autoref{code: } ). % Codeverweis = /g' "$i"

	# Literaturangaben
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '/siehe lit./ s/$/}.	%% Literaturangabe/g' "$i"
	sed -i '/siehe lit. / s//siehe~\\cite{/g' "$i"

	# listen
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '/\\tightlist/d' "$i"
	sed -i '/\\def\\labelenumi{\\arabic{enumi}.}/d' "$i"
	sed -i '/\\begin{itemize}/ s//\\begin{itemize}% Liste Punkt/g' "$i"
	sed -i '/\\end{itemize}/ s//\\end{itemize}/g' "$i"
	sed -i '/\\begin{enumerate}/ s//\\begin{enumerate}% Liste 1) oder a)/g' "$i"
	sed -i '/\\end{enumerate}/ s//\\end{enumerate}/g' "$i"

	# Fileanfang
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '1i%--------------------------' "$i"
	sed -i '1a% \\section{ }' "$i"
	sed -i '2a% \\subsection{ }\\label{ }\\index{ }' "$i"
	sed -i '3a%--------------------------\n' "$i"
	# Fileende
	echo "%-----------------------------" >> "$i"


	# Umlaute im Label
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '/uxfc/ s//ue/g' "$i"
	sed -i '/uxf6/ s//oe/g' "$i"
	sed -i '/uxe4/ s//ae/g' "$i"
	sed -i '/uxdf/ s//ss/g' "$i"
	sed -i '/---/ s//-/g' "$i"

	# Mathe
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '/\\(/ s//$/g' "$i"
	sed -i '/\\)/ s//$/g' "$i"
	# \textbackslash{} - \
	sed -i '/\\textbackslash{}/ s//\\/g' "$i"
	# \textgreater{} - >
	sed -i '/\\textgreater{}/ s//>/g' "$i"

	# Anführungszeichen
	# suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
	# loeschen:  sed -i '/suchen/d' "$i"
	sed -i '/``/ s//\\frqq /g' "$i"
	sed -i "/''/ s//\\\\flqq\\\\,/g" "$i"
done
cd ..

echo "fertig"
