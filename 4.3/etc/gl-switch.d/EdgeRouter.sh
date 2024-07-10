#!/bin/sh

# 2023-07-25
# /etc/gl-switch.d/
# uci show wireless
# source: https://forum.gl-inet.com/t/feature-req-wifi-on-off-with-side-switch/2896/41

action=$1

if [ "$action" = "on" ]; then
        #Disable Drop-in Gateway
        uci set edgerouter.global.enabled='0'
        logger -p notice -t edgerouter-toggle "Drop-in Gateway OFF"
        
        #Enable Repeater
        uci set repeater.@main[0].disabled='0'
        uci commit repeater
        /etc/init.d/repeater restart
        logger -p notice -t repeater-toggle "Repeater Enabled"
        
        #Enable Radios
        uci set wireless.default_radio0.disabled='0'
        uci set wireless.default_radio1.disabled='0'
        uci set wireless.sta.disabled='1'
        uci commit wireless
        wifi reload
        logger -p notice -t wifi-toggle "Radios Enabled"
fi

if [ "$action" = "off" ]; then
        #Disable Repeater
        uci set repeater.@main[0].disabled='1'
        uci commit repeater
        /etc/init.d/repeater restart
        logger -p notice -t repeater-toggle "Repeater Disabled"
        
        #Disable Radios
        uci set wireless.default_radio0.disabled='1'
        uci set wireless.default_radio1.disabled='1'
        uci set wireless.sta.disabled='1'
        uci commit wireless
        wifi reload
        logger -p notice -t wifi-toggle "Radios Disabled"
        
        #Enable Drop-in Gateway
        uci set edgerouter.global.enabled='1'
        logger -p notice -t edgerouter-toggle "Drop-in Gateway ON"

fi

exit 0
