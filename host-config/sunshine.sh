#!/bin/bash

export DISPLAY=:0

width=${1:-1920}
height=${2:-1080}
dpi=${3:-144}

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
echo "DPI: ${dpi}"
echo "Xft.dpi: ${dpi}" > $HOME/.Xresources
  

# Startup any apps
#steam &>/dev/null &
#firefox &>/dev/null &
#kdeconnect-app &>/dev/null &

# Check if sunshine is already running
ps -e | grep -e .*sunshine$ >/dev/null
[[ $? -ne 0 ]] && {
  #sudo ${HOME}/scripts/sunshine-setup.sh
  echo "Starting Sunshine!"
  sunshine > /dev/null &
  [[ $? -eq 0 ]] && {
      echo "Sunshine started successfully"
  } || echo "Sunshine failed to start"
} || echo "Sunshine is already running"

