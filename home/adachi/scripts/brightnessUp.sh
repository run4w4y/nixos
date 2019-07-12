#!/bin/sh

msgId="991049"

xbacklight -inc 10 > /dev/null

value="$(xbacklight)"
dunstify -a "changeBrightness" -u low -r "$msgId" \
    "${value}" "$(getProgressString 15 "" "" $value)"
