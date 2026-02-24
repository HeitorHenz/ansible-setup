#!/bin/bash
set -e

# Install Ansible
sudo dnf install -y ansible ansible-collection-community-general

# Clone dotfiles
git clone https://github.com/HeitorHenz/.dotfiles ~/.dotfiles

# run Ansible
curl -sSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml
ansible-playbook setup.yml --ask-become-pass
