#!/bin/bash

SCOPE="~/."

if [[ ! -f "${SCOPE}env" && ! -f "${SCOPE}colors.env" ]]; then
    SCOPE="."

    if [[ ! -f "${SCOPE}env" && ! -f "${SCOPE}colors.env" ]]; then
        printf "ERROR: The script cannot be executed. Environment files were not found.\n" 
        printf "Check or run the \"link_folders.sh\" script from the repository to initialize.\n\n"
        exit 0
    fi
fi

export $(grep -v '^#' ${SCOPE}env | xargs -d '\n')
export $(grep -v '^#' ${SCOPE}colors.env | xargs -d '\n')

function getConnectionName() {
    read -p "-> " CONNECTION_NAME

    echo ${CONNECTION_NAME^^}
}

function saveConnection() {
    echo "# ${1} Server SSH Access" >> ${SCOPE}env
    echo "${1}_SERVER_HOST=${2}" >> ${SCOPE}env
    echo "${1}_SERVER_USER=${3}" >> ${SCOPE}env
    echo "${1}_SERVER_PORT=${4}" >> ${SCOPE}env
    if [[ ${5} != "NULL_VALUE" ]]; then
        echo "${1}_SERVER_KEY=${5}" >> ${SCOPE}env
    fi
    if [[ ${6} != "NULL_VALUE" ]]; then
        echo "${1}_SERVER_PASSWORD=${6}" >> ${SCOPE}env
    fi
    echo "#" >> ${SCOPE}env
}

function setConnection() {
    CONNECTION_NAME=${1}
    SET_MANUALLY=${2:-0}

    # Defines the connection config by passed name.
    DEF_HOST_NAME=${CONNECTION_NAME}'_SERVER_HOST'
    DEF_PORT_NAME=${CONNECTION_NAME}'_SERVER_PORT'
    DEF_USER_NAME=${CONNECTION_NAME}'_SERVER_USER'
    DEF_KEY_NAME=${CONNECTION_NAME}'_SERVER_KEY'
    DEF_PASSWORD_NAME=${CONNECTION_NAME}'_SERVER_PASSWORD'

    # Get the connection values from .env
    if [[ $SET_MANUALLY -eq 1 ]]; then
        printf "${LT_PURPLE}Set the Host address: ${NO_COLOR}\n"
        read -p "Host: " HOST

        printf "${NO_COLOR}\n"

        printf "${LT_PURPLE}Set the Port or type enter to set 22 as default: ${NO_COLOR}\n"
        read -p "Port: " PORT
        PORT=${PORT:-22}

        printf "${NO_COLOR}\n"

        printf "${LT_PURPLE}Inform the Username: ${NO_COLOR}\n"
        read -p "Username: " USER

        printf "${NO_COLOR}\n"

        printf "${LT_PURPLE}This User connect to the Host using Keypass or Password?${NO_COLOR}\n"
        while true; do
            read -p "(k|p)" REPLY
            case $REPLY in
                [Kk]* ) printf "\n${LT_PURPLE}Enter the full path to the key: ${NO_COLOR}\n"; read -p "Key path: " KEY; break;;
                [Pp]* ) printf "\n${LT_PURPLE}Enter the password: ${NO_COLOR}\n"; read -s -p "Password: " PASSWORD; break;;
                * ) printf "${LT_RED_BGD}Please answer \"k\" to KEY or \"p\" to PASSWORD.${NO_COLOR}\n";;
            esac
        done

        printf "${NO_COLOR}\n"

        printf "${LT_PURPLE_BLD}Do you want to save this connection in the \".env\" file?${NO_COLOR}\n"
        while true; do
            read -p "(yes|no)" REPLY
            case $REPLY in
                [Yy]* ) saveConnection ${CONNECTION_NAME} ${HOST} ${USER} ${PORT} ${KEY:-"NULL_VALUE"} ${PASSWORD:-"NULL_VALUE"}; break;;
                [Nn]* ) break;;
                * ) printf "${LT_RED_BGD}Please answer \"k\" to KEY or \"p\" to PASSWORD.${NO_COLOR}\n";;
            esac
        done

    else
        HOST=$(eval echo '$'$DEF_HOST_NAME)
        PORT=$(eval echo '$'$DEF_PORT_NAME)
        PORT=${PORT:-22}
        USER=$(eval echo '$'$DEF_USER_NAME)
        KEY=$(eval echo '$'$DEF_KEY_NAME)
        KEY=$(eval echo $KEY)
        PASSWORD=$(eval echo '$'$DEF_PASSWORD_NAME)
    fi

    if [[ -z $HOST ]]; then
        printf "${LT_RED_BLD}The connection name ${CONNECTION_NAME:-null} does not exist.${NO_COLOR}\n\n"

        printf "${LT_RED}Do you want to set a connection manually?${NO_COLOR}\n"

        while true; do
            read -p "(yes|no)" REPLY
            case $REPLY in
                [Yy]* ) setConnection ${CONNECTION_NAME} 1; break;;
                [Nn]* ) exit 0;;
                * ) printf "${LT_RED_BGD}Please answer yes or no.${NO_COLOR}\n";;
            esac
        done
    fi
}

#Variables
if [ ${1} ]; then
    CONNECTION_NAME=${1^^}
else
    printf "${LT_YELLOW_BLD}Enter the name of the connection:${NO_COLOR}\n"
    CONNECTION_NAME=$(getConnectionName)
fi

setConnection ${CONNECTION_NAME}

if [[ $KEY ]]; then
    if [ ! -f "$KEY" ]
    then
        printf "${LT_RED_BLD}A Key Não existe no caminho ${YELLOW}${KEY}${LT_RED_BLD}\nPor favor verifique!${NO_COLOR}\n"
        exit 0
    else
        PERMISSION=$(stat -L -c "%a" $KEY)
        if [ $PERMISSION -eq 600 ]
        then
            printf "${LT_GREEN}Key verificada com sucesso! Conectando ...${NO_COLOR}\n"
            ssh -i $KEY -p $PORT $USER@$HOST
        else
            printf "${LT_RED_BLD}As permissões de acesso da Key estão incorretas.\n${NO_COLOR}"
            printf "${YELLOW}Permissão atual: ${PERMISSION}\n"
            printf "${YELLOW}Permissão correta: 600\n\n"

            printf "${LT_RED}Para corrigir execute: ${YELLOW_UNS}sudo chmod 0600 ${KEY}\n"

            exit 0
        fi
    fi
else
    printf "${LT_CYAN}A conexão por senha não é tão segura! Considere migrar para SSH-KEY. Conectando...${NO_COLOR}\n"
    sshpass -p $PASSWORD ssh -p $PORT $USER@$HOST
fi