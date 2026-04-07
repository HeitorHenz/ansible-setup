#!/bin/bash
set -e

read -rsp "Enter sudo password: " BECOME_PASS
echo

echo "$BECOME_PASS" | sudo -S pacman -Sy --noconfirm ansible git curl

curl -sSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml
ansible-playbook setup.yml -e "ansible_become_password=$BECOME_PASS"
