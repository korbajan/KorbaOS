#!/bin/bash
# Everyday GUI apps. (CLI helpers are in 21-utils.sh.)
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac alacritty ghostty firefox gimp gimp-plugin-gmic gmic libreoffice-still obs-studio qbittorrent steam vlc vlc-plugin-ffmpeg guvcview \
  thunar thunar-archive-plugin thunar-volman ristretto imv xarchiver
aur zen-browser-bin   # Chaotic AUR
