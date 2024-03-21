#!/bin/bash

REPO_DIR=$(cat ./config.yml | grep "repo_dir: " | sed 's/repo_dir: //')
echo $REPO_DIR # output to be used by other scripts