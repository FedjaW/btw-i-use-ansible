#!/bin/bash

echo "start building docker image"

cd ..
docker build --build-arg REPO_DIR_ARG=/hallo -t virgin_machine -f debug/Dockerfile . 
