#!/bin/bash
# Official-repo base on top of the archinstall base:
#   pacman -S base base-devel linux-firmware linux intel-ucode   (not listed here)
# Run as a normal user (uses sudo). Next: 01-chaotic-aur.sh (sets up Chaotic AUR and paru).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

# boot, network, hardware
pac efibootmgr zram-generator networkmanager linux-headers openssh reflector pacman-contrib pkgfile \
  bluez bluez-utils bluetui brightnessctl hwinfo hwdetect fuse2

# shell & cli
pac stow zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting nushell bash-completion \
  starship thefuck zoxide fzf eza bat ripgrep dust duf btop jq yq bc yazi ueberzugpp tmux \
  7zip unzip zip dpkg detox rsync wget less man-db expac speedtest-cli openbsd-netcat

# fonts
pac noto-fonts otf-font-awesome ttf-dejavu ttf-jetbrains-mono ttf-jetbrains-mono-nerd
