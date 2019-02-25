#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# lap ubuntu jan 

# Schritt 1) daten-host-zum-server.sh
# lokalen Rechner
# /home/jan/experimente/linux-grundlagen/scripte
#   tar archiv erstellen
#   scripte/ -> ../scripte.tar.gz 
#
# Datenübertragung mit scp vom lokalen Rechner -> Server 

# Schritt 2)  hilfsscript.sh   
# Server
# ssh server login als user
#   ssh raspi
#   ssh kali
#   ssh rootserver
#
# akt. Ordner nach ssh login 
# ls /home/jan
# ./hilfsscript.sh  
#   rsync /home/jan/scripte.tar.gz /root/scripte/
#   rsync /home/pi/scripte.tar.gz /root/scripte/
# cd /root/scripte/
# ./backup-scripte.sh ausführen

# Schritt 3)  daten-server-zum-host.sh
# lokalen Rechner
# Datensynchronisation mit rsync vom Server -> lokalen Rechner 

# -------------------

# Schritt 1) daten-host-zum-server.sh
# lokalen Rechner

# variable
TIMESTAMP=$(date +%F)
HOST=$(hostname)
USER=jan  # whoami 
WORK="/home/jan/experimente/linux-grundlagen/scripte"

#echo "Sicherungsordner erstellen, wenn nicht vorhanden"
#if [ ! -d $WORK ]; then mkdir -p $WORK; fi
cd $WORK

# alles packen
tar cvfz ../scripte.tar.gz .
echo "------------------------"
echo "+++ Archiv angelegt: scripte.tar.gz"
echo "+++ Datenübertragung mit scp vom lokalen Rechner -> Server +++"
# Kopieren
# scp -P 22 file.tar.gz ip:/ordner
echo "+++ $HOST -> kali:/home/$USER"
scp ../scripte.tar.gz kali:/home/$USER
echo "+++ $HOST -> rootserver:/home/$USER"
scp ../scripte.tar.gz rootserver:/home/$USER
echo "+++ $HOST -> raspi:/home/pi"
scp ../scripte.tar.gz raspi:/home/pi

echo "+++ fertig +++"
echo "+++ nächster Schritt"
echo "+++ ssh server login als user"
echo "+++    ssh raspi"
echo "+++    ssh kali"
echo "+++    ssh rootserver"
echo "+++ Schritt 2)  hilfsscript.sh "
echo "------------------------"

# HINWEIS
# vi Zeilennummer
# set nu    # an
# set nonu  # aus

# Vollzugriff auf Eigentümer (4+2+1 = 7). kein Zugriff (0) für Gruppe u. Gast:
# chmod 700 *.sh

# Script überall ausführbar machen
# cp -Rp *.sh /usr/local/bin/
# chown -R jan.root /usr/local/bin/
# script.sh oder bash sript.sh
