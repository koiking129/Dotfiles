#!/usr/bin/bash

args=($@)

[ -n "$args" ] && selection="${args[-1]}"
[ "$selection" = "Cancel" ] && exit

if [ "${args[0]}" = "OK" ]; then
    comfirmed="true"
else
    comfirmed="false"
fi

OPTIONS=("Shutdown" "Reboot" "Suspend" "Lock" "Quit")

declare -A cmd
cmd[Shutdown]="shutdown -h now"
cmd[Reboot]="reboot"
cmd[Suspend]="systemctl suspend"
cmd[Lock]="$HOME/.local/bin/betterls"
cmd[Quit]="pkill dwm"
# cmd[Cancel]="exit"

"$comfirmed" && exec ${cmd["$selection"]}

if [[ -z "$@" || ! "${OPTIONS[@]}" =~ "$selection" ]]; then
    for opt in "${OPTIONS[@]}"; do echo "${opt}"; done
else
    echo "OK $selection"
    echo "Cancel"
fi
