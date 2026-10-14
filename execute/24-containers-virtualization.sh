#!/bin/bash
# Containers, Kubernetes and QEMU/KVM virtual machines (libvirt + virt-manager, NAT network, SPICE display).
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# Root: set INSTALL_USER=<username> so the user is added to the libvirt group correctly.
#   Example: INSTALL_USER=alice bash 24-containers-virtualization.sh
# User: $USER is used automatically. Log out and back in afterwards for the libvirt group to apply.
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac docker docker-buildx docker-compose lazydocker podman podman-compose buildah skopeo k9s kubectl kind helm

# edk2-ovmf: UEFI firmware for guests; dnsmasq: DHCP/DNS for libvirt's default NAT network
pac qemu-desktop libvirt virt-manager virt-viewer dnsmasq edk2-ovmf dmidecode

# ── user-specific: add the real user to the libvirt group ───────────────────
if [[ ${EUID:-0} -eq 0 ]]; then
  # Running as root (e.g. arch-chroot). INSTALL_USER must name the target account.
  if [[ -z ${INSTALL_USER:-} ]]; then
    echo "warning: INSTALL_USER not set; skipping 'usermod -aG libvirt'. Re-run as user after first boot, or set INSTALL_USER=<username>." >&2
  else
    usermod -aG libvirt "$INSTALL_USER"
    echo "info: added $INSTALL_USER to libvirt group"
  fi
else
  sudo usermod -aG libvirt "$USER"
fi

# ── system services and network (fine in both root and user context) ─────────
if [[ ${EUID:-0} -eq 0 ]]; then
  # No running systemd/libvirtd in a chroot: only enable for boot. Re-run as user after first boot for the network.
  systemctl enable libvirtd.socket
  echo "info: re-run as a normal user after first boot to autostart the libvirt default network" >&2
else
  sudo systemctl enable --now libvirtd.socket
  sudo virsh net-autostart default
  sudo virsh net-info default | grep -q '^Active:.*yes' || sudo virsh net-start default
fi
