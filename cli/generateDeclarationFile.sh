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

CONTAINER_NAME=$(LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c 20 ; echo)

docker rm $CONTAINER_NAME > /dev/null 2>&1
docker run \
	--name $CONTAINER_NAME \
	-v $ABS_RUNTIME_INFO:/tmp/output.json \
	tsd-generator \
	--module-name $MODULE_NAME -i /tmp/output.json

docker cp $CONTAINER_NAME:/usr/local/app/output/. $RESULTS
docker rm $CONTAINER_NAME > /dev/null 2>&1