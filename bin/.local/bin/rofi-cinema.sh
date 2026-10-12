#!/bin/bash

provider=$(printf "netflix\nhbo\ndisney\nprime" | rofi -font "JetBrainsMonoNLNerdFont Regular 13" -dmenu -i -icon-theme "Nordzy-dark" -show-icons -p 'Watch on:')

case ${provider} in
  netflix) url="netflix.com" ;;
  hbo) url="hbomax.com" ;;
  disney) url="disneyplus.com" ;;
  prime) url="primevideo.com" ;;
  *) exit ;;
esac

exec "$(dirname "$(readlink -f "$0")")/kiosk.sh" "$url"
