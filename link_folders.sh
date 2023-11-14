#!/bin/bash

#REFATORAR

export $(grep -v '^#' .colors.env | xargs -d '\n')

ENVFILES=($(find . -type f -name "*.env" -not -name ".example.env";))
# Pega todos os arquivos .sh
SCRIPTS=($(find . -type f -name "*.sh" -not -name "link_folders.sh";))
# Adiciona aos SCRIPTS os arquivos .py
SCRIPTS+=($(find . -type f -name "*.py";))

FOLDERS=($(find . -type d -not -path "./.git/**" -not -path "./.git" -not -path ".";))
HOME=/home/$(echo $USER)

printf "${CYAN}Informe a pasta que deseja linkar: ${NO_COLOR}\n"
read DIRNAME

if [ ! -d "$HOME/$DIRNAME" ]
then
    printf "${LT_RED_BGD}A pasta não existe. \n\n${CYAN}Criando a pasta em sua Home... ${NO_COLOR}\n"
    mkdir $HOME/$DIRNAME
    printf "${LT_GREEN_BLD}Pasta criada com sucesso! ${NO_COLOR}\n"
else
    printf "${LT_BLUE_BLD}Pasta já existe! Vamos criar os Links!! ${NO_COLOR}\n"
fi

clear

printf "${CYAN_BGD}Criando os links . ";
sleep 0.3
printf ". "
sleep 0.3
printf ". "
sleep 0.3
printf ". "
sleep 0.3
printf ". ${NO_COLOR}\n"

printf "${CYAN_BLD}Criando link dos arquivos de ambiente...${NO_COLOR}\n"
for FILE in "${ENVFILES[@]}"
do
    printf "${GREEN}Linking $(basename $FILE) ... ${NO_COLOR}\n"
    printf "${YELLOW}Executando: ln -s $(pwd)/$(echo $FILE| sed -r 's/^.{2}//') $HOME/$(basename $FILE) ${NO_COLOR}\n"
    # VERIFICAR SE LINK JA EXISTE
        # SIM
    # printf "Link já existe"
        # NAO
    ln -s $(pwd)/$(echo $FILE| sed -r 's/^.{2}//') $HOME/$(basename $FILE)
done

printf "${CYAN_BLD}Criando link dos scripts...${NO_COLOR}\n"
for FILE in "${SCRIPTS[@]}"
do
    printf "${GREEN}Linking $(basename $FILE) ... ${NO_COLOR}\n"
    printf "${YELLOW}Executando: ln -s $(pwd)/$(echo $FILE| sed -r 's/^.{2}//') $HOME/$DIRNAME/$(basename $FILE) ${NO_COLOR}\n"
    # VERIFICAR SE LINK JA EXISTE
        # SIM
    # printf "Link já existe"
        # NAO
    ln -s $(pwd)/$(echo $FILE| sed -r 's/^.{2}//') $HOME/$DIRNAME/$(basename $FILE)
done


printf "${LT_GREEN}Tudo pronto!! ${NO_COLOR}\n"

#end of script
