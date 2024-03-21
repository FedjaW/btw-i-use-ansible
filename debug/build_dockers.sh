#!/bin/bash

cd .. # <- whole repo will be the build context
REPO_DIR=$(cat ./config.yml | grep "repo_dir: " | sed 's/repo_dir: //')
echo "Start building docker image"
docker build --build-arg REPO_DIR_ARG=$REPO_DIR -t virgin_machine -f debug/Dockerfile .
