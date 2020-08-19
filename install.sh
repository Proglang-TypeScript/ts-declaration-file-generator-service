#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
INSTALLERS=$SCRIPT_PATH/install

VERSION=v1.1

$INSTALLERS/master-mind/install.sh $SCRIPT_PATH $VERSION
$INSTALLERS/ts-declaration-file-generator/install.sh $SCRIPT_PATH $VERSION

rm -rf $SCRIPT_PATH/tmp
mkdir $SCRIPT_PATH/tmp