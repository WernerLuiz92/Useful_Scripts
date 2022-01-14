#!/bin/bash

# This script needs to be completed.

export $(grep -v '^#' .env | xargs -d '\n')

#Colors
LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NO_COLOR='\033[0m'

function getConnectionName() {
    read -p "-> " CONNECTION_NAME

    echo ${CONNECTION_NAME^^}
}

#Variables
if [ ${1} ]; then
    CONNECTION_NAME=${1^^}
else
    printf "${YELLOW}Enter the name of the connection:${NO_COLOR}\n"
    CONNECTION_NAME=$(getConnectionName)
fi
#Variables names
DEF_HOST_NAME=${CONNECTION_NAME}'_SERVER_HOST'
DEF_PORT_NAME=${CONNECTION_NAME}'_SERVER_PORT'
DEF_USER_NAME=${CONNECTION_NAME}'_SERVER_USER'
DEF_KEY_NAME=${CONNECTION_NAME}'_SERVER_KEY'
DEF_PASSWORD_NAME=${CONNECTION_NAME}'_SERVER_PASSWORD'
#Variables values
HOST=$(eval echo '$'$DEF_HOST_NAME)
PORT=$(eval echo '$'$DEF_PORT_NAME)
PORT=${PORT:-22}
USER=$(eval echo '$'$DEF_USER_NAME)
KEY=$(eval echo '$'$DEF_KEY_NAME)
PASSWORD=$(eval echo '$'$DEF_PASSWORD_NAME)

if [[ -z $HOST ]]; then
    printf "${LIGHT_RED}The connection name ${CONNECTION_NAME} does not exist.${NO_COLOR}\n"
    # Perguntar se deseja definir manualmente

    # Definir manualmente
        # Host
        # Port
        # User
            # Key
            # Password
        
        # Perguntar se deseja salvar
    exit 1
else

    # Se os dados foram definidos corretamente
    echo "The chosen connection name is: ${CONNECTION_NAME}"

    echo "The HOST to the chosen connection is: $HOST"
    echo "The SSH PORT to the chosen connection is: $PORT"
    echo "The USER to the chosen connection is: $USER"
    echo "The KEY path to the chosen connection is: $KEY"

    echo "The SSH command to the chosen connection is: "
        #definir o comando de conexão

            # Se Key
                # Testar se o arquivo existe
                # Verificar se o arquivo tem permissão de 0600
         echo "ssh -i $KEY -p $PORT $USER@$HOST"

        # Se Password
        echo "sshpass -p $PASSWORD ssh -p $PORT $USER@$HOST"
fi

# printf "${GREEN}Informe a pasta que deseja linkar: ${NO_COLOR}\n"
# read DIRNAME

# if [ ! -d "$HOME/$DIRNAME" ]
# then
#     printf "${LIGHT_RED}A pasta não existe. \n${GREEN}Criando pasta em sua Home... ${NO_COLOR}\n"
#     mkdir $HOME/$DIRNAME
#     printf "${LIGHT_GREEN}Pasta criada com sucesso! ${NO_COLOR}\n"
# else
#     printf "${LIGHT_GREEN}Pasta já existe! ${NO_COLOR}\n"
# fi

#end of script
