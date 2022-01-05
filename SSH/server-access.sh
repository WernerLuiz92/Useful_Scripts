export $(grep -v '^#' .env | xargs -d '\n')

DEF_CONNECTION_NAME=${1}
DEF_CONN