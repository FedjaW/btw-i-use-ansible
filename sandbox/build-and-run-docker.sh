#!/usr/bin/env bash

cd .. # <- whole repo will be the build context

image_name=sandbox

echo "Start building docker image"
docker build -t $image_name -f sandbox/Dockerfile .

echo "Spin up container"
docker run -it --rm $image_name