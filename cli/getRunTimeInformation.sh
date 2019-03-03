#!/bin/bash

FILE_PATH=$1
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ "${FILE_PATH:0:1}" = "/" ]; then
	ABS_FILE_PATH=FILE_PATH
else
	ABS_FILE_PATH="$(pwd)/$FILE_PATH"
fi

FILE_IN_CONTAINER="/tmp/file.js"

docker run -it \
	-a stdout \
	-v $ABS_FILE_PATH:$FILE_IN_CONTAINER  \
	master-mind-wp3