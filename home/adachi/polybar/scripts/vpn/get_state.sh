#!/bin/sh

target=openvpn
if pgrep -x $target >/dev/null
then
    echo "on"
else
    echo "off"
fi
