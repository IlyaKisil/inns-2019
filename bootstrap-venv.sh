#!/usr/bin/env bash

# Author: Ilya Kisil <ilyakisil@gmail.com>

# Source project wide setup variables
source variables.sh

# Create venv with conda
conda create -y --name ${VENV_NAME} python=3.6.5

# Replicate binder build process
source activate ${VENV_NAME}
pip  install -r ${PROJECT_HOME}/requirements.txt
sh -c "postBuild --local-build"
source deactivate
