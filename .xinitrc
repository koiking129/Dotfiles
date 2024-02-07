#!/bin/sh

# DPI
if xrandr --listactivemonitors | grep -Ev "(^Monitors)|(eDP$)"
then  # Desktop: 2560x1440 at 24 inch
    echo "Xft.dpi: 144" | xrdb -merge
else  # Laptop: 2560x1600 at 13 inch
    echo "Xft.dpi: 192" | xrdb -merge
fi

# Input Method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx5 -d

# Enable IME support in the kitty terminal
# the value can only be `ibus` (also work with Fcitx5)
export GLFW_IM_MODULE=ibus

# Multiple displays
autorandr -c

# Compositor
picom -b

# Wallpaper
_wallpaper_changer.sh &

# Status bar
slstatus &

# Network Manager
nm-applet &

# Bluetooth
blueman-applet &

# Proxy
cfw &

# Prevent screen from blanking after inactivity
xset s off
xset dpms 0 0 0

# Disable the beep sound
xset b off

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
BUKUSERVER_PER_PAGE=100 bukuserver run &

# Syncthing
syncthing --no-browser &

# Notification
dunst &

# Automounter
udiskie --smart-tray &

# Include xinitrc.d
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Start window manager
dwm
