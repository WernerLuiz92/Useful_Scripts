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

# CRIAR UM SCRIPT QUE PEGA AS PERMISSÕES DE TODOS OS ARQUIVOS E APLICA A MESMA PERMISSÃO A TODOS OS ARQUIVOS SEGUINDO UM PADRÃO

## SOMENTE SERÁ UTIL PARA O LARAVEL.

DIRFILES=($(find . -type f -name "*" -not -name ".gitignore";))
COPY=${1}

printf "${LT_PURPLE}Permissions from ${COPY} to all files: ${NO_COLOR}\n"

printf "\t${LT_PURPLE}Permissions --> \"$(stat -L -c "%A" $(basename $COPY))\"
\tOwner --> \"$(stat -L -c "%U" $(basename $COPY)):$(stat -L -c "%G" $(basename $COPY))\"${NO_COLOR}\n\n"

printf "${LT_PURPLE}Copying this permissions to all files in the folder...${NO_COLOR}\n"

printf "${YELLOW}Foram encontrados ${#DIRFILES[@]} arquivos.${NO_COLOR}\n"

for FILE in ${DIRFILES[@]}; do
    if [[ -f "${FILE}" ]]; then
        printf "\n${LT_PURPLE}Copying permissions from ${COPY} to ${FILE}${NO_COLOR}"
        printf "\n\t-> $(stat -L -c "%A" $(basename $FILE)) $(stat -L -c "%U" $(basename $FILE)):$(stat -L -c "%G" $(basename $FILE))"
        sudo chmod -R $(stat -L -c "%a" ${COPY}) ${FILE}
        sudo chown -R $(stat -L -c "%U:%G" ${COPY}) ${FILE}
        printf "\n\t-> $(stat -L -c "%A" $(basename $FILE)) $(stat -L -c "%U" $(basename $FILE)):$(stat -L -c "%G" $(basename $FILE))\n"
    fi
done

printf "${LT_GREEN}Permissions copied to all files in the folder.${NO_COLOR}\nls -la\n"
ls -la