#!/bin/sh

target=openvpn
if pgrep -x $target >/dev/null
then
    echo "%{F#ffffff}  %{F-}"
else
    echo "%{F#ffa3c0}  %{F-}"
fi
