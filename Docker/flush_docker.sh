#!/bin/bash

# Define dependencies

    declare -A DEPENDENCIES=(
        [Colors]='colors.sh'
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

    print_help() {
        print_colored_text "LT_GREEN" "Command usage: \n\t" "YELLOW" "flush_docker <options>\n" "LT_GREEN" "Options: \n\t"
        print_colored_text "LT_BLUE" "[" "YELLOW" "-n|--no-interaction" "LT_BLUE" "] " "YELLOW_DIM" " to not ask for confirmation. " "RED_DIM" "** Require at least one option [-a|-C|-I|-N|-V] **  \n\t"
        print_colored_text "LT_BLUE" "[" "YELLOW" "-a|--all" "LT_BLUE" "] " "YELLOW_DIM" " to remove containers, images, networks and volumes.  \n\t"
        print_colored_text "LT_BLUE" "[" "YELLOW" "-C|--container" "LT_BLUE" "] " "YELLOW_DIM" " to remove all containers.  \n\t"
        print_colored_text "LT_BLUE" "[" "YELLOW" "-I|--images" "LT_BLUE" "] " "YELLOW_DIM" " to remove all images.  \n\t"
        print_colored_text "LT_BLUE" "[" "YELLOW" "-N|--networks" "LT_BLUE" "] " "YELLOW_DIM" " to remove all networks.  \n\t"
        print_colored_text "LT_BLUE" "[" "YELLOW" "-V|--volumes" "LT_BLUE" "] " "YELLOW_DIM" " to remove all volumes.  \n\t"
        print_colored_text "LT_BLUE" "[" "YELLOW" "-q|--quiet" "LT_BLUE" "] " "YELLOW_DIM" " to not print any output.  \n\t"
        print_colored_text "LT_BLUE" "[" "YELLOW" "-d|--debug" "LT_BLUE" "] " "YELLOW_DIM" " to print debug information.  \n\t"
        print_colored_text "LT_BLUE" "[" "YELLOW" "-h|--help" "LT_BLUE" "] " "YELLOW_DIM" " to show this help.  \n\n"
    }

    handle_arguments() {
        if [ $# -lt 1 ] || [ $# -gt 9 ]; then
            print_colored_text "LT_RED_BLD" "Invalid number of arguments. \n\n"
            print_help
            return 1
        fi

        for arg in "$@"; do
            case $arg in
                "-a"|"--all")
                    REMOVE_CONTAINERS=true
                    REMOVE_IMAGES=true
                    REMOVE_NETWORKS=true
                    REMOVE_VOLUMES=true
                    ;;
                "-n"|"--no-interaction")
                    DO_NOT_INTERACT=true
                    ;;
                "-q"|"--quiet")
                    QUIET=true
                    ;;
                "-C"|"--container")
                    REMOVE_CONTAINERS=true
                    ;;
                "-I"|"--images")
                    REMOVE_IMAGES=true
                    ;;
                "-N"|"--networks")
                    REMOVE_NETWORKS=true
                    ;;
                "-V"|"--volumes")
                    REMOVE_VOLUMES=true
                    ;;
                "-h"|"--help")
                    print_help
                    return 0
                    ;;
                "-d"|"--debug")
                    DEBUG=true
                    ;;
                *)
                    print_colored_text "LT_RED_BLD" "Invalid argument: \`" "LT_YELLOW_BLD" "$arg" "LT_RED_BLD" "\`\n\n"
                    print_help
                    return 1
                    ;;
            esac
        done 



        [ "$DEBUG" = true ] && print_colored_text "LT_PURPLE" "Processing " "LT_YELLOW_BLD" "$# " "LT_PURPLE" "arguments. \n"
        [ "$DEBUG" = true ] && print_colored_text "LT_PURPLE" "Arguments: " "LT_YELLOW_BLD" "$*" "LT_PURPLE" " \n"
        [ "$DEBUG" = true ] && print_colored_text "LT_YELLOW_BLD" "Arguments set to: \n"
        [ "$DEBUG" = true ] && print_colored_text "LT_YELLOW" "\tREMOVE_CONTAINERS: " "LT_YELLOW_BLD" "${REMOVE_CONTAINERS}\n"
        [ "$DEBUG" = true ] && print_colored_text "LT_YELLOW" "\tREMOVE_IMAGES: " "LT_YELLOW_BLD" "${REMOVE_IMAGES}\n"
        [ "$DEBUG" = true ] && print_colored_text "LT_YELLOW" "\tREMOVE_NETWORKS: " "LT_YELLOW_BLD" "${REMOVE_NETWORKS}\n"
        [ "$DEBUG" = true ] && print_colored_text "LT_YELLOW" "\tREMOVE_VOLUMES: " "LT_YELLOW_BLD" "${REMOVE_VOLUMES}\n"
        [ "$DEBUG" = true ] && print_colored_text "LT_YELLOW" "\tDO_NOT_INTERACT: " "LT_YELLOW_BLD" "${DO_NOT_INTERACT}\n"
        [ "$DEBUG" = true ] && print_colored_text "LT_YELLOW" "\tQUIET: " "LT_YELLOW_BLD" "${QUIET}\n"
        [ "$DEBUG" = true ] && print_colored_text "LT_YELLOW" "\tDEBUG: " "LT_YELLOW_BLD" "${DEBUG}\n"

        # If the quiet flag is true, then set DO_NOT_INTERACT to true too
        if [ "$QUIET" = true ]; then
            DO_NOT_INTERACT=true
        fi

        # If DO_NOT_INTERACT is true, then check if there is at least one option selected else exit and do nothing
        if [ "$REMOVE_CONTAINERS" = false ] && [ "$REMOVE_IMAGES" = false ] && [ "$REMOVE_NETWORKS" = false ] && [ "$REMOVE_VOLUMES" = false ]; then
            if [ "$DO_NOT_INTERACT" = true ]; then
                print_colored_text "LT_RED_BLD" "At least one of the options [ -a | -C | -I | -N | -V ] is required.\n\n"
                print_help
                return 1
            else
                DO_NOT_INTERACT=false
            fi
        fi
    }

    run_command() {
        CONTAINER_NAMES=$(docker container ls --format="{{.Names}}")
        ACTIVE_CONTAINERS=( $CONTAINER_NAMES )
        QTD_CONTAINERS=${#ACTIVE_CONTAINERS[@]}

        if [ $QTD_CONTAINERS -eq 0 ]; then
            print_colored_text "LT_GREEN" "No running containers found. \n"
            COMMAND=""
        else
            print_colored_text "LT_GREEN" "Found running containers: " "LT_YELLOW_BLD" "${ACTIVE_CONTAINERS[*]}" "LT_GREEN" "\n"
            COMMAND="docker stop ${ACTIVE_CONTAINERS[*]};"
        fi

        if [ "$REMOVE_CONTAINERS" = true ]; then
            CONTAINER_TO_BE_REMOVED=( $(docker container ls -a --format="{{.Names}}") )
            
            if [ ${#CONTAINER_TO_BE_REMOVED[@]} -eq 0 ]; then
                print_colored_text "LT_GREEN" "No containers found. \n"
                COMMAND=""
            else
                COMMAND="${COMMAND} docker rm ${CONTAINER_TO_BE_REMOVED[*]};"
            fi
        fi

        if [ "$REMOVE_IMAGES" = true ]; then
            IMAGES_TO_BE_REMOVED=( $(docker images -aq) )

            if [ ${#IMAGES_TO_BE_REMOVED[@]} -eq 0 ]; then
                print_colored_text "LT_GREEN" "No images found. \n"
                COMMAND=""
            else
                COMMAND="${COMMAND} docker rmi ${IMAGES_TO_BE_REMOVED[*]};"
            fi
        fi

        if [ "$REMOVE_NETWORKS" = true ]; then
            COMMAND="${COMMAND} docker network prune -f;"
        fi

        if [ "$REMOVE_VOLUMES" = true ]; then
            COMMAND="${COMMAND} docker volume prune -f;"
        fi

        if [ "$REMOVE_CONTAINERS" = true ] && [ "$REMOVE_IMAGES" = true ] && [ "$REMOVE_NETWORKS" = true ] && [ "$REMOVE_VOLUMES" = true ]; then
            COMMAND="${COMMAND} docker system prune -a -f --volumes;"
        elif [ "$REMOVE_CONTAINERS" = false ] && [ "$REMOVE_IMAGES" = false ] && [ "$REMOVE_NETWORKS" = false ] && [ "$REMOVE_VOLUMES" = false ]; then
            [ "$QUIET" = false ] && print_colored_text "LT_GREEN_BLD" "No actions selected. Ending script\n\n"
            
            return 0
        fi

        if [ "$DO_NOT_INTERACT" = false ]; then
            # Perguntar se deseja proceder
            print_colored_text "\n" "LT_RED_BLD" "ATENTION" "LT_RED_BGD" "LT_RED_BLD" "\n\nWARNING:" "LT_RED_BGD" "LT_RED" " This script will affect: \n"
            [ $QTD_CONTAINERS -gt 0 ] && print_colored_text "LT_RED_BLD" "\t- Stop the running containers; \n"
            [ "$REMOVE_CONTAINERS" = true ] && print_colored_text "LT_RED_BLD" "\t- Remove all containers; \n"
            [ "$REMOVE_IMAGES" = true ] && print_colored_text "LT_RED_BLD" "\t- Remove all images; \n"
            [ "$REMOVE_NETWORKS" = true ] && print_colored_text "LT_RED_BLD" "\t- Remove all networks; \n"
            [ "$REMOVE_VOLUMES" = true ] && print_colored_text "LT_RED_BLD" "\t- Remove all volumes; \n"
            print_colored_text "LT_RED_BLD" "Are you sure you want to continue? [Y/n]: "
            while true; do
                read -p "> " REPLY
                case $REPLY in
                    [Yy]* ) break;;
                    [Nn]* ) print_colored_text "YELLOW_BLD" "Script aborted\n"; return 0;;
                    * ) print_colored_text "LT_RED_BGD" "LT_RED_BLD" "ATENTION:" "LT_RED" " Please answer \"y\" for YES or \"n\" for NO. ";;
                esac
            done
        fi
        
        if [ "$DEBUG" = false ]; then
            eval $COMMAND
        else
            print_colored_text "LT_YELLOW" "COMMAND: " "LT_YELLOW_BLD" "${COMMAND}\n"
        fi

        if [ $? -ne 0 ] && [ "$DEBUG" = false ]; then
            print_colored_text "LT_RED_BLD" "An error occurred while trying to execute the script.\n"
            return 1
        fi

        print_colored_text "LT_GREEN_BLD" "Script finished successfully.\n"

        return 0
    }

    interactive_mode() {
        # Perguntar se deseja limpar todos os CONTAINERS
        print_colored_text "LT_RED_BLD" "\nDo you want to remove all CONTAINERS? " "LT_YELLOW" "Press [Enter] for NO or type Y for YES: \n" "LT_YELLOW_BLD" "Remove all CONTAINERS: "
        read -p "> " OPTION
        OPTION=${OPTION}

        if [ "$OPTION" = "y" ] || [ "$OPTION" = "Y" ] || [ "$OPTION" = "yes" ] || [ "$OPTION" = "YES" ]; then
            REMOVE_CONTAINERS=true
        fi

        # Perguntar se deseja limpar todas as IMAGES
        print_colored_text "LT_RED_BLD" "\nDo you want to remove all IMAGES? " "LT_YELLOW" "Press [Enter] for NO or type Y for YES: \n" "LT_YELLOW_BLD" "Remove all IMAGES: "
        read -p "> " OPTION
        OPTION=${OPTION}

        if [ "$OPTION" = "y" ] || [ "$OPTION" = "Y" ] || [ "$OPTION" = "yes" ] || [ "$OPTION" = "YES" ]; then
            REMOVE_IMAGES=true
        fi

        # Perguntar se deseja limpar todas as NETWORKS
        print_colored_text "LT_RED_BLD" "\nDo you want to remove all NETWORKS? " "LT_YELLOW" "Press [Enter] for NO or type Y for YES: \n" "LT_YELLOW_BLD" "Remove all NETWORKS: "
        read -p "> " OPTION
        OPTION=${OPTION}

        if [ "$OPTION" = "y" ] || [ "$OPTION" = "Y" ] || [ "$OPTION" = "yes" ] || [ "$OPTION" = "YES" ]; then
            REMOVE_NETWORKS=true
        fi

        # Perguntar se deseja limpar todas as VOLUMES
        print_colored_text "LT_RED_BLD" "\nDo you want to remove all VOLUMES? " "LT_YELLOW" "Press [Enter] for NO or type Y for YES: \n" "LT_YELLOW_BLD" "Remove all VOLUMES: "
        read -p "> " OPTION
        OPTION=${OPTION}

        if [ "$OPTION" = "y" ] || [ "$OPTION" = "Y" ] || [ "$OPTION" = "yes" ] || [ "$OPTION" = "YES" ]; then
            REMOVE_VOLUMES=true
        fi
    }

    flush_docker() {
        REMOVE_CONTAINERS=false
        REMOVE_IMAGES=false
        REMOVE_NETWORKS=false
        REMOVE_VOLUMES=false

        DO_NOT_INTERACT=false
        QUIET=false
        DEBUG=false

        if [ $# -eq 0 ]; then
            DO_NOT_INTERACT=false
            QUIET=false
        else
            handle_arguments "$@"
        fi

        if [ "$REMOVE_CONTAINERS" = false ] && [ "$REMOVE_IMAGES" = false ] && [ "$REMOVE_NETWORKS" = false ] && [ "$REMOVE_VOLUMES" = false ]; then
            print_colored_text "LT_GREEN" "No option selected. \n"
            print_colored_text "LT_GREEN" "Interactive mode activated. \n\n"
            [ "$DO_NOT_INTERACT" = false ] && interactive_mode
        fi

        [ "$QUIET" = false ] && print_colored_text "LT_GREEN" "\n[INFO] Sending command to docker\n"

        run_command

        if [ $? -ne 0 ]; then
            return 1
        fi

        return 0
    }

# Main
    (return 0 2>/dev/null)
    if [ $? -eq 0 ]; then
        :
    else
        flush_docker "$@"
        exit $?
    fi
