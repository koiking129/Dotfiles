#!/usr/bin/bash

# Get the WeChat window
wechat_win=$(xdotool search --limit 1 --all --classname "wechat")

# Send the shortcut ctrl+alt+W to WeChat
xdotool key --window "$wechat_win" "ctrl+alt+W"
