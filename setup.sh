#!/bin/bash
set -e

sudo pacman -Sy --noconfirm ansible git curl

curl -sSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml
ansible-playbook setup.yml --ask-become-pass
