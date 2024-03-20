#!/bin/bash

#________________________________________________________
# Author: Friedrich Wilms
# Date Created: 20.3.2024
# Date Modified: 20.3.2024
# Weather: Dear future me, today is a wonderful
# day to work on such a beautiful script that will help me
# to setup my furure notebooks with one command.

# Description:
# Pulls my "btw-i-use-ansible" repo
# installs ansible and runs the playbook to
# automatically setup my dotfiles 
# and dev environment on a fresh machine from scratch

# Usage:
# ./main.sh
# ./main.sh --debug
# Hint:
# --debug will tell ansible to use the ./local.yaml file 
# in the current directory
# instead of the one from the cloned repo
# this is handy when debugging via docker (see: debug folder)
#________________________________________________________

set -e # exit on error

# consider using getopts
# but might be an overkill for this simple usecase
debug=$1
if [[ ! -z "$debug" ]] && [[ "$debug" != "--debug" ]]; then
    echo "Usage: ./main.sh"
    echo "Usage: ./main.sh --debug"
    exit 1
fi

# setup ubuntu to run ansible tasks
function ubuntu_setup() {
    # 2>/dev/null 1>/dev/null is equal to >/dev/null 2>&1
    if ! dpkg -s ansible 2>/dev/null 1>/dev/null; then
        echo "Installing ansible"
        sudo apt update
        sudo apt install --yes software-properties-common
        sudo add-apt-repository --yes --update ppa:ansible/ansible
        sudo apt install ansible
    fi
}
 
# check os nd run setup function
source /etc/os-release
case $ID in 
    ubuntu)
        ubuntu_setup
        ;;
    *)
    echo "Unsupported OS"
esac

REPO_DIR="$HOME/.config/btw-i-use-ansible"
if ! [[ $debug == "--debug" ]]; then
    # clone or update "btw-i-use-ansible" repo
    if ! [[ -d "$REPO_DIR" ]]; then
            echo "Cloning repository into $REPO_DIR"
            git clone --quiet https://github.com/FedjaW/btw-i-use-ansible.git $REPO_DIR
    else 
        echo "Updating repository"
        git -C $REPO_DIR pull --quiet 
    fi
fi

if [[ $debug == "--debug" ]]; then
    # mkdir -p $REPO_DIR # -p: no error if existing, make parent directories as needed
    # cp -r /usr/local/bin/ $REPO_DIR/

    # will use the local.yml from within the docker container (by COPY step in Dockerfile)
    # and not the one that is pulled from the repo
    echo "Running playbook in debug mode"
    ansible-playbook "$REPO_DIR/local.yml"
else
    echo "Running playbook"
    ansible-playbook "$REPO_DIR/local.yml"
fi