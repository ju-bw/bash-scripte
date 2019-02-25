#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# Suchen und Ersetzen in img/

# - Umlaute
# - Unterstrich
# - Leerzeichen
# - Img

# Variable
#work=~/tex/projekt
img="img-out"
info="Suchen und Ersetzen - Umlaute, Unterstrich, Leerzeichen, Img"
timestamp=$(date +"%Y-%h-%d_%H:%M")
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju -- https://ju1.eu -- Letztes Update: $timestamp_2"

# -----------------------------
echo "+++ $info"

# 's/suchen/ersetzen/g'

cd $img
# Umlaute
find . -name "*"  -exec rename 's/ü/ue/g' {} +
find . -name "*"  -exec rename 's/ä/ae/g' {} +
find . -name "*"  -exec rename 's/ö/oe/g' {} +
find . -name "*"  -exec rename 's/Ü/ue/g' {} +
find . -name "*"  -exec rename 's/Ä/ae/g' {} +
find . -name "*"  -exec rename 's/Ö/oe/g' {} +
find . -name "*"  -exec rename 's/ß/ss/g' {} +
# Unterstrich
find . -name "*"  -exec rename 's/_/-/g'  {} +
# Leerzeichen
find . -name "*"  -exec rename 's/ //g'   {} +
# Img
find . -name "*.JPG"  -exec rename 's/.JPG/.jpg/g'  {} +
find . -name "*.jpeg" -exec rename 's/.jpeg/.jpg/g' {} +

cd ..

echo "fertig"
