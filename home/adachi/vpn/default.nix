action:
package:

if action == "start" then
''
#!/bin/sh

target=openvpn
msg_id=991040
if pgrep -x $target >/dev/null
then
    dunstify -a "VPN" -u low -r $msg_id \
        "on" "VPN is already running"
else
    dunstify -a "VPN" -u low -r $msg_id \
        "on" " <b>VPN</b> - on"
    sudo ${package}/bin/openvpn --config ${toString ./config.ovpn} &
fi
''
else
''
#!/bin/sh

target=openvpn
msg_id=991040
if pgrep -x $target >/dev/null
then
    sudo ${package}/bin/killall $target
    dunstify -a "VPN" -u low -r $msg_id \
        "off" " <b>VPN</b> - off"
else
    dunstify -a "VPN" -u low -r $msg_id \
        "off" "No VPN is currently running"
fi
''
