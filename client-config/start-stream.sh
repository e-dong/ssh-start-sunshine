#!/bin/bash

ssh_args="eric@192.168.1.3"

width=${1:-1920}
height=${2:-1080}
dpi=${3:-144}

check_ssh(){
  result=1
  while [[ $result -ne 0 ]]
  do
    echo "checking host..."
	ssh $ssh_args "exit 0" 2>/dev/null
	result=$?
	[[ $result -ne 0 ]] && {
        echo "Failed to ssh to $ssh_args, with exit code $result"
    }
    sleep 3
  done
  echo "Host is ready for streaming!"
}

start_stream(){
  echo "Starting sunshine server on host..."
  echo "Start moonlight on your client of choice"
  ssh -f $ssh_args "~/scripts/sunshine.sh ${width} ${height} ${dpi} &" 
}

check_ssh
start_stream
exit_code=${?}

sleep 5
exit ${exit_code}


