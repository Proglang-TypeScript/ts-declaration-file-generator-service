#!/bin/bash

ROOT_PROJECT_PATH=$1
RELATIVE_PATH_TO_JS_FILE=index.js

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ "${ROOT_PROJECT_PATH:0:1}" = "/" ]; then
	ABS_ROOT_PROJECT_PATH=ROOT_PROJECT_PATH
else
	ABS_ROOT_PROJECT_PATH="$(pwd)/$ROOT_PROJECT_PATH"
fi

FILE_IN_CONTAINER="/tmp/runtimeAnalysis"

docker run -it \
	-a stdout \
	-v $ABS_ROOT_PROJECT_PATH:$FILE_IN_CONTAINER  \
	master-mind-wp3 \
	$FILE_IN_CONTAINER/$RELATIVE_PATH_TO_JS_FILE