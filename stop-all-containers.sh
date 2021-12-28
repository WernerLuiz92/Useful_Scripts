#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

ACTIVE_CONTAINERS=($(docker container ls --format="{{.Names}}"));
QTD_CONTAINERS=${#ACTIVE_CONTAINERS[@]}

if [ $QTD_CONTAINERS -gt 0 ]; then
	printf "${GREEN}Found $QTD_CONTAINERS containers running, stopping . "
	sleep 0.5
	printf ". "
	sleep 0.5
	printf ". "
	sleep 0.5
	printf ". "
	sleep 0.5
	printf ".${NO_COLOR}\n"

	docker container stop ${ACTIVE_CONTAINERS[*]}

	printf "${GREEN}All containers that were running were stopped.${NO_COLOR}\n"
else
	printf "${RED}No running containers were found.${NO_COLOR}\n"
fi

#end