#!/bin/bash
set -e

sudo pacman -Syu --noconfirm ansible git curl base-devel

if ! command -v yay >/dev/null 2>&1; then
    tmpdir="$(mktemp -d)"
    git clone --depth 1 https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
    (cd "$tmpdir/yay-bin" && makepkg -si --noconfirm)
    rm -rf "$tmpdir"
fi

yay -S --needed --noconfirm \
    dux-files-bin dux-search-bin dux-calendar-bin dux-greeter-bin \
    gopass-secret-service


curl -fsSL -o setup.yml https://raw.githubusercontent.com/heitorhenz/ansible-setup/main/setup.yml

ansible-playbook setup.yml --ask-become-pass
