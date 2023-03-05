#!/bin/sh

picom --experimental-backends -b

# Wallpaper
nitrogen --random $HOME/Pictures/Wallpapers --set-zoom-fill

# Status bar
slstatus &

# Input method
fcitx -d

# Network Manager
nm-applet &

# Proxy
/opt/clash/cfw &

# Screen lock
xautolock \
    -time 10 \
    -locker "grep RUNNING /proc/asound/card*/pcm*/sub*/status > /dev/null || $HOME/.local/bin/betterls" \
    -killtime 60 -killer "systemctl suspend" &

# Start window manager
dwm

