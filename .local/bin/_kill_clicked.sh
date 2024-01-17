#!/usr/bin/bash

# Get window property or abort
FILENAME=${0##*/}
PROP=$(xprop) || exec dunstify "Abort $FILENAME"

# Get the pid and the classname of the window
PID=$(echo "$PROP" | grep PID | awk '{print $3}')
CLASSNAME=$(echo "$PROP" | grep WM_CLASS | awk -F '"' '{print $4}')

# Kill the window and send a notification
kill "$PID" && dunstify "Killed $CLASSNAME" || dunstify "Failed to kill $CLASSNAME"
