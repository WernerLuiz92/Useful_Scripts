export $(grep -v '^#' .env | xargs -d '\n')

DEF_CONNECTION_NAME=${1}

echo "The chosen connection name is: ${DEF_CONNECTION_NAME^^}"
