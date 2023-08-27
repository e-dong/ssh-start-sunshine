#!/bin/bash

width=2228
height=1668
refresh_rate=60
display_output="DP-0"

modeline=$(cvt ${width} ${height} ${refresh_rate} | awk 'FNR == 2')
xrandr_mode_str=$(echo ${modeline} | sed 's/Modeline //')
mode_name=$(echo ${modeline} | awk '{ print $2 }')

echo "xrandr setting new mode ${xrandr_mode_str}"

xrandr --newmode ${xrandr_mode_str}
xrandr --addmode ${display_output} ${mode_name}

xrandr --output ${display_output} --mode ${mode_name} --pos 0x0 --rotate normal --scale 0.75

