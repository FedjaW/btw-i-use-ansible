#!/bin/bash

cd .. # <- whole repo will be the build context
echo "Start building docker image"
docker build -t virgin_machine -f debug/Dockerfile .
