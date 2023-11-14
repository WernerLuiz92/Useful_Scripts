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

# Returns the hash of the passed string according to the algorithm.
# $1 - The string to be hashed.
# $2 - The algorithm to be used. Default is md5. Options: md5, base64
#
# return - The hash of the passed string.
function getHash() {
    local string=${1}
    local algorithm=${2:-"md5"}
    local suportedAlgorithms=("md5" "base64")
    local hash=""
    local hashCommand=""

    if [[ ! " ${suportedAlgorithms[@]} " =~ " ${algorithm} " ]]; then
        printf "ERROR: The algorithm \"${algorithm}\" is not supported.\n"
        printf "Supported algorithms: ${suportedAlgorithms[*]}\n"

        exit 0
    fi

    if [[ -z "${string}" ]]; then
        printf "${RED}ERROR: The string to be hashed cannot be empty.${NO_COLOR}\n"

        exit 0
    fi

    if [[ "${algorithm}" == "md5" ]]; then
        algorithm=($(echo "${algorithm}sum || ${algorithm}"))
    else
        algorithm=($(echo "${algorithm}"))
    fi

    # Get the hash
    hash=$(echo -n ${string} | ${algorithm})

    echo ${hash}
}

function getPrepUrl() {
    local domain=${1}
    local domainHash=""
    local url=""
    local preUrlHash=""
    local urlHash=""

    # Print the base64 hash of the domain
    if [[ ${domain} != "NULL_VALUE" ]]; then
        domainHash=($(getHash ${domain} base64))
        url="categories/v3/${domainHash}?key=$WS_ACCESS_KEY&taxonomy=$TAXONOMY"
    else
        url="categories/v3?key=$WS_ACCESS_KEY&taxonomy=$TAXONOMY"
    fi

    preUrlHash="${WS_SECRET_KEY}:${url}"
    urlHash=$(getHash "${preUrlHash}" md5)

    #return the prepared url
    echo "${WS_API_URL}/${url}&hash=${urlHash}"
}

function setTaxonomy() {
    function askForTaxonomy() {
        for i in "${!TAXONOMIES[@]}"; do
            printf "${LT_GREEN}  ${i}) ${TAXONOMIES[$i]}${NO_COLOR}\n"
        done

        printf "${LT_PURPLE}Choose a taxonomy: (ENTER -> 0) ${NO_COLOR}\n"
        read -p "-> " TAXONOMY_INDEX

        TAXONOMY=${TAXONOMIES[$TAXONOMY_INDEX]}
    }

    # If the taxonomy is not set, set iabv1 as default.
    if [[ -z ${TAXONOMY} ]]; then
        askForTaxonomy
    fi

    # If the taxonomy is not in the list, set show the list and ask for a new taxonomy.
    if [[ ! " ${TAXONOMIES[@]} " =~ " ${TAXONOMY} " ]]; then
        printf "${LT_RED}The taxonomy \"${TAXONOMY}\" is not valid. Please choose one of the following:${NO_COLOR}\n"
        askForTaxonomy
    fi

    # Print the taxonomy selected.
    printf "${LT_PURPLE}Taxonomy selected: ${LT_GREEN}${TAXONOMY}${NO_COLOR}\n"
}

function doCurlRequest() {
    # Get the prepared url
    local requestUrl=${1}

    # Print the url
    printf "${YELLOW}\n${LT_GREEN}${requestUrl}${NO_COLOR}\n\n"

    printf "${LT_PURPLE}Executing curl request...${NO_COLOR}\n\n"
    curl "${requestUrl}" -H "Accept: application/json" -H "Content-Type: application/json" -X GET -s | json_pp
}

#Pre-Args
TAXONOMIES=('webshrinker' 'iabv1')

#Args 1: Can be one of the TAXONOMIES or a DOMAIN
if [ ${1} ]; then
    if [[ " ${TAXONOMIES[@]} " =~ " ${1} " ]]; then
        TAXONOMY=${1}
        DOMAIN=${2-"NULL_VALUE"}
    else
        DOMAIN=${1-"NULL_VALUE"}
        TAXONOMY=${2}
    fi
fi

# Set the taxonomy.
setTaxonomy

# Variables
WS_ACCESS_KEY="nVbBY7WYFv6EDtpzaPtN"
WS_SECRET_KEY="5mOz1TrVHJ5ZHQmDzKLt"
WS_API_URL="https://api.webshrinker.com"

# If domain is "NULL", Print the taxonomies endpoint.
printf "${LT_PURPLE}Endpoint: "
if [[ $DOMAIN == "NULL_VALUE" ]]; then
    printf "${LT_GREEN}Get Taxonomies List${NO_COLOR}\n"
else
    printf "${LT_GREEN}Get Domain Info: "${YELLOW}${DOMAIN}${NO_COLOR}"\n"
fi

# Prepare the url to execute the curl request.
URL=$(getPrepUrl ${DOMAIN})

# Do the curl request or print the url.
doCurlRequest ${URL}

exit 0