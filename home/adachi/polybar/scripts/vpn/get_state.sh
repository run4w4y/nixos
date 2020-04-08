#!/bin/sh

target=openvpn
if pgrep -x $target >/dev/null
then
    echo "%{F#ffffff}  %{F-}"
else
    echo "%{F#b0c0f5}  %{F-}"
fi
