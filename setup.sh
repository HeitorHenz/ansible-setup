#!/bin/bash
set -e

export PATH=$PATH:$HOME/.local/bin

# if !command -v uv &> /dev/null; then
#     curl -LsSf https://astral.sh/uv/install.sh | sh
#     export PATH=$PATH:$HOME/.local/bin
# fi

if !command -v ansible &> /dev/null; then
    uv tool install ansible-core --with ansible
fi

# Install starship -> move to cargo eventually
curl -sS https://starship.rs/install.sh | sh

# Run ansible
ansible-galaxy collection install community.general

curl -sSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml

ansible-playbook setup.yml --ask-become-pass

systemctl reboot
