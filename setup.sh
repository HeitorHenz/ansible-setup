#!/bin/bash
set -e

export PATH=$PATH:$HOME/.local/bin

if ! command -v ansible &> /dev/null; then
    python3 -m pip install --user ansible
fi

ansible-galaxy collection install community.general

ansible-playbook setup.yml --ask-become-pass
