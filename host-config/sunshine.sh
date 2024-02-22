#!/bin/bash

export DISPLAY=:0

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
 

# Startup any apps
#steam &>/dev/null &
#firefox &>/dev/null &
#kdeconnect-app &>/dev/null &

# Check if sunshine is already running
ps -e | grep -e .*sunshine$ >/dev/null
[[ $? -ne 0 ]] && {
  echo "Starting Sunshine!"
  sunshine > /dev/null &
  [[ $? -eq 0 ]] && {
      echo "Sunshine started successfully"
  } || echo "Sunshine failed to start"
} || echo "Sunshine is already running"

