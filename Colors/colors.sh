#!/bin/bash

# Define colors

    declare -A colors
    colors=(
        #WHITE variants
        [WHITE]='\033[0;49;39m'
        [WHITE_BLD]='\033[1;49;39m'
        [WHITE_DIM]='\033[2;49;39m'
        [WHITE_UNS]='\033[4;49;39m'
        [WHITE_BLK]='\033[5;49;39m'
        [WHITE_BGD]='\033[7;49;39m'
        #BLACK variants
        [BLACK]='\033[0;49;30m'
        [BLACK_BLD]='\033[1;49;30m'
        [BLACK_DIM]='\033[2;49;30m'
        [BLACK_UNS]='\033[4;49;30m'
        [BLACK_BLK]='\033[5;49;30m'
        [BLACK_BGD]='\033[7;49;30m'
        #RED variants
        [RED]='\033[0;49;31m'
        [RED_BLD]='\033[1;49;31m'
        [RED_DIM]='\033[2;49;31m'
        [RED_UNS]='\033[4;49;31m'
        [RED_BLK]='\033[5;49;31m'
        [RED_BGD]='\033[7;49;31m'
        #GREEN variants
        [GREEN]='\033[0;49;32m'
        [GREEN_BLD]='\033[1;49;32m'
        [GREEN_DIM]='\033[2;49;32m'
        [GREEN_UNS]='\033[4;49;32m'
        [GREEN_BLK]='\033[5;49;32m'
        [GREEN_BGD]='\033[7;49;32m'
        #YELLOW variants
        [YELLOW]='\033[0;49;33m'
        [YELLOW_BLD]='\033[1;49;33m'
        [YELLOW_DIM]='\033[2;49;33m'
        [YELLOW_UNS]='\033[4;49;33m'
        [YELLOW_BLK]='\033[5;49;33m'
        [YELLOW_BGD]='\033[7;49;33m'
        #BLUE variants
        [BLUE]='\033[0;49;34m'
        [BLUE_BLD]='\033[1;49;34m'
        [BLUE_DIM]='\033[2;49;34m'
        [BLUE_UNS]='\033[4;49;34m'
        [BLUE_BLK]='\033[5;49;34m'
        [BLUE_BGD]='\033[7;49;34m'
        #PURPLE variants
        [PURPLE]='\033[0;49;35m'
        [PURPLE_BLD]='\033[1;49;35m'
        [PURPLE_DIM]='\033[2;49;35m'
        [PURPLE_UNS]='\033[4;49;35m'
        [PURPLE_BLK]='\033[5;49;35m'
        [PURPLE_BGD]='\033[7;49;35m'
        #CYAN variants
        [CYAN]='\033[0;49;36m'
        [CYAN_BLD]='\033[1;49;36m'
        [CYAN_DIM]='\033[2;49;36m'
        [CYAN_UNS]='\033[4;49;36m'
        [CYAN_BLK]='\033[5;49;36m'
        [CYAN_BGD]='\033[7;49;36m'
        #GRAY variants
        [GRAY]='\033[0;49;37m'
        [GRAY_BLD]='\033[1;49;37m'
        [GRAY_DIM]='\033[2;49;37m'
        [GRAY_UNS]='\033[4;49;37m'
        [GRAY_BLK]='\033[5;49;37m'
        [GRAY_BGD]='\033[7;49;37m'
        #DK_GRAY variants
        [DK_GRAY]='\033[0;49;90m'
        [DK_GRAY_BLD]='\033[1;49;90m'
        [DK_GRAY_DIM]='\033[2;49;90m'
        [DK_GRAY_UNS]='\033[4;49;90m'
        [DK_GRAY_BLK]='\033[5;49;90m'
        [DK_GRAY_BGD]='\033[7;49;90m'
        #LT_RED variants
        [LT_RED]='\033[0;49;91m'
        [LT_RED_BLD]='\033[1;49;91m'
        [LT_RED_DIM]='\033[2;49;91m'
        [LT_RED_UNS]='\033[4;49;91m'
        [LT_RED_BLK]='\033[5;49;91m'
        [LT_RED_BGD]='\033[7;49;91m'
        #LT_GREEN variants
        [LT_GREEN]='\033[0;49;92m'
        [LT_GREEN_BLD]='\033[1;49;92m'
        [LT_GREEN_DIM]='\033[2;49;92m'
        [LT_GREEN_UNS]='\033[4;49;92m'
        [LT_GREEN_BLK]='\033[5;49;92m'
        [LT_GREEN_BGD]='\033[7;49;92m'
        #LT_YELLOW variants
        [LT_YELLOW]='\033[0;49;93m'
        [LT_YELLOW_BLD]='\033[1;49;93m'
        [LT_YELLOW_DIM]='\033[2;49;93m'
        [LT_YELLOW_UNS]='\033[4;49;93m'
        [LT_YELLOW_BLK]='\033[5;49;93m'
        [LT_YELLOW_BGD]='\033[7;49;93m'
        #LT_BLUE variants
        [LT_BLUE]='\033[0;49;94m'
        [LT_BLUE_BLD]='\033[1;49;94m'
        [LT_BLUE_DIM]='\033[2;49;94m'
        [LT_BLUE_UNS]='\033[4;49;94m'
        [LT_BLUE_BLK]='\033[5;49;94m'
        [LT_BLUE_BGD]='\033[7;49;94m'
        #LT_PURPLE variants
        [LT_PURPLE]='\033[0;49;95m'
        [LT_PURPLE_BLD]='\033[1;49;95m'
        [LT_PURPLE_DIM]='\033[2;49;95m'
        [LT_PURPLE_UNS]='\033[4;49;95m'
        [LT_PURPLE_BLK]='\033[5;49;95m'
        [LT_PURPLE_BGD]='\033[7;49;95m'
        #LT_CYAN variants
        [LT_CYAN]='\033[0;49;96m'
        [LT_CYAN_BLD]='\033[1;49;96m'
        [LT_CYAN_DIM]='\033[2;49;96m'
        [LT_CYAN_UNS]='\033[4;49;96m'
        [LT_CYAN_BLK]='\033[5;49;96m'
        [LT_CYAN_BGD]='\033[7;49;96m'
        #LT_GRAY variants
        [LT_GRAY]='\033[0;49;97m'
        [LT_GRAY_BLD]='\033[1;49;97m'
        [LT_GRAY_DIM]='\033[2;49;97m'
        [LT_GRAY_UNS]='\033[4;49;97m'
        [LT_GRAY_BLK]='\033[5;49;97m'
        [LT_GRAY_BGD]='\033[7;49;97m'
        #CLEAR
        [NO_COLOR]='\033[0m'
        # -------------------
    )

# Functions

    print_colored_text() {
        for arg in "$@"; do
            if [ -n "${colors[$arg]}" ]; then
                printf "${colors[$arg]}"
            else
                printf "%b" "$arg"
            fi
        done

        printf "${colors[NO_COLOR]}"
    }

# Main

    (return 0 2>/dev/null)
    if [ $? -eq 0 ]; then
        # Se for sourcado, defina a função print_colored_text para ser usada
        :
    else
        print_colored_text "RED_BLD" "ERROR: " "RED" "No direct script allowed.\n"
        exit 1
    fi