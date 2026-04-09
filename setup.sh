#!/bin/bash
set -e

sudo pacman -Sy --noconfirm ansible git curl base-devel

rm -rf /tmp/yay-bin
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin && cd /tmp/yay-bin && makepkg -si --noconfirm && rm -rf /tmp/yay-bin

bash -c "$(curl -fsSL https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.sh)"

ansible-playbook setup.yml --ask-become-pass
