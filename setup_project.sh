#!/bin/bash

if [ -z "$1" ]; then
  # Print an error message and exit if the parameter is not set
  echo "Error: Missing project name"
  echo "Usage: setup_project.sh <project-name>"
  exit 1
fi

PROJECT_NAME=$1
PYTHON_VERSION=3.10

# https://stackoverflow.com/questions/61915607/commandnotfounderror-your-shell-has-not-been-properly-configured-to-use-conda
source ~/miniconda/etc/profile.d/conda.sh

# start showing the commands we are running. fail on error.
set -x -e

# Ensure a conda install
conda info

# create an environment for the project using python version
echo 'Y' | conda create --name $PROJECT_NAME python=$PYTHON_VERSION

# get into the env
conda activate $PROJECT_NAME

# install the repo tools
pip install -r requirements.txt

# setup the pre-commit stuff
pre-commit install
