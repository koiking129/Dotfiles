#!/usr/bin/bash

case "$*" in
    "sxhkd")
        # Reload sxhkd or start sxhkd
        pkill -usr1 -x sxhkd || (sxhkd > /dev/null &)
        [ $? -eq 0 ] && notify-send "sxhkd reloaded" "PID $(pgrep sxhkd)"
        ;;
    "keyd-application-mapper")
        pkill keyd-app
        keyd-application-mapper -d > /dev/null
        [ $? -eq 0 ] && notify-send "keyd-application-mapper reloaded" "PID $(pgrep keyd-app)"
        ;;
    "fava -> life")
        fava "$HOME/Accounting/life.beancount" -p 5001 > /dev/null &
        [ $? -eq 0 ] && notify-send "fava -> life started" "PID $(pgrep fava | head -1)"
        ;;
    "Random wallpaper")
        _wallpaper_changer.sh > /dev/null &
        ;;
    "")
        echo "sxhkd"
        echo "keyd-application-mapper"
        echo "fava -> life"
        echo "Random wallpaper"
        ;;
esac
