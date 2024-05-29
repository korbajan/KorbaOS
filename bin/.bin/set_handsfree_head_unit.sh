#!/bin/bash
sleep 2 # wait for the headset to fully connect
# if `pactl` below doesn't work for you, `pacmd` instead might get you going.
sudo -u '#1000' XDG_RUNTIME_DIR=/run/user/1000 \
    pactl set-card-profile bluez_card.00_16_94_3F_E6_83 handsfree_head_unit
logger "Switched Sennheizer headset to HFP profile"


