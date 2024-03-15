#!/bin/bash

echo "start building docker image"

cd ..
docker build -t virgin_machine -f debug/Dockerfile .
