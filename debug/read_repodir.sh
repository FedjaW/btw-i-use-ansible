#!/bin/bash

cd ..
REPO_DIR=$(cat config.cfg | grep "REPO_DIR: " | sed 's/REPO_DIR=//')
echo $REPO_DIR # output to be used by other scripts