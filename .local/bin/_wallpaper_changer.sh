#!/usr/bin/bash
# Set random wallpapers for all monitors

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
MONITOR_NUM=$(xrandr | grep -w connected | wc -l)
for ((i = 0; i < $MONITOR_NUM; i++)); do
    nitrogen --head="$i" --set-zoom-fill --random "$WALLPAPER_DIR"
done
