#!/bin/sh

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

#VENV_NAME="inns-2019"
VENV_NAME=$(head -n 1 venv_name.txt | cut -f2 -d ' ')

# Check if you are already in the environment
if [[ $PATH != *$VENV_NAME* ]]; then
    # Check if the environment exists
    source activate $VENV_NAME
    if [ $? -eq 0 ]; then
        echo -e "Conda env '$VENV_NAME' `red "exists"`."
        echo -e "`red "Terminating venv configuration"`."
        exit 1
    else
        # Create the environment and activate
        echo -e "Conda env '$VENV_NAME' `red "doesn't exist"`."
        echo -e "Creating `green "new venv" $VENV_NAME` using conda."
        conda create -y --name ${VENV_NAME} python=3.6
        source activate $VENV_NAME

    fi
fi

VENV_HOME="$(which python)"

pip install --upgrade pip

echo -e "\n\nInstalling `green "JupyterLab and Node.js"`\n\n"
conda install -y -c conda-forge nodejs jupyterlab

echo -e "\n\nInstalling packages specified in `green $PWD/"requirements.txt"`\n\n"
pip install -r requirements.txt

echo -e "\n\nInstalling extensions for JupyterLab specified in `green $PWD/"postBuild"`\n\n"
sh -e postBuild

printf "\n"
printf "====================================================================\n"
printf "============                                            ============\n"
printf "============        Working environment is ready        ============\n"
printf "============                                            ============\n"
printf "====================================================================\n"
printf "\n"

printf "1) The python interpreter located in: \n\n\t"
printf "`green ${VENV_HOME}`\n\n"

printf "2) To activate this environment (with JupyterLab and extensions), use: \n\n\t"
printf "`green "> source activate inns-2019"`\n\n"

printf "3) For `green 'Jupyter Notebooks'` use the associated kernel which is located in: \n\n\t"
jupyter kernelspec list | grep "$VENV_NAME"

printf "\n\n"

source deactivate