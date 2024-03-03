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
        PORT=5001
        fava "$HOME/Accounting/life.beancount" -p "$PORT" > /dev/null &
        URL="http://localhost:$PORT/beancount/balance_sheet/"
        dunstify "fava (life) started" "$URL"
        xdg-open "$URL" > /dev/null &
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
