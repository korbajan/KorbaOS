#!/bin/bash
# Printing and scanning.
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# Root: installs official-repo packages only. User: also installs AUR packages (brother-dcp1510, brscan4, samsung-unified-driver).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac cups-pdf sane-airscan system-config-printer
aur brother-dcp1510 brscan4 samsung-unified-driver
