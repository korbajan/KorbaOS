#!/bin/bash
# Local AI.
# Run as a normal user (uses sudo).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac ollama-cuda llama-cpp ggml-vulkan llmfit
