#!/bin/bash

export DISPLAY=:0

width=${1:-1920}
height=${2:-1080}
scale=${3:-1}

# Check existing X server
ps -e | grep X >/dev/null
[[ $? -ne 0 ]] && {
  echo "Starting X Server"
  startx &>/dev/null &
  [[ $? -eq 0 ]] && {
      echo "X Server started successfully"
  } || echo "X Server failed to start"
} || echo "X Server already running"

sleep 3
$HOME/scripts/set-custom-res.sh ${width} ${height} ${scale} 2>/dev/null

# Startup any apps
#steam &>/dev/null &
#firefox &>/dev/null &
#kdeconnect-app &>/dev/null &

# Check if sunshine is already running
ps -e | grep -e .*sunshine$ >/dev/null
[[ $? -ne 0 ]] && {
  sudo ${HOME}/scripts/sunshine-setup.sh
  echo "Starting Sunshine!"
  sunshine > /dev/null &
  [[ $? -eq 0 ]] && {
      echo "Sunshine started successfully"
  } || echo "Sunshine failed to start"
} || echo "Sunshine is already running"

