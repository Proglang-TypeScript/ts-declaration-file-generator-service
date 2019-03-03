#!/bin/bash

INSTALL_ROOT_PATH=$1
INSTALL_ROOT_FOLDER=$INSTALL_ROOT_PATH/modules
INSTALL_FOLDER=$INSTALL_ROOT_FOLDER/ts-declaration-file-generator

mkdir -p $INSTALL_ROOT_FOLDER

rm -Rf $INSTALL_FOLDER
mkdir -p $INSTALL_FOLDER

git clone https://fcristiani@bitbucket.org/fcristiani/ts-declaration-file-generator.git $INSTALL_FOLDER
$INSTALL_FOLDER/build/build.sh