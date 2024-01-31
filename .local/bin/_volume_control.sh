#!/usr/bin/bash

# Control the volume
amixer set Master "$@"

# Get the volume status
_volume="$(amixer get Master | tail -1 | awk -F '[][%]' '{print $2}')%"
_toggle=$(amixer get Master | tail -1 | awk -F '[][]' '{print $4}')
[ "$_toggle" = "off" ] && _vol="off" || _vol="$_volume"

# Icon
if [ "$_vol" = "off" ] ; then
    _icon="audio-volume-muted-symbolic"
else
    _icon="audio-volume-medium-symbolic"
fi

# Notification
dunstify "Volume: $_vol" -h int:value:$_volume -i $_icon -r 2 -t 2000

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change
