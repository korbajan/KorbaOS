#!/bin/bash
# Containers, Kubernetes and QEMU/KVM virtual machines (libvirt + virt-manager, NAT network, SPICE display).
# Run as a normal user (uses sudo). Log out and back in afterwards for the libvirt group to apply.
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac docker docker-buildx docker-compose lazydocker podman podman-compose buildah skopeo k9s kubectl kind helm

# edk2-ovmf: UEFI firmware for guests; dnsmasq: DHCP/DNS for libvirt's default NAT network
pac qemu-desktop libvirt virt-manager virt-viewer dnsmasq edk2-ovmf dmidecode

sudo usermod -aG libvirt "$USER"
sudo systemctl enable --now libvirtd.socket
sudo virsh net-autostart default
sudo virsh net-info default | grep -q '^Active:.*yes' || sudo virsh net-start default
