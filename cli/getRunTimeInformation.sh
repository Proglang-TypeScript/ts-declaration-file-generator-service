#!/bin/bash

ROOT_PROJECT_PATH=$1
RUNTIME_INFO=$2
RELATIVE_PATH_TO_JS_FILE=index.js

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ "${ROOT_PROJECT_PATH:0:1}" = "/" ]; then
	ABS_ROOT_PROJECT_PATH=ROOT_PROJECT_PATH
else
	ABS_ROOT_PROJECT_PATH="$(pwd)/$ROOT_PROJECT_PATH"
fi

FILE_IN_CONTAINER="/tmp/runtimeAnalysis"

docker rm get-run-time-information > /dev/null 2>&1
docker run \
	--name get-run-time-information \
	-v $ABS_ROOT_PROJECT_PATH:$FILE_IN_CONTAINER  \
	-v $SCRIPT_PATH/blacklistedModules.json:/tmp/blacklistedModules.json \
	master-mind-wp3 \
	$FILE_IN_CONTAINER/$RELATIVE_PATH_TO_JS_FILE \
	/tmp/blacklistedModules.json \
	1> $RUNTIME_INFO

docker rm get-run-time-information > /dev/null 2>&1