#!/bin/bash
set -e

sudo pacman -Syu --noconfirm ansible git curl base-devel

# curl -fsSL https://install.danklinux.com | sh

# curl -LsSf https://astral.sh/uv/install.sh | sh

curl -fsSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml

ansible-playbook setup.yml --ask-become-pass
