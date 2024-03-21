#!/bin/bash

cd ..
REPO_DIR=$(cat ./config.yml | grep "repo_dir: " | sed 's/repo_dir: //') # see (*)
echo "Run docker"
docker run -e REPO_DIR_ENV=$REPO_DIR -it --rm virgin_machine 

# (*)
# my thoughts:
# this method is used 3 times across the repo, I had extracted it, but
# then I have another shell file that I have to download before main.sh can
# be executed, I want main.sh to run independetly... (yah it needs config.yml tho)

# ChatGPT rephrased my text into this banger:
# This method is utilized three times throughout the repository. Initially, I extracted it for efficiency.
# However, I encountered another shell file that must be downloaded before main.sh can execute independently. 
# Nevertheless, I aim for main.sh to run autonomously, albeit requiring config.yml.