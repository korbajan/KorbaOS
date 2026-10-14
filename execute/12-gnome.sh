#!/bin/bash
# GNOME desktop.
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# All packages are from official repos, so this script is fully usable as root.
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

# gnome group members, minus the interactive group prompt
mapfile -t gnome_packages < <(pacman -Sgq gnome)
[[ ${#gnome_packages[@]} -gt 0 ]] || { echo "error: 'pacman -Sgq gnome' returned no packages" >&2; exit 1; }
pac "${gnome_packages[@]}" gnome-tweaks dconf-editor extension-manager
