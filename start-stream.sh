#!/bin/bash

ssh_args="eric@192.168.1.3"

check_host(){
	result=1
	while [[ $result -ne 0 ]]
	do
		echo "checking host..."
		ssh $ssh_args "exit 0" 2>/dev/null
		result=$?
		[[ $result -ne 0 ]] && echo "Failed to ssh to $ssh_args, with exit code $result"
		sleep 2
	done
	echo "Host is ready for streaming!"
}

start_stream(){
	echo "Starting sunshine server on host..."
	echo "Start moonlight on your client of choice"
	ssh $ssh_args "~/scripts/sunshine.sh &" 
}

cleanup(){
	ssh $ssh_args "pkill -ef sunshine"
	ssh $ssh_args "pkill -ef X"
}


check_host
start_stream

# Doing ctrl + c will continue the script and activate the cleanup
#cleanup

