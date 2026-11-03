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

if [ -n "$WAYLAND_DISPLAY" ] || [ -n "$DISPLAY" ]; then
    gpg --list-secret-keys --with-colons | grep -q '^sec:' || \
        gpg --quick-generate-key "$USER@localhost" ed25519 sign 0
    fpr=$(gpg --list-secret-keys --with-colons | awk -F: '/^fpr:/{print $10; exit}')
    gpg --list-secret-keys --with-colons | awk -F: '/^ssb:/ && $12 ~ /e/{f=1} END{exit !f}' || \
        gpg --quick-add-key "$fpr" cv25519 encr 0
    [ -f "$HOME/.local/share/gopass/stores/root/.gpg-id" ] || gopass init "$fpr"
fi

sudo -v
grep -q dms-greeter /etc/greetd/config.toml 2>/dev/null || dms-greeter install -y
dms-greeter sync -y
