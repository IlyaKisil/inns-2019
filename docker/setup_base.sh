#!/bin/sh

RED="\033[0;31m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
BROWN="\033[0;33m"
WHITE="\033[0;0m"


green(){
    printf "${GREEN}$1${WHITE}"
}


red() {
    printf "${RED}$1${WHITE}"
}


VENV_NAME="inns-2019"


conda create -y --name ${VENV_NAME} python=3.6
source activate ${VENV_NAME}

VENV_HOME="$(which python)"

conda install -y -c conda-forge nodejs jupyterlab ipykernel


echo -e "`green "Installing jupyterlab extensions"`\n\n"

jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install @jupyterlab/toc


echo -e "Installing ipykernel for `green $VENV_NAME`\n\n"
python -m ipykernel install --user --name ${VENV_NAME} --display-name ${VENV_NAME}


printf "\n"
printf "====================================================================\n"
printf "============                                            ============\n"
printf "============          Base environment is ready         ============\n"
printf "============                                            ============\n"
printf "====================================================================\n"
printf "\n"

printf "1) The python interpreter located in: \n\n\t"
printf "${VENV_HOME}\n\n"

printf "2) For `green 'Jupyter Notebooks'` use the associated kernel which is located in: \n\n\t"
jupyter kernelspec list | grep "$VENV_NAME"

printf "\n\n"

source deactivate