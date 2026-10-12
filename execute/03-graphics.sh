#!/bin/bash
# Graphics hardware: Vulkan drivers and tools. (The NVIDIA driver is 05-nvidia.sh.)
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac vulkan-intel vulkan-tools
