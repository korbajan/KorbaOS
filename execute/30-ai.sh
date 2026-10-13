#!/bin/bash
# Local AI.
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

# CUDA 13 (ollama-cuda) needs compute capability >= 7.5 (Turing); everything else uses Vulkan
cc=$(nvidia-smi --query-gpu=compute_cap --format=csv,noheader 2>/dev/null | sort -V | head -1) || true
if [[ -n $cc ]] && [[ $(printf '%s\n' 7.5 "$cc" | sort -V | head -1) == 7.5 ]]; then
  ollama=ollama-cuda
else
  ollama=ollama-vulkan
fi
echo "GPU compute capability: ${cc:-none} -> $ollama"

pac "$ollama" llama-cpp ggml-vulkan llmfit
