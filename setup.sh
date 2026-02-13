#!/bin/bash
set -e

curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH=$PATH:$HOME/.local/bin

uv tool install ansible-core --with ansible

# Install starship -> move to cargo eventually
curl -sS https://starship.rs/install.sh | sh

# Run ansible
ansible-galaxy collection install community.general

curl -sSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml

ansible-playbook setup.yml --ask-become-pass

systemctl reboot
