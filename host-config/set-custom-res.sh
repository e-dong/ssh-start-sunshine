#!/bin/bash

width=${1:-1920}
height=${2:-1080}
scale=${3:-1}

refresh_rate=120
display_output="DP-0"
# Reset scaling
xrandr --output ${display_output} --scale 1

mode_alias="${width}x${height}"

modeline=$(cvt ${width} ${height} ${refresh_rate} | awk 'FNR == 2')
xrandr_mode_str=${modeline//Modeline \"*\" /}
#mode_name=$(echo ${modeline} | awk '{ print $2 }')

echo "xrandr setting new mode ${mode_alias} ${xrandr_mode_str}"

xrandr --newmode ${mode_alias} ${xrandr_mode_str}
xrandr --addmode ${display_output} ${mode_alias}

xrandr --output ${display_output} --primary --mode ${mode_alias} --pos 0x0 --rotate normal --scale ${scale}
$HOME/scripts/wallpaper.sh

