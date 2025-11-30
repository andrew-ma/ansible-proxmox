#!/bin/bash
BASEDIR="$(dirname "${BASH_SOURCE[0]}")";
if [[ -d "${BASEDIR}/venv" ]]; then
    echo "${BASEDIR}/venv directory already exists"
    echo "Checking if ansible-navigator needs update"
    "${BASEDIR}/venv/bin/python3" -m pip install -U ansible-navigator
else
    echo "Creating ${BASEDIR}/venv ..."
    python3 -m venv "${BASEDIR}/venv" && \
    "${BASEDIR}/venv/bin/python3" -m pip install -U pip && \
    "${BASEDIR}/venv/bin/python3" -m pip install -U ansible-navigator && \
    echo -e "\nActivate venv with: source ${BASEDIR}/venv/bin/activate"
fi

