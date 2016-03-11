#!/bin/bash

# script shell permettant un formatage rapide de disque
# 1) existe t-il un parametre en argument ?
# 2) si argument existant alors on continue sinon on sort
# 3) verification du chemin
# 4) si chemin ok alors on continue sinon on sort
# 5) ls sur le disque
# 6) formatage du disque

chemin="$1"

if [ $# = 0 ]; then
	echo "\033[1;33m ARGUMENT MANQUANT \033[0m"
elif [ ! -d "$chemin" ]; then
	echo -e "\033[1;33m NOM DISQUE ??? \033[0m"
else	
	echo "\033[1;33m ######################################\033[0m"
	echo "\033[1;33m ##### FORMATAGE DISQUE * "$1" * #####\033[0m"
	echo "\033[1;33m ######################################\033[0m"

	echo -n "Voulez-vous voir la liste des fichiers Y/N : "
	read reponse

	if [ "$reponse" = "y" ] || [ "$reponse" = "Y" ]; then
		echo "Liste des fichiers :"
		ls -la "$chemin"
	elif [ "$reponse" = "n" ] || [ "$reponse" = "N" ]; then
		echo -n ""
	else echo "Il faut taper Y ou N!! Pas $reponse"
	fi

	echo -n "Voulez-vous formater toute la cle USB Y/N : "
	read formater

	if [ "$formater" = "y" ] || [ "$formater" = "Y" ]; then
		echo "\033[1;33m ##### FORMATAGE EN COURS #####\033[0m"
		rm -rfv "$chemin"
		find -name "*~" -delete "$chemin"
		echo "\033[1;33m ##### FIN FORMATAGE #####\033[0m"
	elif [ "$formater" = "n" ] || [ "$formater" = "N" ]; then
		echo "\033[1;33m ##### ARRET FORMATAGE #####\033[0m"
	else echo "Il faut taper Y ou N!! Pas $formater"
	fi
fi
exit 0
