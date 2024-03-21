#!/bin/bash

REPO_DIR=$(./read_repodir.sh)
echo "Run docker"
docker run -e REPO_DIR_ENV=$REPO_DIR -it --rm virgin_machine 