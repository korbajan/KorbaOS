#!/bin/bash
# GNOME desktop.
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

# gnome group members, minus the interactive group prompt
pac $(pacman -Sgq gnome) gnome-tweaks dconf-editor extension-manager
