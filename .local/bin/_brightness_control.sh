#!/usr/bin/bash

xbacklight "$@"

dunstify "Brightness: $(xbacklight -get)%" -h int:value:$(xbacklight -get) -r 1
