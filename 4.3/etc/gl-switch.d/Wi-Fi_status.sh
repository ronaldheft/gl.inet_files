#!/bin/sh

#original https://forum.gl-inet.com/t/feature-request-side-button-to-toggle-wifi-on-off-on-dual-radio-devices/32427/5
#source https://forum.gl-inet.com/t/feature-request-side-button-to-toggle-wifi-on-off-on-dual-radio-devices/32427/13

# Default Settings  
# File to save the wifi default status
wifi_default_status_file="/etc/wifi_default_status"

# If the wifi default status file is not (yet) available then use these defaults 
# 0 = enabled, 1 = disabled
wifi2g_default_disabled=0
wifi5g_default_disabled=0

action=$1

if [ "$action" = "off" ]; then

	# Get the default status before disabling
    wifi2g_default_disabled=$(uci get wireless.default_radio1.disabled)
    wifi5g_default_disabled=$(uci get wireless.default_radio0.disabled)
	
	# Save the default status to the wifi_default_status_file
	echo "$wifi2g_default_disabled $wifi5g_default_disabled $wifi2g_guest_disabled $wifi5g_guest_disabled" > "$wifi_default_status_file"
	
	# if wifi2g is enabled then disable it
	if [ "$wifi2g_default_disabled" -eq 0 ]; then
        uci set wireless.default_radio1.disabled='1'
        uci commit wireless
        wifi reload
        logger -p notice -t wifi-toggle "wifi2g disabled"
    fi
	
	# if wifi5g is enabled then disable it
    if [ "$wifi5g_default_disabled" -eq 0 ]; then
        uci set wireless.default_radio0.disabled='1'
        uci commit wireless
        wifi reload
        logger -p notice -t wifi-toggle "wifi5g disabled"
    fi
fi

if [ "$action" = "on" ]; then
	
	# Check if the wifi_default_status_file is available
	if [ -f "$wifi_default_status_file" ]; then
		# If the file is available read the default status from the file
		read -r wifi2g_default_disabled wifi5g_default_disabled < "$wifi_default_status_file"
	fi
	
	# if wifi2g is enabled by default then enable it
	if [ "$wifi2g_default_disabled" -eq 0 ]; then
        uci set wireless.default_radio1.disabled='0'
        uci commit wireless
        wifi reload
        logger -p notice -t wifi-toggle "wifi2g enabled"
    fi
	
	# if wifi5g is enabled by default then enable it
    if [ "$wifi5g_default_disabled" -eq 0 ]; then
        uci set wireless.default_radio0.disabled='0'
        uci commit wireless
        wifi reload
        logger -p notice -t wifi-toggle "wifi5g enabled"
    fi
fi

sleep 5
