#!/bin/sh

### This script assumes that venv 'inns-2019' has already been created.


RED="\033[0;31m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
BROWN="\033[0;33m"
WHITE="\033[0;0m"


function green(){
    printf "${GREEN}$1${WHITE}"
}


function red(){
    printf "${RED}$1${WHITE}"
}


VENV_NAME="inns-2019"

source activate ${VENV_NAME}

VENV_HOME="$(which python)"

echo -e "\n\nInstalling packages specified in `green $PWD/"requirements.txt"`\n\n"
#pip install -r requirements.txt


printf "\n"
printf "====================================================================\n"
printf "============                                            ============\n"
printf "============        Working environment is ready        ============\n"
printf "============                                            ============\n"
printf "====================================================================\n"
printf "\n"

source deactivate