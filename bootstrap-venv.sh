#!/usr/bin/env bash

# Read venv name
VENV_NAME=$(head -n 1 ./binder/venv_name.txt | cut -f2 -d ' ')


# Create venv with conda
conda create -y --name ${VENV_NAME} python=3.6.5

# Replicate binder build process
source activate ${VENV_NAME}
pip  install -r ./binder/requirements.txt
sh -c "./binder/postBuild --local-build"
source deactivate