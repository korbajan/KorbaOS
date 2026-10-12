#!/bin/bash
# Standalone CLI utilities that are not part of the base shell setup.
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac yt-dlp imagemagick
aur tty-clock   # Chaotic AUR
