#!/bin/bash -e
# chmod a+x
# Copyright Jan Unger, Wuppertal
# erstellt: 24.06.17
# update:   9-Nov-18
#=============================

# Variablen ANPASSEN
#=============================
info="Info: Backup: rsync rasPi <-> lap"
# Projektworkeichnis
work=raspi
user_lap=jan # jan@ubuntu-lap
user_rpi=pi  # pi@raspi
home=home

#IP-Adressen: 
# $ ip addr
ip_lap=192.168.178.59 # wlan 192.168.178.72
ip_rpi=192.168.178.60 # wlan 192.168.178.61

file_rpi=rsync.excludes #Ausnahmedateien
log=error.log           #Fehler

# Zeit
timestamp=$(date +"%Y-%h-%d_%H:%M")
copyright="Copyright Jan Unger, Wuppertal"

#=============================
#clear

echo $info

# PATH: Aktuellen Ordner hinzufügen: erlaubt $ progname.x auszuführen
#PATH=$PATH:.
#export PATH 

host=$(hostname)
echo '  * Host: ' $host
user=$(whoami)
echo '  * User: ' $user
ip=$(ip addr | awk '/inet.[0-9]/&&!/127.0.0.1/ {print $2}')
echo '  * IP: ' $ip
os=$(lsb_release -a)
echo '  * OS: ' $os

echo "* Aufraeumen ..."
#Loescht backupdateien ~
sudo find . -name "*~" -exec rm  {} +
sudo find . -name "*.~" -exec rm  {} +

echo "* Berechtigungen ..."
# Berechtigungen fuer Dateien & Verzeichnisse setzen
sudo find . -type d -exec chmod 775 {} +
sudo find . -type f -exec chmod 664 {} +

echo "* Scripte *.sh u. *.py ..."
# scripte ausfuehrbar machen
sudo find . -name "*.sh"  -exec chmod 774 {} +
sudo find . -name "*.py"  -exec chmod 774 {} +

# Backup, Fernsteuern
printf "\n\n"
echo "Backup - Auswahl:"
echo "================="
select menu in "rasPi -> lap"     \
							 "lap   -> rasPi"     \
							 "Fernadmin: rasPi"  \
							 "Fernadmin: lap" \
							 "Inhalt-Verzeichnis" \
							 "Work-Verzeichnis auf lap" \
						   "Work-Verzeichnis auf raspi" \
				 "Beenden"
do
	case $REPLY in
		#   rsync --delete --exclude-from=datei -avze ssh -az work1/ username@rechnername:work2/ 2>fehler
		1)  echo "rasPi -> lap" ;
		  	rsync --delete --exclude-from=$file_rpi -avze \
					ssh -az /$home/$user_rpi/$work $user_lap@$ip_lap:/$home/$user_lap 2>$log ;;
		2)	echo "lap -> rasPi" ;
		  	rsync --delete --exclude-from=$file_rpi -avze \
					ssh -az /$home/$user_lap/$work $user_rpi@$ip_rpi:/$home/$user_rpi 2>$log ;
				# web
				sudo rsync -av --delete /home/jan/raspi/pi-kofler/projekt/php/mycode/* /var/www/html/mycode ;
				sudo rsync -av --delete /home/jan/raspi/pi-kofler/projekt/php/www/* /var/www/html/prj ;;
		#   ssh benutzername@rechnername
		3)	ssh $user_rpi@$ip_rpi ; # rpi
				ls ;;
		4)	ssh $user_lap@$ip_lap ; # lap
				ls ;;
		5)	ls -lah ;;              # Inhalt
		6)	cd /$home/$user_lap/$work
				pwd
				printf "\n+++ Gruppe hacker ...\n"
				# gruppe hacker
				# $ sudo addgroup hacker
				sudo find . -type d -exec chown $user_lap.root {} +
				sudo find . -type f -exec chown $user_lap.root {} +
 			  ;;
		7)	cd /$home/$user_rpi/$work
				pwd	
				printf "\n+++ Gruppe hacker ...\n"
				# gruppe hacker
				# $ sudo addgroup hacker
				sudo find . -type d -exec chown $user_rpi.root {} +
				sudo find . -type f -exec chown $user_rpi.root {} +
				;;
		8)	echo "Hasta la vista Baby" ;
			  printf "\n\n"
		  	exit 0 ;;
		*)  echo "Ungueltige Auswahl" 
				printf "\n\n" ;;
	esac
done