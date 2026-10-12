#!/bin/bash
# Everyday apps.
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac alacritty ghostty firefox gimp gimp-plugin-gmic gmic libreoffice-still obs-studio qbittorrent steam vlc vlc-plugin-ffmpeg guvcview
aur tty-clock zen-browser-bin   # Chaotic AUR
