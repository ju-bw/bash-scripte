#!/bin/bash -e
# Letztes Update: 15-Feb-2019
# lap ubuntu jan Rechte

# variable
TIMESTAMP=$(date +%F)
HOST=$(hostname)
USER=jan  # whoami 
VERZ_HOME="/home/jan/"
VERZ_ROOT="/root/"
VERZ_BIN="/usr/local/bin/"
VERZ_BACKUP="/media/jan/virtuell/backup/"
VERZ_ARCHIV="/media/jan/virtuell/archiv/"
VERZ_ISO="/media/jan/virtuell/iso/"
VERZ_LW="/media/jan/virtuell/lw/"

echo "+++ Rechte - $HOST - $USER - $TIMESTAMP - script +++"

# code
echo "+++ Rechte werden geändert. ..."
# lap
cd $VERZ_HOME
find . -type d -exec chmod -R 755 {} +      # ordner
find . -type f -exec chmod -R 644 {} +      # files
find . -name '*.sh' -exec chmod -R 744 {} + # bash scripte
find . -name '*.x' -exec chmod -R 744 {} +  # c++
# ausnahme sonderrechte
find .ssh -type d -exec chmod -R 700 {} +   # .ssh
find .ssh -type f -exec chmod -R 600 {} +   # .ssh
cd $VERZ_BACKUP
find . -type d -exec chmod -R 700 {} +      # ordner
find . -type f -exec chmod -R 600 {} +      # files
cd $VERZ_ARCHIV
find . -type d -exec chmod -R 700 {} +      # ordner
find . -type f -exec chmod -R 600 {} +      # files
cd $VERZ_ISO
find . -type d -exec chmod -R 755 {} +      # ordner
find . -type f -exec chmod -R 644 {} +      # files
cd $VERZ_LW
find . -type d -exec chmod -R 755 {} +      # ordner
find . -type f -exec chmod -R 644 {} +      # files
# zugriffsrechte
chown -R jan.jan $VERZ_HOME
chown -R root.root $VERZ_ROOT
chown -R jan.root $VERZ_BACKUP
chown -R jan.root $VERZ_ARCHIV
chown -R jan.root $VERZ_BIN # bash scripte
cd

echo "+++ fertig +++"
echo "------------------------"
echo "Host:   $HOST"
echo "User:   $USER"
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
