#!/bin/bash
# Cisco Packet Tracer.
# The AUR package does not download anything: its PKGBUILD uses a local:// source, i.e. it only
# repackages the Cisco .deb (CiscoPacketTracer_<ver>_Ubuntu_64bit.deb), which is distributed behind a
# netacad.com login (Resources > Download Packet Tracer > "Ubuntu 64bit"). That one file must be
# downloaded by hand; this script does the rest and makepkg verifies its sha512.
# usage: ./packettracer.sh [path/to/the.deb]   (default: ~/Downloads; not as root, makepkg refuses)
set -euo pipefail

die() { echo "error: $*" >&2; exit 1; }
[[ $EUID -ne 0 ]] || die "run as a normal user"

work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
cd "$work"
paru -G packettracer
cd packettracer

# the file name the PKGBUILD expects, e.g. local://CiscoPacketTracer_901_Ubuntu_64bit.deb
deb=$(sed -n "s|.*'local://\([^']*\)'.*|\1|p" PKGBUILD)
[[ -n $deb ]] || die "PKGBUILD has no local:// source; has the AUR package changed?"

src=${1:-}
if [[ -z $src && -f ~/Downloads/$deb ]]; then src=~/Downloads/$deb; fi
[[ -f ${src:-} ]] || die "$deb not found. Download it from https://www.netacad.com/resources/lab-downloads and pass its path, or put it in ~/Downloads"

cp "$src" "$deb"
makepkg -si   # also verifies the sha512 from the PKGBUILD
