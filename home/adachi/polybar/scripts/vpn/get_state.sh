#!/bin/sh

target=openvpn
if pgrep -x $target >/dev/null
then
    echo "%{F#ffffff}  %{F-}"
else
    echo "%{F#73b4c7}  %{F-}"
fi
