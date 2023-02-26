#!/bin/sh

picom --experimental-backends -b

# Wallpaper
nitrogen --random /usr/share/backgrounds/kali-16x9 --set-zoom-fill

# Status bar
slstatus &

# Input method
fcitx -d

# Network Manager
nm-applet &

# Proxy
/opt/clash/cfw &

# Start window manager
dwm

