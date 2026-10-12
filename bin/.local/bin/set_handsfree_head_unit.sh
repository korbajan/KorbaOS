#!/usr/bin/env bash
# Switch a Bluetooth audio card to its hands-free (HFP/HSP) profile, e.g. to use the headset mic.
# Usage: set_handsfree_head_unit.sh [card-name] [profile]
#   card-name  a bluez card from `pactl list cards short`; asked for if there is more than one
#   profile    defaults to the first available of: headset-head-unit-msbc, headset-head-unit, handsfree_head_unit
# Run it as your own user, after the device is connected.

set -euo pipefail

command -v pactl >/dev/null || { echo "pactl not found" >&2; exit 1; }

mapfile -t cards < <(pactl list cards short | awk '$2 ~ /^bluez_card\./ {print $2}')
((${#cards[@]})) || { echo "no connected Bluetooth audio card (pactl list cards short)" >&2; exit 1; }

card="${1:-}"
if [[ -z $card ]]; then
    if ((${#cards[@]} == 1)); then
        card="${cards[0]}"
    else
        PS3="Bluetooth card: "
        select card in "${cards[@]}"; do [[ -n $card ]] && break; done
    fi
fi
printf '%s\n' "${cards[@]}" | grep -qxF -- "$card" || { echo "not a connected bluez card: $card" >&2; exit 1; }

profile="${2:-}"
if [[ -z $profile ]]; then
    available="$(pactl list cards | awk -v c="$card" '
        $1 == "Name:" { in_card = ($2 == c) }
        in_card && /^\t+Profiles:/ { in_prof = 1; next }
        in_card && in_prof && /^\t+[^\t ]+: / { sub(/:$/, "", $1); print $1; next }
        in_prof && !/^\t\t/ { in_prof = 0 }')"
    for p in headset-head-unit-msbc headset-head-unit handsfree_head_unit; do
        if grep -qxF -- "$p" <<<"$available"; then profile="$p"; break; fi
    done
    [[ -n $profile ]] || { echo "no hands-free profile on $card; available:" >&2; echo "$available" >&2; exit 1; }
fi

pactl set-card-profile "$card" "$profile"
echo "$card -> $profile"
