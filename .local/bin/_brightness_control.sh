#!/usr/bin/bash

xbacklight "$@"

_brightness=$(xbacklight -get)
_icon="display-brightness-symbolic"

dunstify "Brightness: $_brightness%" -h int:value:$_brightness -i $_icon -r 1 -t 2000
