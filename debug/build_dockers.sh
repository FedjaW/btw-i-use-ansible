#!/bin/bash

REPO_DIR=$(./read_repodir.sh)

cd ..
echo "Start building docker image"
# docker build --build-arg REPO_DIR_ARG=$REPO_DIR -t virgin_machine -f debug/Dockerfile .
