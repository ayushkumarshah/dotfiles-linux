#!/bin/sh
command=$SCRIPT_DIR/$BLOCK_NAME

color=#E0E0E0

[song]
command=xprop -name "Spotify Premium - Linux Preview" _NET_WM_ICON_NAME|\cut -d "\"" -f 2|cut -b 11-
label=
interval=1
color=#2ebd59

[openvpn]
command=/home/booker/.i3/scripts/openvpn
interval=1
label=

[load]
command=/home/booker/.i3/scripts/load_average
interval=1
label=

[disk]
command=/home/booker/.i3/scripts/disk
interval=1
label=

[volume]
command=/home/booker/.i3/scripts/volume 2
label= 
interval=1

[date]
command=date '+%b %d %H:%M'
interval=1
label=