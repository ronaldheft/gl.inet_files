# Gl.iNet Router files and utilities

Remember to add the file name to `/etc/sysupgrade.conf` if you want it to survive firmware upgrades.

## 4.3
### Wifi Toggle Button Settings for 4.3 devices

https://github.com/mertonv/gl.inet_files/tree/main/4.3/etc/gl-switch.d

You can run these instructions thru `ssh` to download and set them up.

```
#!/bin/sh
#download scripts to your /etc/gl-switch.d folder directly from my git
wget -O /etc/gl-switch.d/Wi-Fi_simple.sh https://raw.githubusercontent.com/mertonv/gl.inet_files/main/4.3/etc/gl-switch.d/Wi-Fi_simple.sh
wget -O /etc/gl-switch.d/Wi-Fi_status.sh https://raw.githubusercontent.com/mertonv/gl.inet_files/main/4.3/etc/gl-switch.d/Wi-Fi_status.sh

#change files to executable
chmod 755 /etc/gl-switch.d/Wi-Fi*

#delete bad status file, better to start with an empty one in your first correct run
rm /etc/wifi_default_status
```

You might want to run them manually first. One at a time!
```
#!/bin/sh

#for fringe's script, to turn the radios off and on
sh  /etc/gl-switch.d/Wi-Fi_simple.sh off
sh  /etc/gl-switch.d/Wi-Fi_simple.sh on

#for pforma's script, to turn the radios off and on
sh /etc/gl-switch.d/Wi-Fi_status.sh off
sh /etc/gl-switch.d/Wi-Fi_status.sh on
```

If you don't get any error outputs in the `ssh` terminal and you see the radios working correctly, pick the one you like better and apply it on the _"Toggle Button Settings"_

## 4.5
### Wifi Toggle Button Settings for 4.5 devices

https://github.com/mertonv/gl.inet_files/tree/main/4.5/etc/gl-switch.d

You can run these instructions thru `ssh` to download and set them up.

```
#!/bin/sh
#download scripts to your /etc/gl-switch.d folder directly from my git
wget -O /etc/gl-switch.d/Wi-Fi_simple.sh https://raw.githubusercontent.com/mertonv/gl.inet_files/main/4.5/etc/gl-switch.d/Wi-Fi_simple.sh
wget -O /etc/gl-switch.d/Wi-Fi_status.sh https://raw.githubusercontent.com/mertonv/gl.inet_files/main/4.5/etc/gl-switch.d/Wi-Fi_status.sh

#change files to executable
chmod 755 /etc/gl-switch.d/Wi-Fi*

#delete bad status file, better to start with an empty one in your first correct run
rm /etc/wifi_default_status
```

You might want to run them manually first. One at a time!
```
#!/bin/sh

#for fringe's script, to turn the radios off and on
sh  /etc/gl-switch.d/Wi-Fi_simple.sh off
sh  /etc/gl-switch.d/Wi-Fi_simple.sh on

#for pforma's script, to turn the radios off and on
sh /etc/gl-switch.d/Wi-Fi_status.sh off
sh /etc/gl-switch.d/Wi-Fi_status.sh on
```
If you don't get any error outputs in the `ssh` terminal and you see the radios working correctly, pick the one you like better and apply it on the _"Toggle Button Settings"_
