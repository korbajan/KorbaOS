#!/bin/bash
# Development tools.
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# Root: installs official-repo packages only. User: also installs AUR package (herdr-bin).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac git github-cli lazygit neovim helix go gopls delve rustup npm uv mkcert mise tree-sitter-cli \
  bash-language-server python-debugpy python-flake8 python-lsp-server mypy ruff ty
aur herdr-bin
