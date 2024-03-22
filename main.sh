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
    brew list | grep ansible &>/dev/null || echo "Installing ansible" || brew install ansible
}

set -e # exit on error

OS=$(uname -s)
case $OS in 
    Linux)
        # ubuntu_setup
        ;;
    Darwin)
        # mac_setup
        ;;
    *)
    echo "Unsupported OS"
esac

repository_name=btw-i-use-ansible
current_dirname=$(basename "$PWD")
if [[ $current_dirname == $repository_name ]]; then
    checkout_path=$(pwd)
else
    checkout_path=$(pwd)/$repository_name
fi

if ! [[ -d "$checkout_path" ]]; then
    echo "Cloning repository into $checkout_path"
    git clone --filter=blob:none https://github.com/FedjaW/${repository_name}.git
fi

echo "Running playbook"
ansible-playbook "$checkout_path/local.yml" -K
echo "Playbook done"