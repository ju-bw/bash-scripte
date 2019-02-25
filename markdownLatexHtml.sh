#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# Markdown --> Latex & HTML5 & Wordpress"

# variable
#work=~/tex/projekt
md="md"
tex_pandoc="tex-pandoc"
html="html"
html_wp="html-wp"

#---------------------------
echo "+++ Markdown --> Latex & HTML5 & Wordpress"
cd $md
for i in *.md; do
	filename=`basename "$i" .md`
	# Latex
	pandoc "$i" -o ../$tex_pandoc/$filename.tex
	# Wordpress
	pandoc "$i" -o ../$html_wp/$filename.html
	# HTML5
	pandoc -s "$i" --to=html5 -o ../$html/$filename.html
done
cd ..

echo "fertig"
