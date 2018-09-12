#!/bin/bash

# First argument specifies the name of venv


###-------------------------- UTILS
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


###-------------------------- MAIN

#venv_name="inns-2019"
#venv_name=$(head -n 1 binder/venv_name.txt | cut -f2 -d ' ')
venv_name=$1


# Check if you are already in the environment
if [[ $PATH != *$venv_name* ]]; then
    # Check if the environment exists
    source activate $venv_name
    if [ $? -eq 0 ]; then
        echo -e "Conda env '$venv_name' `red "exists"`."
        echo -e "`red "Terminating venv configuration"`."
        exit 1
    else
        # Create the environment and activate
        echo -e "Conda env '$venv_name' `red "doesn't exist"`."
        echo -e "Creating `green "new venv" $venv_name` using conda.\n"
        conda create -y --name ${venv_name} python=3.6
        source activate $venv_name

    fi
fi

VENV_HOME="$(which python)"

pip install --no-cache-dir --upgrade pip

echo -e "\n\nInstalling `green "JupyterLab and Node.js"`\n\n"
conda install -y -c conda-forge nodejs jupyterlab

echo -e "\n\nInstalling packages specified in `green $PWD"/binder/requirements.txt"`\n\n"
pip install -r binder/requirements.txt --no-cache-dir

echo -e "\n\nInstalling extensions for JupyterLab specified in `green $PWD"/binder/postBuild"`\n\n"
sh -e binder/postBuild

printf "\n"
printf "====================================================================\n"
printf "============                                            ============\n"
printf "============        Working environment is ready        ============\n"
printf "============                                            ============\n"
printf "====================================================================\n"
printf "\n"

printf "1) The python interpreter located in: \n\n\t"
printf "`green $VENV_HOME`\n\n"

printf "2) To activate this environment (with JupyterLab and extensions), use: \n\n\t"
printf "`green "> source activate $venv_name"`\n\n"

printf "3) For notebooks use the associated kernel: `green $venv_name`. \n\n"

printf "4) To see location with its specifications, use: \n\n\t"
printf "`green "> jupyter kernelspec list | grep $venv_name"`"

printf "\n\n"

source deactivate