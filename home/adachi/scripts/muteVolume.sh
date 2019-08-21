#!/bin/sh

# Arbitrary but unique message id
msgId="991049"

# Change the volume using alsa(might differ if you use pulseaudio)
amixer --quiet sset Master toggle

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }' | sed 's/%//')"
mute="$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $4 }')"
if [[ $volume == 0 || $mute == "off" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -r "$msgId" "0%" " $(getProgressString 13 "" "" 0)"
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -r "$msgId" \
    "${volume}%" "$(getProgressString 15 "" "" $volume)"
fi