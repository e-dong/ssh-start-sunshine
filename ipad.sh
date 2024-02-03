#!/bin/bash

current_dir=$(readlink -f $(dirname ${BASH_SOURCE[0]}))

${current_dir}/client-config/start-stream.sh 264

