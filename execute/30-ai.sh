#!/bin/bash
# Local AI.
# Run as a normal user after first boot (uses sudo); skipped as root because backend selection needs nvidia-smi.
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

# GPU detection needs a booted system with the NVIDIA driver loaded, which a chroot lacks.
if [[ ${EUID:-0} -eq 0 ]]; then
  echo "info: skipping 30-ai.sh as root (nvidia-smi can't pick the backend in a chroot); re-run as a normal user after the driver is loaded" >&2
  exit 0
fi

# CUDA 13 (ollama-cuda) needs compute capability >= 7.5 (Turing); everything else uses Vulkan
cc=$(nvidia-smi --query-gpu=compute_cap --format=csv,noheader 2>/dev/null | sort -V | head -1) || true
if [[ -n $cc ]] && [[ $(printf '%s\n' 7.5 "$cc" | sort -V | head -1) == 7.5 ]]; then
  ollama=ollama-cuda
else
  ollama=ollama-vulkan
fi
echo "GPU compute capability: ${cc:-none} -> $ollama"

pac "$ollama" llama-cpp ggml-vulkan llmfit
