#!/usr/bin/bash

mpc "$@"

_artist=$(mpc | head -1 | awk -F ' - ' '{print $1}')
_title=$(mpc | head -1 | awk -F ' - ' '{print $2}')
_toggle=$(mpc | sed -n 2p | awk -F '[][]' '{print $2}')
_icon="music-app-symbolic"

dunstify "${_toggle@u}" "$_title\nby $_artist" -i $_icon -r 3 -t 5000
