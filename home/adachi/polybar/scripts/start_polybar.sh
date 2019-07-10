#!/bin/sh

# kill all other polybar instances running
killall -q polybar
# wait for them to get killed
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# start polybar
polybar -r left-bar & polybar -r right-bar &