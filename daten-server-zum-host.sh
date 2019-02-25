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

#-----------------------------

# Schritt 3)  daten-server-zum-host.sh
# lokalen Rechner

# server test
#IP="rootserver.blackwolf.eu"
#IP="kali"
#IP="raspi"
#if ! ping -c 1 -w 1 $IP > /dev/null ; then
#	echo "$IP: Offline" 
#else
#	echo "$IP: Online" 
#fi



# Datensynchronisation mit rsync vom Server -> lokalen Rechner 

# variable
QUELLE="/home/backup"
ZIEL="/media/jan/virtuell/archiv"

# Backup - Medium prüfen
if [ ! -d $ZIEL ]; then 
  echo "------------------------"
  echo "+++ kein Backup - Medium vorhanden: $ZIEL"
  echo "+++ Schritt: SSD mounten"
  echo "------------------------"
else
  #-------------
  # raspi IP prüfen
  IP="raspi"
  if ! ping -c 1 -w 1 $IP > /dev/null ; then
    echo "------------------------"
    echo "+++ Server ist offline :( $IP"
    echo "------------------------"
  else
    # raspi
    echo "+++ Server ist online :) $IP"
    HOST="raspi"
    # rsync -av --delete -e ssh user@hostname:/home/quelle /ziel
    rsync -avupEh --delete -e ssh $HOST:$QUELLE/ $ZIEL/$HOST/
  fi
  #-------------
  # kali IP prüfen
  IP="kali"
  if ! ping -c 1 -w 1 $IP > /dev/null ; then
    echo "------------------------"
    echo "+++ Server ist offline :( $IP"
    echo "------------------------"
  else
    # kali
    echo "+++ Server ist online :) $IP"
    HOST="kali"
    # rsync -av --delete -e ssh user@hostname:/home/quelle /ziel
    rsync -avupEh --delete -e ssh $HOST:$QUELLE/ $ZIEL/$HOST/
  fi
  #-------------
  # rootserver IP prüfen
  IP="rootserver.blackwolf.eu"
  if ! ping -c 1 -w 1 $IP > /dev/null ; then
    echo "------------------------"
    echo "+++ Server ist offline :( $IP"
    echo "------------------------"
  else
    # rootserver
    echo "+++ Server ist online :) $IP"
    HOST="rootserver"
    # rsync -av --delete -e ssh user@hostname:/home/quelle /ziel
    rsync -avupEh --delete -e ssh $HOST:$QUELLE/ $ZIEL/$HOST/
  fi
  #-------------
    echo "------------------------"
    echo "+++ Datensynchronisation mit rsync vom Server -> lokalen Rechner "
    echo "+++ fertig +++"
    echo "+++ Kontrolle: $ZIEL"
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
