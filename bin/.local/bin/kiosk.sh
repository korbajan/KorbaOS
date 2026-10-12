#!/bin/bash

function main {
	url=$1
	browser=${KIOSK_BROWSER:-firefox}
	${browser} --new-window ${url} --kiosk
	# hyprctl dispatch movetoworkspace 1
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main "$@"
fi
