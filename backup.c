/***
	ju -- https://bw1.eu -- 17-Jan-19  -- backup.c
	Prgrammauswahl -- Linux-Systembefehle im C-Programm ausführen
***/

#include <stdio.h>
#include <stdlib.h> //system("ls");
//#include <math.h>
//#include <string.h> 			//stpcpy

int main(void) {
  int aktion = 0;

	//system("sleep 10"); // Warten 10s

	system("clear");
  printf("\nBackup (~/tex) - Auswahl:\n");
  printf("=========================\n\n");
  do {
		system("date +'%Y-%h-%d_%H:%M'");
    printf("\n");
		printf(" * rsync                      --> 1 eingeben\n");
		printf(" * zip    - Archiv erstellen? --> 2 eingeben\n");
		printf(" * tar.gz - Archiv erstellen? --> 3 eingeben\n");
    printf(" * beenden?                   --> 4 eingeben\n\n");
		printf(" Eingabe: ");
    scanf("%d",&aktion);
    switch(aktion) {
		case 1:
			/* rsync erstellen */
			system("clear");
			// rsync quelle ziel
			system("rsync -avpEh --delete ./ /media/jan/virtuell/backup/lap/jan-backup-lap/tex/projekt/");
			printf("rsync - fertig");
		  break;

		case 2:
			/* zip erstellen */
			system("clear");
			// zip	ziel quelle
			system("rm -rf /media/jan/virtuell/archiv/lap/work/*-tex-projekt.zip");
			system("zip -r /media/jan/virtuell/archiv/lap/work/$(date +'%Y-%h-%d')-tex-projekt.zip ./");
			printf("projekt-zip-Archiv wurde erstellt.");
		  break;

		case 3:
			/* tar.gz erstellen */
			system("clear");
			system("tar cvzf /media/jan/virtuell/archiv/lap/work/$(date +'%Y-%h-%d')-tex-projekt.tar.gz ./");
			printf("projekt-tar.gz-Archiv wurde erstellt.");
		  break;

		default:
      /*beenden*/
      printf("\n");
    }
  }
  while(aktion==1 || aktion==2 || aktion==3);

	//printf("\nBeenden mit Enter...\n\n");
	getchar(); //Speicherkontrolle, haelt Programm im RAM
	//system("PAUSE");
	return 0;
}
