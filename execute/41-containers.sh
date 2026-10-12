#!/bin/bash
# Containers and Kubernetes.
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac docker docker-buildx docker-compose lazydocker podman podman-compose buildah skopeo k9s kubectl kind helm
