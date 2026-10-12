#!/bin/bash
# Printing and scanning.
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac cups-pdf sane-airscan system-config-printer
aur brother-dcp1510 brscan4 samsung-unified-driver
