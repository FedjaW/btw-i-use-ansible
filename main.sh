#!/bin/bash

# Author: Friedrich
# Date Created: 20.3.2024
# Date Modified: 23.3.2024
# Weather: Dear future me, today (20.3.2024) is a wonderful
# day to work on such a beautiful script that will help me
# to setup my future machines with one command.

# Description:
# Pulls my "btw-i-use-ansible" repo,
# installs ansible and runs the playbook to
# automatically setup dotfiles
# and dev environment on a fresh machine from scratch.
# Supports MacOSX and Ubuntu only.

# Usage:
# ./main.sh

function ubuntu_setup() {
    echo "Check if Ansible is installed"
    if ! dpkg -s ansible >/dev/null 2>&1; then
        echo "Installing ansible"
        sudo apt update
        sudo apt install --yes software-properties-common
        sudo add-apt-repository --yes --update ppa:ansible/ansible
        sudo apt install ansible
    fi
}

function mac_setup() {
    echo "Check if Ansible is installed"
    brew list | grep ansible &>/dev/null || echo "Installing ansible" && brew install ansible
}

set -e # exit on error

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

REPOSITORY_NAME=btw-i-use-ansible # do not change this one!
CURRENT_DIRNAME=$(basename "$PWD") # e.g.: /my/dir/foo -> foo

if [[ $CURRENT_DIRNAME == $REPOSITORY_NAME ]]; then
    # meaning main.sh is executed in already cloned repo
    repository_path=$PWD
else
    repository_path=$PWD/$REPOSITORY_NAME
    echo "Cloning repository into $repository_path"
    git clone --filter=blob:none https://github.com/FedjaW/${REPOSITORY_NAME}.git
fi

echo "Running playbook"
ansible-playbook "$repository_path/local.yml" -K
echo "Playbook done"