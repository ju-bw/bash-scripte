#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# lap ubuntu jan /home sichern

# Daten Synchronisieren
# /home/jan
# /media/jan/virtuell/backup/lap/jan-backup-lap/

# Voraussetzung
# SSD-virtuell einhängen
# sudo Rechte

# variable
TIMESTAMP=$(date +%F)
HOST=$(hostname)
USER=jan  # whoami 
QUELLE="/home/$USER/"
ZIEL="/media/$USER/virtuell/backup/$HOST/$USER-backup-$HOST/"
FILE="/home/$USER/ubuntu/rsync.lap"

echo "Sicherungsordner erstellen, wenn nicht vorhanden"
if [ ! -d $ZIEL ]; then mkdir -p $ZIEL; chmod 700 $ZIEL; chown -R jan.root $ZIEL; fi

echo "+++ Backup - $HOST - $USER - $TIMESTAMP - script +++"

echo "+++ rsync +++"
# jan lap sichern
# Win10: rsync - Dateisystem: NTFS (--no-perms --no-owner --no-group)
rsync -avupEh --delete --exclude-from=$FILE $QUELLE $ZIEL   

echo ""
echo "+++ fertig +++"
echo "------------------------"
echo "Host:   $HOST"
echo "User:   $USER"
echo "Quelle: $QUELLE"
echo "Ziel:   $ZIEL"  
echo "------------------------"

# vi Zeilennummer
# set nu    # an
# set nonu  # aus

# Vollzugriff auf Eigentümer (4+2+1 = 7). kein Zugriff (0) für Gruppe u. Gast:
# chmod 700 *.sh

# Script überall ausführbar machen
# cp -Rp *.sh /usr/local/bin/
# chown -R jan.root /usr/local/bin/
# script.sh oder bash sript.sh
