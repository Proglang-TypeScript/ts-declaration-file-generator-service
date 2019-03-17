#!/bin/bash

JS_PROJECT=$1
MODULE_NAME=$2
RESULTS_DIR=$3

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT_PATH=$SCRIPT_PATH/..

RUNTIME_INFO=$ROOT_PATH/tmp/output.json

GET_RUNTIME_INFORMATION="$ROOT_PATH/cli/getRunTimeInformation.sh"
GENERATE_DECLARATION_FILE="$ROOT_PATH/cli/generateDeclarationFile.sh"

echo "Generating runtime information ..."
$GET_RUNTIME_INFORMATION $JS_PROJECT $RUNTIME_INFO

echo "Generating declaration file ..."
$GENERATE_DECLARATION_FILE $RUNTIME_INFO $MODULE_NAME $RESULTS_DIR

rm -f RUNTIME_INFO