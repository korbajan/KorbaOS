#!/bin/bash
# Everyday GUI apps. (CLI helpers are in 21-utils.sh.)
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# Root: installs official-repo packages only. User: also installs AUR package (zen-browser-bin).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac alacritty ghostty firefox gimp gimp-plugin-gmic gmic libreoffice-still obs-studio qbittorrent steam vlc vlc-plugin-ffmpeg guvcview \
  thunar thunar-archive-plugin thunar-volman ristretto imv xarchiver
aur zen-browser-bin   # Chaotic AUR
