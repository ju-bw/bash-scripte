#!/bin/bash -e
# Letztes Update: 13-Feb-2019
# lap ubuntu jan work Versionen erstellen 

# Backupversionen erstellen 
# /home/jan/experimente                
#     linux-grundlagen Netcup-Root-Server-Debian notizen-ubuntu


# variable
TIMESTAMP=$(date +%F)
HOST=$(hostname)
USER=jan  # whoami 
WORK="/media/$USER/virtuell/archiv/$HOST/work"

echo "Sicherungsordner erstellen, wenn nicht vorhanden"
if [ ! -d $WORK ]; then mkdir -p $WORK; fi
cd $WORK

# versionen erstellen nach Datum: 2019-02-13/

# Sicherungsordner: /home/jan/experimente
ORDNER="experimente"
# Array anlegen
ARRAY_DIR=('linux-grundlagen' 'Netcup-Root-Server-Debian' 'notizen-ubuntu')
# Array lesen
for NAME in ${ARRAY_DIR[@]}; do
  #echo $NAME
  BACKUP_DIR="./$NAME-version-$HOST/$TIMESTAMP"    # akt. Ordner
  if [ ! -d $BACKUP_DIR ]; then mkdir -p $BACKUP_DIR; fi
  tar cvfz $BACKUP_DIR/$NAME.tar.gz /home/$USER/$ORDNER/$NAME
done

cd

# rechte
#chmod 700 $WORK; chown -R $USER.root $WORK;

# /tmp löschen
#rm -rf /tmp/*

###
# Sicherungsordner: /home/jan/experimente
#     linux-grundlagen Netcup-Root-Server-Debian notizen-ubuntu
echo "------------------------------"
echo "  +++ fertig +++"
echo "  +++ Work: ls $WORK"
ls $WORK
# variable
NAME="linux-grundlagen"
echo "  +++ Versionen:"
ls $WORK/$NAME-version-$HOST/
# tar
echo "  +++ Archiv: ls $NAME-version-$HOST/$TIMESTAMP"
echo "      entpacken: tar xvfz $NAME.tar.gz"
echo "      ansehen:   tar tf $NAME.tar.gz"
echo "------------------------------"

# vi Zeilennummer
# set nu    # an
# set nonu  # aus

# Vollzugriff auf Eigentümer (4+2+1 = 7). kein Zugriff (0) für Gruppe u. Gast:
# chmod 700 *.sh

# Script überall ausführbar machen
# cp -Rp *.sh /usr/local/bin/
# chown -R jan.root /usr/local/bin/
# script.sh oder bash sript.sh
