#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# Projekt Web & Latex Ubuntu

# ANPASSEN
# main-book.tex           >> pdfname, Kapitel
# main-print.tex          >> pdfname, Kapitel
# main-artikel.tex        >> pdfname, Kapitel
# main-light.tex          >> pdfname, Kapitel
# projekt.sh              >> pdfname
# scripte/pdfErstellen.sh >> pdfname
# scripte/pdfVersionen.sh >> pdfname
# scripte/sed.sh          >> codelanguage


# Variable
#work=~/tex/projekt
pdfname="Vorlage-Latex-Ubuntu"
projekt="$pdfname-projekt"
info="Projekt Web & Latex Ubuntu"
file="git-log.txt"
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

# -----------------------
echo "+++ Verz. erstellen, wenn nicht vorhanden"
if [ ! -d ./$html ];            then mkdir -p ./$html; fi
if [ ! -d ./$html_wp ];         then mkdir -p ./$html_wp; fi
if [ ! -d ./$tex ];             then mkdir -p ./$tex; fi
if [ ! -d ./$archiv ];          then mkdir -p ./$archiv; fi
if [ ! -d ./$tex_pandoc ];      then mkdir -p ./$tex_pandoc; fi
if [ ! -d ./$img_in/kap ];      then mkdir -p ./$img_in/kap; fi
if [ ! -d ./$img_out ];         then mkdir -p ./$img_out; fi
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

# ---------------------------
janein=1
while [ "$janein" -eq 1 ]; do
	clear
	printf "\n $info \n"
	printf "\n  1) Markdown in (tex, html5) - sed (Suchen/Ersetzen)"
	printf "\n  2) Kopie tex (Pandoc) - tex (Handarbeit)"
	printf "\n  3) Kapitel erstellen, Scripte ausführen"
	printf "\n  4) TEST: PDF erstellen mit pdflatex (book.pdf)"
	printf "\n  5) TEST: PDF erstellen mit latexmk (book.pdf & artikel-light)"
	printf "\n  6) PDFs erstellen (book-, print-, artikel.pdf) - Archiv (tex)"
	printf "\n  7) Projekt aufräumen  (ACHTUNG: Auswahl 1 bis 6 erfordert Script-Neustart)"
	printf "\n  8) Git-Version (tex & md, ACHTUNG: wenn Projekt neu, dann git init bzw. rm -rf .git)" 
	printf "\n  9) Fotos optimieren (Web, Latex)"
	printf "\n 10) PDF-Versionen erstellen"
	printf "\n 11) Backup (archiv/*.zip & *.tar.gz) & (/media/jan/virtuell/backup)"
	printf "\n 12) Beenden?"
	a=
	while [ -z "$a" ]; do
		printf "\n\nGeben Sie eine Zahl ein: "
		read a
		# Zeichenketten eliminieren ,die Zeichen ausser 0-9  enthalten
		a=${a##*[^0-9]*}
		if [ -z "$a" ]; then
			echo "+++ Ungueltige Eingabe"
		fi
	done

	echo "--------------------------"
	printf "\n"

	# --------------------
	if [ $a -eq 1 ]; then
		# Markdown in (tex, html5) - sed (Suchen/Ersetzen)
		# Scriptaufruf
		./$scripte/markdownLatexHtml.sh
		./$scripte/sed.sh

  # --------------------
	elif [ $a -eq 2 ]; then
		# Kopie tex (Pandoc) - tex (Handarbeit)
		# -u	überspringt Dateien, die im Ziel neuer sind als in der Quelle
		rsync -avupEh $tex_pandoc/ $tex
 
  # --------------------
	elif [ $a -eq 3 ]; then
		# Kapitel erstellen, Scripte ausführen
		# Scriptaufruf
		./$scripte/inputImgMarkdown.sh
		./$scripte/inputKapitelLatex.sh
		./$scripte/inputPdfsLatex.sh
		./$scripte/projektFiles.sh
		./$scripte/projektInhalt.sh

  # --------------------
	elif [ $a -eq 4 ]; then
		# TEST: PDF erstellen mit pdflatex (book.pdf)
		# pdflatex
		pdflatex main-book.tex
		#Literatur
		biber main-book
		# Index
		#texindy -g --module ff-ranges-only main-book.idx
		# IndexKonfig.xdy
		#xindy -L german-din -I latex --module IndexKonfig main-book.idx
		pdflatex main-book.tex
		pdflatex main-book.tex

		# Latex aufraeumen
		rm -f *~ *.aux *.bbl *.blg *.fls *.log *.nav *.out *.snm *.synctex *.toc \
		  *.idx *.ilg *.ind *.thm *.lof *.lol *.lot *.nlo *.run.xml *blx.bib *.bcf

  # --------------------
	elif [ $a -eq 5 ]; then
		# TEST: PDF erstellen mit latexmk (artikel-light)
		# latexmk
		latexmk -f -pdf main-light
		# Latex aufraeumen
		rm -f *~ *.aux *.bbl *.blg *.fls *.log *.nav *.out *.snm *.synctex *.toc \
		  *.idx *.ilg *.ind *.thm *.lof *.lol *.lot *.nlo *.run.xml *blx.bib *.bcf

  # --------------------
	elif [ $a -eq 6 ]; then
		# PDFs erstellen (book-, print-, artikel.pdf) - Archiv (tex)
		# Scriptaufruf
		./$scripte/pdfErstellen.sh

  # --------------------
	elif [ $a -eq 7 ]; then
		# Projekt aufräumen  (ACHTUNG: Auswahl 1 bis 6 erfordert Script-Neustart)
		rm -rf *~  main*.pdf  
		rm -rf Projekt-Inhalt.txt Input*.txt main-light.fdb_latexmk
		# löschen img_in u. img_out
		if [ `ls -a  $img_in | wc -l` -gt 2 ]; then rm -rf $img_in/*; fi
		if [ `ls -a  $img_out | wc -l` -gt 2 ]; then rm -rf $img_out/*; fi
		# löschen   tex/ tex-pandoc/  html/  html-wp/ img-in/ img-out/
		if [ -d $tex ]; then rm -rf $tex; fi
		if [ -d $tex-pandoc ]; then rm -rf $tex_pandoc; fi
		if [ -d $html ]; then rm -rf $html; fi
		if [ -d $html_wp ]; then rm -rf $html_wp; fi
		if [ -d $img_in ]; then rm -rf $img_in; fi
		if [ -d $img_out ]; then rm -rf $img_out; fi
		
		# Latex aufraeumen
		if [ -e main-book.aux ]; then
			rm -f *~ *.aux *.bbl *.blg *.fls *.log *.nav *.out *.snm *.synctex *.toc \
			  *.idx *.ilg *.ind *.thm *.lof *.lol *.lot *.nlo *.run.xml *blx.bib *.bcf
		fi

	# --------------------
  elif [ $a -eq 8 ]; then	
		# Git-Version (tex & md, ACHTUNG: wenn Projekt neu, dann git init bzw. rm -rf .git)
		# Repository notizenDummy-v02 von Github downloaden
    # git clone https://github.com/ju-bw/notizenDummy-v02.git .
    # neues Repository auf github anlegen
    # https://github.com/new
    # github: Create a new repository
    # Repository name = notizenDummy-v02
    # Shell: Git Befehle
    # ".gitconfig", ".gitignore" konfigurieren und erstellen
    #git init
    git add .
    #git commit -am "Projekt start"
    git commit -a # editor
    #git remote add origin https://github.com/ju-bw/notizenDummy-v02.git
    #git push -u origin master 
    git status
    #git pull
    #git push
    #git log --oneline  # less beenden mit <Shift+q>
    #git log --graph --oneline 
    git log --graph --pretty=format:";  %cn;  %h;  %ad;  %s" --date=relative > $file
		cp -Rp $file $pdfname/
		cp -Rp .gitignore $pdfname/

	# --------------------
	elif [ $a -eq 9 ]; then
		# Fotos optimieren (Web, Latex)
		# Scriptaufruf
		./$scripte/optiWebLatex.sh

	# --------------------
	elif [ $a -eq 10 ]; then
		# PDF-Versionen erstellen
		# Scriptaufruf
		./$scripte/pdfVersionen.sh

	# --------------------
	elif [ $a -eq 11 ]; then
		# Backup (archiv/*.zip & *.tar.gz) & (/media/jan/virtuell/backup)
		echo "+++ Backup (archiv/*.zip & *.tar.gz)"
		cd $pdfname
		tar cvzf ../$archiv/$pdfname.tar.gz .
		rm -rf ../$archiv/$pdfname.zip
		zip -r ../$archiv/$pdfname.zip .
		cd ..
		# projektordner
		echo "+++ Backup (/media/jan/virtuell/backup)"
		rsync -avpEh --delete ./ /media/jan/virtuell/backup/lap/jan-backup-lap/tex/projekt/
		echo "fertig"

	# --------------------
	else
		echo "+++ $info"
		echo "fertig"; break
	fi
done
