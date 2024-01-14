#!/usr/bin/bash

# Get the active window
ActiveWinID=$(xdotool getactivewindow)
ActiveWinClassname=$(xdotool getwindowclassname $ActiveWinID)

# Use the second part of WM_CLASS
AppEnabled=("okular" "Evince")

if [[ "${AppEnabled[@]}" =~ "$ActiveWinClassname" ]] ; then
    # Replace \n with the white space
    xsel -op | tr "\n" " " | sed "s/-\s/-/g" | xsel -ib
fi
