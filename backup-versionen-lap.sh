#!/bin/bash -e
# Letztes Update: 13-Feb-2019
# lap ubuntu jan Versionen erstellen 

# sudo Rechte notwendig!

# Backupversionen erstellen 
# /etc
# /root
# /var/www/html
# /home/jan/.ssh
# /home/jan/
#     experimente hackingSecurity raspi tex c mikrocontroller ubuntu



# variable
TIMESTAMP=$(date +%F)
HOST=$(hostname)
USER=jan  # whoami 
WORK="/media/$USER/virtuell/archiv/$HOST"

echo "Sicherungsordner erstellen, wenn nicht vorhanden"
if [ ! -d $WORK ]; then mkdir -p $WORK; fi
cd $WORK

# versionen erstellen nach Datum: 2019-02-13/

# Sicherungsordner: /etc
NAME="etc"
BACKUP_DIR="./$NAME-version-$HOST/$TIMESTAMP"    # akt. Ordner
if [ ! -d $BACKUP_DIR ]; then mkdir -p $BACKUP_DIR; fi
tar cvfz $BACKUP_DIR/$NAME.tar.gz /$NAME

# Sicherungsordner: /root
NAME="root"
BACKUP_DIR="./$NAME-version-$HOST/$TIMESTAMP"    # akt. Ordner
if [ ! -d $BACKUP_DIR ]; then mkdir -p $BACKUP_DIR; fi
tar cvfz $BACKUP_DIR/$NAME.tar.gz /$NAME

# Sicherungsordner: /var/www/html
NAME="html"
BACKUP_DIR="./$NAME-version-$HOST/$TIMESTAMP"    # akt. Ordner
if [ ! -d $BACKUP_DIR ]; then mkdir -p $BACKUP_DIR; fi
tar cvfz $BACKUP_DIR/$NAME.tar.gz /var/www/$NAME

# Sicherungsordner: /home/jan/.ssh
NAME="ssh"
BACKUP_DIR="./$NAME-version-$HOST/$TIMESTAMP"    # akt. Ordner
if [ ! -d $BACKUP_DIR ]; then mkdir -p $BACKUP_DIR; fi
tar cvfz $BACKUP_DIR/$NAME.tar.gz /home/$USER/.$NAME

# Sicherungsordner: /home/jan/...
# Array anlegen
ARRAY_DIR=('experimente' 'hackingSecurity' 'raspi' 'tex' 'c' 'mikrocontroller' 'ubuntu')
# Array lesen
for NAME in ${ARRAY_DIR[@]}; do
  #echo $NAME
  BACKUP_DIR="./$NAME-version-$HOST/$TIMESTAMP"    # akt. Ordner
  if [ ! -d $BACKUP_DIR ]; then mkdir -p $BACKUP_DIR; fi
  tar cvfz $BACKUP_DIR/$NAME.tar.gz /home/$USER/$NAME
done

cd

# rechte
chmod 700 $WORK; chown -R $USER.root $WORK;

# /tmp löschen
rm -rf /tmp/*

###
echo "------------------------------"
echo "  +++ fertig +++"
echo "  +++ Work: ls $WORK"
ls $WORK
# variable
NAME="root"
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
