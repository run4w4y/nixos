#!/bin/sh

target=openvpn
if pgrep -x $target >/dev/null
then
    vpn_stop
else
    vpn_start
fi
