#!/bin/sh

target=openvpn
if pgrep -x $target >/dev/null
then
    echo "%{F#ffffff}  %{F-}"
else
    echo "%{F#5b6d8a}  %{F-}"
fi
