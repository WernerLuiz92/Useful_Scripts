#!/bin/bash

SCOPE="$HOME/."
SCOPE=$(eval echo $SCOPE)

if [[ ! -f "${SCOPE}scripts.env" && ! -f "${SCOPE}colors.env" ]]; then
    SCOPE="."

    if [[ ! -f "${SCOPE}scripts.env" && ! -f "${SCOPE}colors.env" ]]; then
        printf "ERROR: The script cannot be executed. Environment files were not found.\n" 
        printf "Check or run the \"link_folders.sh\" script from the repository to initialize.\n\n"
        exit 0
    fi
fi

export $(grep -v '^#' ${SCOPE}scripts.env | xargs -d '\n')
export $(grep -v '^#' ${SCOPE}colors.env | xargs -d '\n')

printf "${RED}First of all: ${NO_COLOR}\n\n"
printf "\t - Please be absolutely sure that you are OFFLINE from all connection types.\n"
printf "\t - Make sure there is no possibility that you are being watched. Even with malware of any kind. But mostly KeyLoggers\n"
printf "\t - NEVER encrypt your words in the numerical order they were generated.\n"
printf "\t - NEVER encrypt ALL words at once.\n"
printf "\t - Make sure you don't forget the decryption keys for your hashes. otherwise your data will be LOST FOREVER WITHOUT CHANCE OF RECOVERY.\n"
printf "\t - Make it as hard as possible for them to steal your keys.\n"
printf "\t - Please be absolutely sure that you are OFFLINE from all connection types.\n"