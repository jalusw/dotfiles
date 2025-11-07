#!/bin/bash
if nmcli -t -f ACTIVE,SSID dev wifi | grep -q '^yes'; then
    ssid=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)
    echo "$ssid"
else
    echo "offline"
fi
