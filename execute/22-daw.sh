#!/bin/bash
# Music production: DAW, plugins, guitar tools. Needs 04-audio.sh.
# Can be run as root (arch-chroot) or as a normal user (first boot, uses sudo).
# Root: installs official-repo packages only. User: also installs AUR packages (tuxguitar, guitarix.vst, neural-amp-modeler-ui-lv2, neuralrack, ratatouille).
set -euo pipefail
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/lib.sh"

pac realtime-privileges reaper reapack yabridge yabridgectl calf carla guitarix lsp-plugins surge-xt musescore \
  avldrums.lv2 gmsynth.lv2 gxplugins.lv2 setbfree setbfree-common setbfree-lv2
aur tuxguitar   # Chaotic AUR
aur guitarix.vst neural-amp-modeler-ui-lv2 neuralrack ratatouille
