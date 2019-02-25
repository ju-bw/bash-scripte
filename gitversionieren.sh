#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# Git versionieren

# Variable
#work=~/tex/projekt
info="Git versionieren"
file="git-log.txt"
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju -- https://ju1.eu -- $timestamp_2"

# ----------------------------
echo "+++ $info"
# code
# Git-Version (tex & md, ACHTUNG: wenn Projekt neu, dann git init bzw. rm -rf .git)
# Repository notizenDummy-v02-Ubuntu von Github downloaden
# git clone https://github.com/ju-bw/notizenDummy-v02-Ubuntu.git .
# neues Repository auf github anlegen
# https://github.com/new
# github: Create a new repository
# Repository name = notizenDummy-v02-Ubuntu
# Shell: Git Befehle
# ".gitconfig", ".gitignore" konfigurieren und erstellen
#git init
git add .
#git commit -am "Projekt start"
git commit -a # editor
#git remote add origin https://github.com/ju-bw/notizenDummy-v02-Ubuntu.git
#git push -u origin master 
git status
#git pull
#git push
#git log --oneline  # less beenden mit <Shift+q>
#git log --graph --oneline 
git log --graph --pretty=format:";  %cn;  %h;  %ad;  %s" --date=relative > $file


echo "fertig"
