#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
INSTALLERS=$SCRIPT_PATH/install

$INSTALLERS/master-mind/install.sh $SCRIPT_PATH
$INSTALLERS/ts-declaration-file-generator/install.sh $SCRIPT_PATH

rm -rf results
mkdir results

rm -rf tmp
mkdir tmp