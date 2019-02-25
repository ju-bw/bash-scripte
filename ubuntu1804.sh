#!/bin/bash -e
# chmod a+x
# ju -- 23-Jan-19 -- ubuntu1804.sh
#
# Software-Aktualisierung
sudo apt update && sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove && sudo apt autoclean

# Software-Installation im Terminal
#sudo apt update
#sudo apt install name
#sudo apt remove name


sudo apt -y install gimp inkscape ffmpeg vlc #Konverter für Audio-, Video- und Bilddateien
sudo apt -y install gparted


sudo apt -y install gcc g++
sudo apt -y install make 

# gdb - debugger
ulimit -c unlimited
sudo apt -y install systemd-coredump

sudo apt -y install vim-nox
# Texteditoren auswahl - vim.nox
sudo update-alternatives --config editor
#  vi - Konfiguration
#vi ~/.vimrc 

#sudo apt -y install smartmontools hdparm
sudo apt -y install ssh openssh-server
sudo apt -y install dc3dd

# pdf
sudo apt -y install okular qpdfview

# Filezilla
sudo apt -y install filezilla

sudo apt -y install python-dev idle3 scrot imagemagick libimage-exiftool-perl vlc libreoffice

# git
sudo apt -y install git gitk git-gui gitg git-core tig meld kdiff3

# git konfig
git config --global user.name "Jan Unger"
git config --global user.email "info@bw1.eu"
git config --global core.editor "vim"
git config --global color.ui true

# komplette Sicherheitskopie aller Dateien und Verzeichnisse 
sudo cp -a /etc/ /root/etc-bak

# Latex
sudo apt -y install texlive texlive-lang-german texlive-latex-extra texlive-generic-extra texlive-fonts-extra texlive-science
sudo apt -y install texify xindy latexmk cm-super texworks geogebra-gnome biber

## Aktualisierung der Tex-Bibliothek
sudo texhash

#Latex Schriften: bsp.: luximono
#wget http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
#sudo texlua install-getnonfreefonts
#sudo getnonfreefonts-sys --all

# screenshot

Screenshot mit Tastenkombinationen aufnehmen
Statt eine Benutzeroberfläche zur Bildschirmaufnahme zu verwenden, können Sie auch die standardmäßigen Tastenkombinationen benutzen. Die so erstellten Bilder werden standardmäßig in Ihrem persönlichen Benutzerverzeichnis im Unterordner "Bilder" gespeichert.

Mit [Druck] nehmen Sie einen Screenshot auf.
Das aktuelle Fenster fotografieren Sie mit [Alt] + [Druck].
Durch [Shift] + [Druck] können Sie einen aufzunehmenden Bildschirmbereich auswählen.

apt install flameshot

# Pantoc
sudo apt -y install pandoc
#pandoc version
pandoc -v

#schriftart: dejavu
sudo apt -y install ttf-dejavu xmlto 
sudo apt -y install texlive-xetex texinfo pandoc-citeproc calibre



# Files umbenennen
sudo apt install rename

# Netzwerk Scan
sudo apt -y install nmap arp-scan


# diverse Bibliotheken zum Abspielen der wichtigsten Audio- und Video-Formate
sudo apt -y install ubuntu-restricted-extras flashplugin-installer

# System Monitor
sudo apt -y install gir1.2-gtop-2.0 gir1.2-networkmanager-1.0 gir1.2-clutter-1.0

# Google Chrome
#https://www.google.com/chrome

# Editor Atom 
#https://atom.io/


# Visual Studio Code (kurz VSCode)
#https://code.visualstudio.com/download

sudo apt -y install thunderbird

sudo apt -y install arduino

sudo apt -y install texworks



# Gnome Tweaks - Optimierungen
sudo apt -y install gnome-tweaks
#Optimierungen (Gnome Tweaks) im Modul ERSCHEINUNGSBILD die Animationen auf AUS

# Gnome-Shell-Erweiterungen
sudo apt -y install chrome-gnome-shell
#https://extensions.gnome.org



sudo apt install git
git clone https://github.com/daniruiz/Flat-Remix-GNOME-theme
mkdir -p ~/.themes
mv Flat-Remix-GNOME-theme/Flat-Remix ~/.themes

#Gnome-Desktop im Originalzustand verwenden
sudo apt install gnome-session
#Was ist Wayland?
#
#neues Grafiksystem für Linux. Es soll demnächst das Grafiksystem Xorg ablösen
#ein schlankeres System, mehr Stabilität und Performance-Vorteile. 
#Gegenwärtig ist es aber noch nicht komplett ausgereift und mit
#diversen Nachteilen verbunden. Z.B. funktionieren Remote-Desktop-Programme wie
#VNC- oder RDP-Server nicht im Zusammenspiel mit Wayland.

# Statische Netzwerkkonfiguration
#Systemmenü auf KABELGEBUNDEN - LAN-EINSTELLUNGEN - Manuell - IP4
#Adressen: 10.0.0.6
#Netzmaske: 255.255.255.0
#Gateway: 10.0.0.138
#DNS: 8.8.4.4


# H Y D R A
sudo apt-get install libssl-dev libssh-dev libidn11-dev libpcre3-dev libgtk2.0-dev libmysqlclient-dev libpq-dev libsvn-dev firebird-dev
sudo apt install hydra


# Déjà Dup zur Durchführung von Backups
sudo apt -y install duplicity python-gi

# Grsync eine Oberfläche zum beliebten Linux-Kommando rsync
#Grsync

# IPv6-Probleme - Paketverwaltung bleibt hängen
sudo -s
echo 'Acquire::ForceIPv4 "true";' > /etc/apt/apt.conf.d/99disable-ipv6


# Terminal
# Speicherplatzabfragen
free -h
df -h
du -h --max 1 | grep G

# Prozessverwaltung (top, ps, kill)
top
ps ax | grep gnome
kill -9 2725


