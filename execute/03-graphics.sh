#!/bin/bash
# Graphics hardware: Vulkan drivers and tools. (The NVIDIA driver is 05-nvidia.sh.)
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# All packages are from official repos, so this script is fully usable as root.
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac vulkan-intel vulkan-tools
