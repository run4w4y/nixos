#!/bin/sh

# kill all other polybar instances running
killall -q polybar
# wait for them to get killed
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# start polybar
polybar -r wlan-bar &
polybar -r battery-bar &
polybar -r vpn-bar &
polybar -r language-bar & 
polybar -r date-bar &
polybar -r name-bar &
polybar -r right-bar &