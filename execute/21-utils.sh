#!/bin/bash
# Standalone CLI utilities that are not part of the base shell setup.
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# Root: installs official-repo packages only. User: also installs AUR package (tty-clock).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac yt-dlp imagemagick
aur tty-clock   # Chaotic AUR
