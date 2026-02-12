#!/bin/bash
set -e

export PATH=$PATH:$HOME/.local/bin

if ! command -v ansible &> /dev/null; then
  python3 -m ensurepip --upgrade --user
  export PATH=$PATH:$HOME/.local/bin
fi

pip install --user ansible
ansible-galaxy collection install community.general

ansible-playbook setup.yml --ask-become-pass
