#!/bin/bash

# Define dependencies

    declare -A DEPENDENCIES=(
        [Colors]='colors.sh'
        [Docker]='stop_containers.sh'
    )

    SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"

    for DIR in "${!DEPENDENCIES[@]}"; do
        SCOPE=$(eval echo "$HOME/.scripts")
        DEPENDENCY=${DEPENDENCIES[$DIR]}
        FOUND_IN="${SCOPE}/${DEPENDENCY}"
        FOUND=false

        
        if [[ ! -f "${SCOPE}/${DEPENDENCY}" ]]; then
            NEW_SCOPE="${SCRIPT_PATH}/../${DIR}"
            NEW_SCOPE=$(eval echo $NEW_SCOPE)
            FOUND_IN="${NEW_SCOPE}/${DEPENDENCY}"
            
            if [[ -f "${NEW_SCOPE}/${DEPENDENCY}" ]]; then
                FOUND=true
            fi
        else
            FOUND=true
        fi

        if [[ ${FOUND} == true ]]; then
            source ${FOUND_IN}
        else
            printf "\033[1;49;31m ${SCRIPT_NAME} - ERROR: The dependency %s from (%s) was not found in %s\n" "$DEPENDENCY" "$DIR" "${FOUND_IN}"
            if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
                exit 1
            else
                return 1
            fi
        fi
    done

# Functions
    main_function() {
        print_colored_text "GREEN" "Hello World!\n" "YELLOW" " Args: $* \n" "GREEN" "Bye Bye!\n"
    }

# Main

    (return 0 2>/dev/null)
    if [ $? -eq 0 ]; then
        :
    else
        main_function "$@"
        exit $?
    fi

