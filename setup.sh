#!/bin/bash
set -e

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH=$PATH:$HOME/.local/bin

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> "$HOME/.bashrc"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

# Install Ansible
uv tool install ansible-core --with ansible

# Run ansible
ansible-galaxy collection install community.general

curl -sSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml

ansible-playbook setup.yml --ask-become-pass

systemctl reboot
