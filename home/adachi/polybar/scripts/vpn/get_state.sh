#!/bin/sh

target=openvpn
if pgrep -x $target >/dev/null
then
    echo "%{F#ffffff}  %{F-}"
else
    echo "%{F#ffc9c9}  %{F-}"
fi
