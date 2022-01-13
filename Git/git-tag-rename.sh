#!/bin/bash

#Colors
RED='\033[0;31m'
LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NO_COLOR='\033[0m'

function setName() {
    read -p "-> " NAME

    echo ${NAME}
}

#Arguments
if [ ${1} ]; then
    OLD_TAG_NAME=${1}
else
    printf "${YELLOW}Enter the OLD tag name:${NO_COLOR}\n"
    OLD_TAG_NAME=$(setName)
fi
if [ ${2} ]; then
    NEW_TAG_NAME=${2}
else
    printf "${YELLOW}Enter the NEW tag name:${NO_COLOR}\n"
    NEW_TAG_NAME=$(setName)
fi

if [[ -z "$OLD_TAG_NAME" || -z "$NEW_TAG_NAME" ]]; then
    printf "${RED}The parameters OLD and NEW tag name are required.${NO_COLOR}\n\n"
    printf "${LIGHT_RED}Without them it is not possible to proceed.${NO_COLOR}\n"
    exit 1
else

    if [ $(git tag -l "${OLD_TAG_NAME}") ]; then
        printf "${GREEN}Renaming tag ${YELLOW}${OLD_TAG_NAME}${GREEN} to ${YELLOW}${NEW_TAG_NAME}${GREEN} ...${NO_COLOR}\n"
            git tag -a -m "`git cat-file -p ${OLD_TAG_NAME} | tail -n +6`" ${NEW_TAG_NAME} ${OLD_TAG_NAME}^{}
        printf "${GREEN}Tag ${YELLOW}${NEW_TAG_NAME}${GREEN} created locally with success!${NO_COLOR}\n"

        printf "${GREEN}Pushing tag ${YELLOW}${NEW_TAG_NAME}${GREEN} to remote ...${NO_COLOR}\n"
            git push --tags
        printf "${GREEN}Tag ${YELLOW}${NEW_TAG_NAME}${GREEN} pushed to remote with success!${NO_COLOR}\n"

        printf "${GREEN}Deleting tag ${YELLOW}${OLD_TAG_NAME}${GREEN} from local and remote ...${NO_COLOR}\n"
            git tag --delete  ${OLD_TAG_NAME}
            git push --delete origin ${OLD_TAG_NAME}
        printf "${GREEN}Tag ${YELLOW}${OLD_TAG_NAME}${GREEN} deleted with success!${NO_COLOR}\n\n"
        printf "${LIGHT_GREEN}Done!${NO_COLOR}\n"
    else
        printf "${RED}The tag named ${YELLOW}${OLD_TAG_NAME}${RED} was not found.${NO_COLOR}\n\n"
        printf "${LIGHT_RED}Aborting ...${NO_COLOR}\n"
        exit 1
    fi

fi

#end of script
