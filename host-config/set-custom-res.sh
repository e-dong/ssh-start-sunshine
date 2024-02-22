#!/bin/bash
width=${1:-1920}
height=${2:-1080}
refresh_rate=${3:-60}
#scale=${4:-1}

#if [[ "${width}" == "1920" && "${height}" == "1080" ]]; then
  #scale=0.9
#  exit 0
#fi

echo "args: $@"
env | grep SUNSHINE

display_output=$(xrandr | grep " primary" | awk '{ print $1 }')
modeline=$(cvt ${width} ${height} ${refresh_rate} | awk 'FNR == 2')
xrandr_mode_str=${modeline//Modeline \"*\" /}
#mode_alias="${width}x${height}_${refresh_rate}"
# Can use the following if you want the default alias "<width>x<height>_<rate>"
mode_alias=$(echo ${modeline} | awk '{ print $2 }')

echo "xrandr setting new mode ${mode_alias} ${xrandr_mode_str}"
xrandr --newmode ${mode_alias} ${xrandr_mode_str}
xrandr --addmode ${display_output} ${mode_alias}

# Reset scaling
# Apply new xrandr mode
xrandr --output ${display_output} --mode ${mode_alias} --pos 0x0 --rotate normal
$HOME/scripts/wallpaper.sh
