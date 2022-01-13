#!/bin/bash

LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NO_COLOR='\033[0m'
SCRIPTS=($(find . -type f -name "*.sh" -not -name "link_folders.sh";))
FOLDERS=($(find . -type d -not -path "./.git/**" -not -path "./.git" -not -path ".";))
HOME=/home/$(echo $USER)

printf "${GREEN}Informe a pasta que deseja linkar: ${NO_COLOR}\n"
read DIRNAME

if [ ! -d "$HOME/$DIRNAME" ]
then
    printf "${LIGHT_RED}A pasta não existe. \n${GREEN}Criando pasta em sua Home... ${NO_COLOR}\n"
    mkdir $HOME/$DIRNAME
    printf "${LIGHT_GREEN}Pasta criada com sucesso! ${NO_COLOR}\n"
else
    printf "${LIGHT_GREEN}Pasta já existe! ${NO_COLOR}\n"
fi

printf "${GREEN}Criando os links . ";
sleep 0.3
printf ". "
sleep 0.3
printf ". "
sleep 0.3
printf ". "
sleep 0.3
printf ". ${NO_COLOR}\n"

for FILE in "${SCRIPTS[@]}"
do
    printf "${GREEN}Linking $(basename $FILE) ... ${NO_COLOR}\n"
    printf "${YELLOW}Executando: ln -s $(pwd)/$(echo $FILE| sed -r 's/^.{2}//') $HOME/$DIRNAME/$(basename $FILE) ${NO_COLOR}\n"
    ln -s $(pwd)/$(echo $FILE| sed -r 's/^.{2}//') $HOME/$DIRNAME/$(basename $FILE)
done


printf "${LIGHT_GREEN}Tudo pronto!! ${NO_COLOR}\n"

#end of script
