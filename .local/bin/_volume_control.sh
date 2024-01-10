#!/usr/bin/bash

# Control the volume
amixer set Master "$@"

# Get the volume status
_volume="$(amixer get Master | tail -1 | awk -F '[][%]' '{print $2}')%"
_toggle=$(amixer get Master | tail -1 | awk -F '[][]' '{print $4}')
[ "$_toggle" = "off" ] && _vol="off" || _vol="$_volume"

# Notification
dunstify "Volume: $_vol" -h int:value:$_volume -r 2

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change
