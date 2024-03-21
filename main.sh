#!/bin/bash

#________________________________________________________
# Author: Friedrich Wilms
# Date Created: 20.3.2024
# Date Modified: 21.3.2024
# Weather: Dear future me, today (20.3.2024) is a wonderful
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
REPO_DIR=$1
DEBUG=$2

if [[ ! -z "$DEBUG" ]] && [[ "$DEBUG" != "--debug" ]]; then
    echo "Usage: ./main.sh"
    echo "Usage: ./main.sh --debug"
    exit 1
fi

echo $REPO_DIR
exit 0

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

function mac_setup() {
    brew install ansible
}
 
# check os and run setup function
# source /etc/os-release # (wont't work on mac)
OS=$(uname -s) # command substituion via subshell
case $OS in 
    Linux)
        ubuntu_setup
        ;;
    Darwin)
        mac_setup
        ;;
    *)
    echo "Unsupported OS"
esac

if ! [[ $DEBUG == "--debug" ]]; then
    # clone or update "btw-i-use-ansible" repo
    if ! [[ -d "$REPO_DIR" ]]; then
            echo "Cloning repository into $REPO_DIR"
            git clone --quiet --filter=blob:none https://github.com/FedjaW/btw-i-use-ansible.git $REPO_DIR
    else 
        echo "Updating repository"
        git -C $REPO_DIR pull --quiet 
    fi
fi

echo "Running playbook..."
ansible-playbook "$REPO_DIR/local.yml" -K --extra-vars "repo_dir=$REPO_DIR"
echo "Playbook done"