#!/bin/bash

cd .. # <- whole repo will be the build context

image_name=virgin_machine

echo "Start building docker image"
docker build -t $image_name -f debug/Dockerfile .

echo "Spin up container"
docker run -it --rm $image_name