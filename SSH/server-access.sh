export $(grep -v '^#' .env | xargs -d '\n')

#Colors
LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NO_COLOR='\033[0m'

getConnectionName() {
    printf "${YELLOW}Enter the name of the connection:${NO_COLOR}\n"
    read CONNECTION_NAME

    echo ${CONNECTION_NAME^^}
}

#Variables
if [ ${1} ]; then
    CONNECTION_NAME=${1^^}
else
    CONNECTION_NAME=$(getConnectionName)
fi
HOST=${CONNECTION_NAME}'_SERVER_HOST'
PORT=${CONNECTION_NAME}'_SERVER_PORT'
USER=${CONNECTION_NAME}'_SERVER_USER'
KEY=${CONNECTION_NAME}'_SERVER_KEY'

# printf "${GREEN}Informe a pasta que deseja linkar: ${NO_COLOR}\n"
# read DIRNAME

# if [ ! -d "$HOME/$DIRNAME" ]
# then
#     printf "${LIGHT_RED}A pasta não existe. \n${GREEN}Criando pasta em sua Home... ${NO_COLOR}\n"
#     mkdir $HOME/$DIRNAME
#     printf "${LIGHT_GREEN}Pasta criada com sucesso! ${NO_COLOR}\n"
# else
#     printf "${LIGHT_GREEN}Pasta já existe! ${NO_COLOR}\n"
# fi

echo "The chosen connection name is: ${CONNECTION_NAME}"

echo "The HOST to the chosen connection is: $(eval echo '$'$HOST)"
echo "The SSH PORT to the chosen connection is: $(eval echo '$'$PORT)"
echo "The USER to the chosen connection is: $(eval echo '$'$USER)"
echo "The KEY path to the chosen connection is: $(eval echo '$'$KEY)"

echo "The SSH command to the chosen connection is: "

echo "ssh -i $(eval echo '$'$KEY) -p $(eval echo '$'$PORT) $(eval echo '$'$USER)@$(eval echo '$'$HOST)"