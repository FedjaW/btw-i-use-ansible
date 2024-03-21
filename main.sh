#!/bin/bash

# Author: Friedrich
# Date Created: 20.3.2024
# Date Modified: 21.3.2024
# Weather: Dear future me, today (20.3.2024) is a wonderful
# day to work on such a beautiful script that will help me
# to setup my furure notebooks with one command.

# Description:
# Pulls my "btw-i-use-ansible" repo,
# installs ansible and runs the playbook to
# automatically setup dotfiles
# and dev environment on a fresh machine from scratch.
# Supports MacOSX and Ubuntu.

# Usage:
# ./main.sh <REPO_PATH_TO_CLONE_TO>
# ./main.sh <REPO_PATH_TO_CLONE_TO> --debug

function ubuntu_setup() {
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

function print_usage_and_exit() {
    echo "Usage: ./main.sh <repo_path>"
    echo "Usage: ./main.sh <repo_path> --debug"
    exit 1
}

set -e # exit on error

# consider using getopts
# but might be an overkill for this simple usecase
REPO_DIR=$1
DEBUG=$2

if [[ $REPO_DIR == "--debug" ]]; then
    print_usage_and_exit
fi

if  [[ ! -z "$DEBUG" ]] && [[ "$DEBUG" != "--debug" ]]; then
    print_usage_and_exit
fi

# source /etc/os-release # (wont't work on mac)
OS=$(uname -s)
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

# in debug mode, dockerfile will copy sources into container
if ! [[ $DEBUG == "--debug" ]]; then
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
