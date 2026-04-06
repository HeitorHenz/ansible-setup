#!/bin/bash
set -e

# Update package database and install Ansible, Git, and curl
sudo pacman -Sy --noconfirm ansible git curl

# Clone dotfiles
git clone https://github.com/HeitorHenz/.dotfiles ~/.dotfiles

# Run Ansible
curl -sSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml
ansible-playbook setup.yml --ask-become-pass
