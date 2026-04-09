#!/bin/bash
set -e

sudo pacman -Syu --noconfirm ansible git curl base-devel

ansible-galaxy collection install kewlfft.aur
ansible-galaxy collection install community.general

bash -c "$(curl -sSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml)"

ansible-playbook setup.yml --ask-become-pass
