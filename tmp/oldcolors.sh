# #!/bash/bin

# BLACK='\033[30m'
# RED='\033[31m'
# GREEN='\033[32m'
# YELLOW='\033[33m'
# BLUE='\033[34m'
# PURPLE='\033[35m'
# CYAN='\033[36m'
# GRAY='\033[37m'
# WHITE='\033[1;30m'
# LIGHT_RED='\033[1;31m'
# LIGHT_GREEN='\033[1;32m'
# YELLOW='\033[1;33m'
# LIGHT_BLUE='\033[1;34m'
# LIGHT_PURPLE='\033[1;35m'
# LIGHT_CYAN='\033[1;36m'
# WHITE='\033[1;37m'
# NO_COLOR='\033[0m'
# BG_BLACK='\e[48;5;0m'
# BG_WHITE='\e[48;5;255m'

# printf "${BLACK}Texto em BLACK...${NO_COLOR}\n"
# printf "${RED}Texto em RED...${NO_COLOR}\n"
# printf "${GREEN}Texto em GREEN...${NO_COLOR}\n"
# printf "${BROWN}Texto em BROWN...${NO_COLOR}\n"
# printf "${BLUE}Texto em BLUE...${NO_COLOR}\n"
# printf "${PURPLE}Texto em PURPLE...${NO_COLOR}\n"
# printf "${CYAN}Texto em CYAN...${NO_COLOR}\n"
# printf "${LIGHT_GRAY}Texto em LIGHT_GRAY...${NO_COLOR}\n"
# printf "${DARK_GRAY}Texto em DARK_GRAY...${NO_COLOR}\n"
# printf "${LIGHT_RED}Texto em LIGHT_RED...${NO_COLOR}\n"
# printf "${LIGHT_GREEN}Texto em LIGHT_GREEN...${NO_COLOR}\n"
# printf "${YELLOW}Texto em YELLOW...${NO_COLOR}\n"
# printf "${LIGHT_BLUE}Texto em LIGHT_BLUE...${NO_COLOR}\n"
# printf "${LIGHT_PURPLE}Texto em LIGHT_PURPLE...${NO_COLOR}\n"
# printf "${LIGHT_CYAN}Texto em LIGHT_CYAN...${NO_COLOR}\n"
# printf "${WHITE}Texto em WHITE...${NO_COLOR}\n"
# printf "${NO_COLOR}Texto em NO_COLOR...${NO_COLOR}\n"

# printf "${BG_BLACK} ${BLACK}Texto em BLACK...${NO_COLOR}\n"
# printf "${BG_BLACK} ${RED}Texto em RED...${NO_COLOR}\n"
# printf "${BG_BLACK} ${GREEN}Texto em GREEN...${NO_COLOR}\n"
# printf "${BG_BLACK} ${BROWN}Texto em BROWN...${NO_COLOR}\n"
# printf "${BG_BLACK} ${BLUE}Texto em BLUE...${NO_COLOR}\n"
# printf "${BG_BLACK} ${PURPLE}Texto em PURPLE...${NO_COLOR}\n"
# printf "${BG_BLACK} ${CYAN}Texto em CYAN...${NO_COLOR}\n"
# printf "${BG_BLACK} ${LIGHT_GRAY}Texto em LIGHT_GRAY...${NO_COLOR}\n"
# printf "${BG_BLACK} ${DARK_GRAY}Texto em DARK_GRAY...${NO_COLOR}\n"
# printf "${BG_BLACK} ${LIGHT_RED}Texto em LIGHT_RED...${NO_COLOR}\n"
# printf "${BG_BLACK} ${LIGHT_GREEN}Texto em LIGHT_GREEN...${NO_COLOR}\n"
# printf "${BG_BLACK} ${YELLOW}Texto em YELLOW...${NO_COLOR}\n"
# printf "${BG_BLACK} ${LIGHT_BLUE}Texto em LIGHT_BLUE...${NO_COLOR}\n"
# printf "${BG_BLACK} ${LIGHT_PURPLE}Texto em LIGHT_PURPLE...${NO_COLOR}\n"
# printf "${BG_BLACK} ${LIGHT_CYAN}Texto em LIGHT_CYAN...${NO_COLOR}\n"
# printf "${BG_BLACK} ${WHITE}Texto em WHITE...${NO_COLOR}\n"

# printf "${BG_WHITE} ${BLACK}Texto em BLACK...${NO_COLOR}\n"
# printf "${BG_WHITE} ${RED}Texto em RED...${NO_COLOR}\n"
# printf "${BG_WHITE} ${GREEN}Texto em GREEN...${NO_COLOR}\n"
# printf "${BG_WHITE} ${BROWN}Texto em BROWN...${NO_COLOR}\n"
# printf "${BG_WHITE} ${BLUE}Texto em BLUE...${NO_COLOR}\n"
# printf "${BG_WHITE} ${PURPLE}Texto em PURPLE...${NO_COLOR}\n"
# printf "${BG_WHITE} ${CYAN}Texto em CYAN...${NO_COLOR}\n"
# printf "${BG_WHITE} ${LIGHT_GRAY}Texto em LIGHT_GRAY...${NO_COLOR}\n"
# printf "${BG_WHITE} ${DARK_GRAY}Texto em DARK_GRAY...${NO_COLOR}\n"
# printf "${BG_WHITE} ${LIGHT_RED}Texto em LIGHT_RED...${NO_COLOR}\n"
# printf "${BG_WHITE} ${LIGHT_GREEN}Texto em LIGHT_GREEN...${NO_COLOR}\n"
# printf "${BG_WHITE} ${YELLOW}Texto em YELLOW...${NO_COLOR}\n"
# printf "${BG_WHITE} ${LIGHT_BLUE}Texto em LIGHT_BLUE...${NO_COLOR}\n"
# printf "${BG_WHITE} ${LIGHT_PURPLE}Texto em LIGHT_PURPLE...${NO_COLOR}\n"
# printf "${BG_WHITE} ${LIGHT_CYAN}Texto em LIGHT_CYAN...${NO_COLOR}\n"
# printf "${BG_WHITE} ${WHITE}Texto em WHITE...${NO_COLOR}\n"


    # #!/bin/bash
     
    # # This program is free software. It comes without any warranty, to
    # # the extent permitted by applicable law. You can redistribute it
    # # and/or modify it under the terms of the Do What The Fuck You Want
    # # To Public License, Version 2, as published by Sam Hocevar. See
    # # http://sam.zoy.org/wtfpl/COPYING for more details.
     
    # for fgbg in 38 48 ; do # Foreground / Background
    #     for color in {0..255} ; do # Colors
    #         # Display the color
    #         printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
    #         # Display 6 colors per lines
    #         if [ $((($color + 1) % 6)) == 4 ] ; then
    #             echo # New line
    #         fi
    #     done
    #     echo # New line
    # done
     
    # exit 0

    #!/bin/bash
     
    # This program is free software. It comes without any warranty, to
    # the extent permitted by applicable law. You can redistribute it
    # and/or modify it under the terms of the Do What The Fuck You Want
    # To Public License, Version 2, as published by Sam Hocevar. See
    # http://sam.zoy.org/wtfpl/COPYING for more details.
     
    #Background
    for clbg in {40..47} {100..107} 49 ; do
    	#Foreground
    	for clfg in {30..37} {90..97} 39 ; do
    		#Formatting
    		for attr in 0 1 2 4 5 7 ; do
    			#Print the result
                printf "\e[${attr};${clbg};${clfg}m'^[${attr};${clbg};${clfg}m'\e[0m\n"
    		done
    		printf "\n"
    	done
    done
     
    exit 0

