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

# Schritt 3)  daten-server-zum-host.sh  # lokalen Rechner
# Datensynchronisation mit rsync vom Server -> lokalen Rechner 


#-----------------------------

# Schritt 2)  hilfsscript.sh   
# Server

# variable
# variable
TIMESTAMP=$(date +%F)
HOST=$(hostname)
USER=jan  # whoami 

# ssh server login als user
# ls /root/scripte
ORDNER="/root/scripte"
# prüfen
if [ ! -d $ORDNER ]; then mkdir -p $ORDNER; fi

# akt. Ordner nach ssh login = /home/jan/

#-------------------------

if [ ! -f scripte.tar.gz ]; then 
  echo "------------------------"
  echo "+++ kein Archiv vorhanden: scripte.tar.gz"
  echo "+++ Schritt 1) daten-host-zum-server.sh # vom lokalen Rechner "
  echo "------------------------"
else
  mv scripte.tar.gz /root/
  cd /root
  #mkdir scripte/ oder 
  rm -rf scripte/*
  mv scripte.tar.gz scripte/
  cd scripte/
  echo "Archiv entpacken"
  tar xvfz scripte.tar.gz  # entpacken 
  rm scripte.tar.gz        # löschen

  # rechte
  echo "+++ Rechte"
  find . -type d -exec chmod -R 755 {} +      # ordner
  find . -type f -exec chmod -R 644 {} +      # files
  find . -name '*.sh' -exec chmod -R 744 {} + # bash scripte
  chown -R root.root .

  # Scripte überall ausführbar machen
  #chown -R root.root /usr/local/bin/
  cp -Rp *.sh /usr/local/bin/

  echo "+++ fertig +++"
  echo "------------------------"
  echo "+++ nächster Schritt"
  echo "+++ cd /root/scripte/"
  echo "+++ scripte: backup-versionen-*.sh und serverUpdate.sh"
  echo "+++ Schritt 3)  daten-server-zum-host.sh  # lokalen Rechner"
  echo "------------------------"
fi



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
