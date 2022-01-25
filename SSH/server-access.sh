#!/bin/bash

# This script needs to be completed.

export $(grep -v '^#' .env | xargs -d '\n')
export $(grep -v '^#' .colors.env | xargs -d '\n')

printf "${WHITE} Texto na cor WHITE ${NO_COLOR}\n"
printf "${WHITE_BLD} Texto na cor WHITE_BLD ${NO_COLOR}\n"
printf "${WHITE_DIM} Texto na cor WHITE_DIM ${NO_COLOR}\n"
printf "${WHITE_UNS} Texto na cor WHITE_UNS ${NO_COLOR}\n"
printf "${WHITE_BLK} Texto na cor WHITE_BLK ${NO_COLOR}\n"
printf "${WHITE_BGD} Texto na cor WHITE_BGD ${NO_COLOR}\n\n"
printf "${BLACK} Texto na cor BLACK ${NO_COLOR}\n"
printf "${BLACK_BLD} Texto na cor BLACK_BLD ${NO_COLOR}\n"
printf "${BLACK_DIM} Texto na cor BLACK_DIM ${NO_COLOR}\n"
printf "${BLACK_UNS} Texto na cor BLACK_UNS ${NO_COLOR}\n"
printf "${BLACK_BLK} Texto na cor BLACK_BLK ${NO_COLOR}\n"
printf "${BLACK_BGD} Texto na cor BLACK_BGD ${NO_COLOR}\n\n"
printf "${RED} Texto na cor RED ${NO_COLOR}\n"
printf "${RED_BLD} Texto na cor RED_BLD ${NO_COLOR}\n"
printf "${RED_DIM} Texto na cor RED_DIM ${NO_COLOR}\n"
printf "${RED_UNS} Texto na cor RED_UNS ${NO_COLOR}\n"
printf "${RED_BLK} Texto na cor RED_BLK ${NO_COLOR}\n"
printf "${RED_BGD} Texto na cor RED_BGD ${NO_COLOR}\n\n"
printf "${GREEN} Texto na cor GREEN ${NO_COLOR}\n"
printf "${GREEN_BLD} Texto na cor GREEN_BLD ${NO_COLOR}\n"
printf "${GREEN_DIM} Texto na cor GREEN_DIM ${NO_COLOR}\n"
printf "${GREEN_UNS} Texto na cor GREEN_UNS ${NO_COLOR}\n"
printf "${GREEN_BLK} Texto na cor GREEN_BLK ${NO_COLOR}\n"
printf "${GREEN_BGD} Texto na cor GREEN_BGD ${NO_COLOR}\n\n"
printf "${YELLOW} Texto na cor YELLOW ${NO_COLOR}\n"
printf "${YELLOW_BLD} Texto na cor YELLOW_BLD ${NO_COLOR}\n"
printf "${YELLOW_DIM} Texto na cor YELLOW_DIM ${NO_COLOR}\n"
printf "${YELLOW_UNS} Texto na cor YELLOW_UNS ${NO_COLOR}\n"
printf "${YELLOW_BLK} Texto na cor YELLOW_BLK ${NO_COLOR}\n"
printf "${YELLOW_BGD} Texto na cor YELLOW_BGD ${NO_COLOR}\n\n"
printf "${BLUE} Texto na cor BLUE ${NO_COLOR}\n"
printf "${BLUE_BLD} Texto na cor BLUE_BLD ${NO_COLOR}\n"
printf "${BLUE_DIM} Texto na cor BLUE_DIM ${NO_COLOR}\n"
printf "${BLUE_UNS} Texto na cor BLUE_UNS ${NO_COLOR}\n"
printf "${BLUE_BLK} Texto na cor BLUE_BLK ${NO_COLOR}\n"
printf "${BLUE_BGD} Texto na cor BLUE_BGD ${NO_COLOR}\n\n"
printf "${PURPLE} Texto na cor PURPLE ${NO_COLOR}\n"
printf "${PURPLE_BLD} Texto na cor PURPLE_BLD ${NO_COLOR}\n"
printf "${PURPLE_DIM} Texto na cor PURPLE_DIM ${NO_COLOR}\n"
printf "${PURPLE_UNS} Texto na cor PURPLE_UNS ${NO_COLOR}\n"
printf "${PURPLE_BLK} Texto na cor PURPLE_BLK ${NO_COLOR}\n"
printf "${PURPLE_BGD} Texto na cor PURPLE_BGD ${NO_COLOR}\n\n"
printf "${CYAN} Texto na cor CYAN ${NO_COLOR}\n"
printf "${CYAN_BLD} Texto na cor CYAN_BLD ${NO_COLOR}\n"
printf "${CYAN_DIM} Texto na cor CYAN_DIM ${NO_COLOR}\n"
printf "${CYAN_UNS} Texto na cor CYAN_UNS ${NO_COLOR}\n"
printf "${CYAN_BLK} Texto na cor CYAN_BLK ${NO_COLOR}\n"
printf "${CYAN_BGD} Texto na cor CYAN_BGD ${NO_COLOR}\n\n"
printf "${GRAY} Texto na cor GRAY ${NO_COLOR}\n"
printf "${GRAY_BLD} Texto na cor GRAY_BLD ${NO_COLOR}\n"
printf "${GRAY_DIM} Texto na cor GRAY_DIM ${NO_COLOR}\n"
printf "${GRAY_UNS} Texto na cor GRAY_UNS ${NO_COLOR}\n"
printf "${GRAY_BLK} Texto na cor GRAY_BLK ${NO_COLOR}\n"
printf "${GRAY_BGD} Texto na cor GRAY_BGD ${NO_COLOR}\n\n"
printf "${DK_GRAY} Texto na cor DK_GRAY ${NO_COLOR}\n"
printf "${DK_GRAY_BLD} Texto na cor DK_GRAY_BLD ${NO_COLOR}\n"
printf "${DK_GRAY_DIM} Texto na cor DK_GRAY_DIM ${NO_COLOR}\n"
printf "${DK_GRAY_UNS} Texto na cor DK_GRAY_UNS ${NO_COLOR}\n"
printf "${DK_GRAY_BLK} Texto na cor DK_GRAY_BLK ${NO_COLOR}\n"
printf "${DK_GRAY_BGD} Texto na cor DK_GRAY_BGD ${NO_COLOR}\n\n"
printf "${LT_RED} Texto na cor LT_RED ${NO_COLOR}\n"
printf "${LT_RED_BLD} Texto na cor LT_RED_BLD ${NO_COLOR}\n"
printf "${LT_RED_DIM} Texto na cor LT_RED_DIM ${NO_COLOR}\n"
printf "${LT_RED_UNS} Texto na cor LT_RED_UNS ${NO_COLOR}\n"
printf "${LT_RED_BLK} Texto na cor LT_RED_BLK ${NO_COLOR}\n"
printf "${LT_RED_BGD} Texto na cor LT_RED_BGD ${NO_COLOR}\n\n"
printf "${LT_GREEN} Texto na cor LT_GREEN ${NO_COLOR}\n"
printf "${LT_GREEN_BLD} Texto na cor LT_GREEN_BLD ${NO_COLOR}\n"
printf "${LT_GREEN_DIM} Texto na cor LT_GREEN_DIM ${NO_COLOR}\n"
printf "${LT_GREEN_UNS} Texto na cor LT_GREEN_UNS ${NO_COLOR}\n"
printf "${LT_GREEN_BLK} Texto na cor LT_GREEN_BLK ${NO_COLOR}\n"
printf "${LT_GREEN_BGD} Texto na cor LT_GREEN_BGD ${NO_COLOR}\n\n"
printf "${LT_YELLOW} Texto na cor LT_YELLOW ${NO_COLOR}\n"
printf "${LT_YELLOW_BLD} Texto na cor LT_YELLOW_BLD ${NO_COLOR}\n"
printf "${LT_YELLOW_DIM} Texto na cor LT_YELLOW_DIM ${NO_COLOR}\n"
printf "${LT_YELLOW_UNS} Texto na cor LT_YELLOW_UNS ${NO_COLOR}\n"
printf "${LT_YELLOW_BLK} Texto na cor LT_YELLOW_BLK ${NO_COLOR}\n"
printf "${LT_YELLOW_BGD} Texto na cor LT_YELLOW_BGD ${NO_COLOR}\n\n"
printf "${LT_BLUE} Texto na cor LT_BLUE ${NO_COLOR}\n"
printf "${LT_BLUE_BLD} Texto na cor LT_BLUE_BLD ${NO_COLOR}\n"
printf "${LT_BLUE_DIM} Texto na cor LT_BLUE_DIM ${NO_COLOR}\n"
printf "${LT_BLUE_UNS} Texto na cor LT_BLUE_UNS ${NO_COLOR}\n"
printf "${LT_BLUE_BLK} Texto na cor LT_BLUE_BLK ${NO_COLOR}\n"
printf "${LT_BLUE_BGD} Texto na cor LT_BLUE_BGD ${NO_COLOR}\n\n"
printf "${LT_PURPLE} Texto na cor LT_PURPLE ${NO_COLOR}\n"
printf "${LT_PURPLE_BLD} Texto na cor LT_PURPLE_BLD ${NO_COLOR}\n"
printf "${LT_PURPLE_DIM} Texto na cor LT_PURPLE_DIM ${NO_COLOR}\n"
printf "${LT_PURPLE_UNS} Texto na cor LT_PURPLE_UNS ${NO_COLOR}\n"
printf "${LT_PURPLE_BLK} Texto na cor LT_PURPLE_BLK ${NO_COLOR}\n"
printf "${LT_PURPLE_BGD} Texto na cor LT_PURPLE_BGD ${NO_COLOR}\n\n"
printf "${LT_CYAN} Texto na cor LT_CYAN ${NO_COLOR}\n"
printf "${LT_CYAN_BLD} Texto na cor LT_CYAN_BLD ${NO_COLOR}\n"
printf "${LT_CYAN_DIM} Texto na cor LT_CYAN_DIM ${NO_COLOR}\n"
printf "${LT_CYAN_UNS} Texto na cor LT_CYAN_UNS ${NO_COLOR}\n"
printf "${LT_CYAN_BLK} Texto na cor LT_CYAN_BLK ${NO_COLOR}\n"
printf "${LT_CYAN_BGD} Texto na cor LT_CYAN_BGD ${NO_COLOR}\n\n"
printf "${LT_GRAY} Texto na cor LT_GRAY ${NO_COLOR}\n"
printf "${LT_GRAY_BLD} Texto na cor LT_GRAY_BLD ${NO_COLOR}\n"
printf "${LT_GRAY_DIM} Texto na cor LT_GRAY_DIM ${NO_COLOR}\n"
printf "${LT_GRAY_UNS} Texto na cor LT_GRAY_UNS ${NO_COLOR}\n"
printf "${LT_GRAY_BLK} Texto na cor LT_GRAY_BLK ${NO_COLOR}\n"
printf "${LT_GRAY_BGD} Texto na cor LT_GRAY_BGD ${NO_COLOR}\n\n"
printf "${NO_COLOR} Texto na cor NO_COLOR ${NO_COLOR}\n"

exit 0;

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
