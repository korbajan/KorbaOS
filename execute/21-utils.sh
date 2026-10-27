#!/bin/bash
# Standalone CLI utilities that are not part of the base shell setup.
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# Root: installs official-repo and Chaotic AUR packages. User: also installs AUR package (tty-clock).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac yt-dlp imagemagick
pac blesh-git   # Chaotic AUR, ble.sh for bash
aur tty-clock   # Chaotic AUR
