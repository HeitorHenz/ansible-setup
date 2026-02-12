#!/bin/bash
set -e

export PATH=$PATH:$HOME/.local/bin

if ! command -v uv &> /dev/null; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

if ! command -v ansible &> /dev/null; then
    uv install tool ansible
fi

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install yadm
curl -fLo /usr/local/bin/yadm https://github.com/yadm-dev/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm

# Run ansible
ansible-galaxy collection install community.general

curl -sSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml

ansible-playbook setup.yml --ask-become-pass

systemctl reboot
