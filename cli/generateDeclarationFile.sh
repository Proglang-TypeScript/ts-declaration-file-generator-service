#!/bin/bash

RUNTIME_INFO=$1
MODULE_NAME=$2
RESULTS=$3

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT_PATH=$SCRIPT_PATH/..

if [ "${RUNTIME_INFO:0:1}" = "/" ]; then
	ABS_RUNTIME_INFO=$RUNTIME_INFO
else
	ABS_RUNTIME_INFO="$(pwd)/$RUNTIME_INFO"
fi

docker rm generate-declaration-file > /dev/null 2>&1
docker run \
	--name generate-declaration-file \
	-v $ABS_RUNTIME_INFO:/tmp/output.json \
	tsd-generator \
	--module-name $MODULE_NAME -i /tmp/output.json

docker cp generate-declaration-file:/usr/local/app/output/. $RESULTS
docker rm generate-declaration-file > /dev/null 2>&1