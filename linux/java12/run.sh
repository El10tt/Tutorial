#!/bin/bash

#Script par Eliott Bovel - 18/06/2019
#Inspirée par un script de Ryan M

RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\e[93m'
RESET='\033[0m'

JAVA="https://download.oracle.com/otn-pub/java/jdk/12.0.1+12/69cfe15208a647278a19ef0990eea691/jdk-12.0.1_linux-x64_bin.deb"

if [ $(id -u) != 0 ]; then
    echo -e "${RED}Merci de lancer le script avec les droits d'administrateur (root)${RESET}"
    exit
fi

echo "-----------------------------------------------"
echo " "
echo " "
echo -e "${BLUE}Installation automatique d'un serveur Java 12 - Debian 9${RESET}"
echo " "
echo " "
echo -e "• Par Eliott Bovel (${BLUE}El10tt B.#8771${RESET})"
echo " "
echo " "
echo -e "${GREEN}Lancement dans 5 secondes${RESET}"
echo " "
echo " "
echo "-----------------------------------------------"

sleep 1
echo -e "${GREEN}Lancement dans 4 secondes${RESET}"
sleep 1
echo -e "${GREEN}Lancement dans 3 secondes${RESET}"
sleep 1
echo -e "${GREEN}Lancement dans 2 secondes${RESET}"
sleep 1
echo -e "${GREEN}Lancement dans 1 secondes${RESET}"

sleep 1

echo -e "Mise à jour des packets.. (${RED}apt-get update${RESET})"
apt-get update

echo -e "Mise à jour des packets.. (${RED}apt-get upgrade${RESET})"
apt-get update


echo -e "${BLUE}Création d'un dossier d'installation..${RESET} (${RED}java-Installation${RESET})"
mkdir java-Installation
cd java-Installation

echo -e "${BLUE}Téléchargement de Java..${RESET}"
wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" ${JAVA}

echo -e "${BLUE}Installation..${RESET}"
apt install ./jdk-12.0.1_linux-x64_bin.deb
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-12.0.1/bin/java" 0
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-12.0.1/bin/javac" 0
update-alternatives --install "/usr/bin/jar" "jar" "/usr/lib/jvm/jdk-12.0.1/bin/jar" 0

echo -e "${BLUE}Renommer & suppression du dossier d'installation..${RESET}"
cd ..
rm -r java-Installation

echo -e "${YELLOW}Merci de vérifier si la commande fonctionne bien:${RESET}"
java --version

rm "$HOME/run.sh"
echo -e "-------------${GREEN}FIN DE L'INSTALLATION${RESET}-------------"
