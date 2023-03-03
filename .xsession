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
xautolock -time 10 -locker $HOME/.local/bin/betterls &

# Start window manager
dwm

