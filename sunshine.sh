#!/bin/bash

export DISPLAY=:0
#tmux new-session -d "startx -- $DISPLAY"
#startx -- -dpi 144 &

# Check existing X server
ps -e | grep X >/dev/null
[[ ${?} -ne 0 ]] && {
  echo "Starting X Server"
  startx &>/dev/null &
  [[ ${?} -eq 0 ]] && {
      echo "X Server started successfully"
  } || echo "X Server failed to start"
} || echo "X Server already running"

# Check if sunshine is already running
ps -e | grep -e .*sunshine$ >/dev/null
[[ ${?} -ne 0 ]] && {
  sudo ~/scripts/update-udev.sh
  sleep 1
  echo "Starting Sunshine!"
  sunshine > /dev/null &
  [[ ${?} -eq 0 ]] && {
      echo "Sunshine started successfully"
  } || echo "Sunshine failed to start"
} || echo "Sunshine is already running"

