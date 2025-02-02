#!/bin/sh

# 2023-07-25
# /etc/gl-switch.d/
# uci show wireless
# source: https://forum.gl-inet.com/t/feature-req-wifi-on-off-with-side-switch/2896/41

action=$1

if [ "$action" = "on" ]; then
        uci set wireless.guest5g.disabled='0'
        uci set wireless.guest2g.disabled='0'
        uci commit wireless
        wifi reload
        logger -p notice -t wifi-toggle "radios for guest enabled"
fi

if [ "$action" = "off" ]; then
        uci set wireless.guest5g.disabled='1'
        uci set wireless.guest2g.disabled='1'
        uci commit wireless
        wifi reload
        logger -p notice -t wifi-toggle "radios for guest disabled"
fi

exit 0
