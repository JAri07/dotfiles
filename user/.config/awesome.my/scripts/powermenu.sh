#!/bin/sh
chosen=$(printf "Log Out\nReboot\nShutdown" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
  "Log Out") awesome-client "awesome.quit()" ;;
  "Reboot") systemctl reboot ;;
  "Shutdown") systemctl poweroff ;;
  *) exit 1 ;;
esac
