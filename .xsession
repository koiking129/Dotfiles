#!/bin/sh

# DPI
if xrandr --listactivemonitors | grep -Ev "(^Monitors)|(eDP$)"
then  # Desktop
    echo "Xft.dpi: 144" | xrdb -merge
else  # Laptop
    echo "Xft.dpi: 192" | xrdb -merge
fi

# Multiple displays
autorandr -c

# Compositor
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

# Prevent screen from blanking after inactivity
xset s off
xset dpms 0 0 0

# Screen lock
xautolock \
    -time 10 \
    -locker "grep RUNNING /proc/asound/card*/pcm*/sub*/status > /dev/null || $HOME/.local/bin/betterls" \
    -killtime 60 -killer "systemctl suspend" &

# Email
birdtray &

# Hotkey daemon
sxhkd &

# Start window manager
dwm

