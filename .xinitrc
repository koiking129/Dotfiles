#!/bin/sh

# DPI
if xrandr --listactivemonitors | grep -Ev "(^Monitors)|(eDP$)"
then  # Desktop
    echo "Xft.dpi: 144" | xrdb -merge
else  # Laptop
    echo "Xft.dpi: 192" | xrdb -merge
fi
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# Multiple displays
autorandr -c

# Compositor
picom -b

# Wallpaper
nitrogen --random $HOME/Pictures/Wallpapers --set-zoom-fill

# Status bar
slstatus &

# Network Manager
nm-applet &

# Proxy
/opt/Clash/cfw &

# Prevent screen from blanking after inactivity
xset s off
xset dpms 0 0 0

# Screen lock
xautolock \
    -time 20 \
    -locker "grep RUNNING /proc/asound/card*/pcm*/sub*/status > /dev/null || $HOME/.local/bin/betterls" \
    -killtime 60 -killer "systemctl suspend" &

# Email
birdtray &

# Hotkey daemon
sxhkd &

# Keyd app daemon
keyd-application-mapper -d

# Screenshot daemon
flameshot &

# Bukuserver
BUKUSERVER_PER_PAGE=100 $HOME/.local/bin/bukuserver run &

# Syncthing
$HOME/.local/bin/syncthing --no-browser &

# Enable IME support in the kitty terminal
# the value can only be `ibus` (also work with Fcitx5)
export GLFW_IM_MODULE=ibus

# Start window manager
dwm

