#!/bin/bash

# Author: Friedrich
# Date Created: 20.3.2024
# Date Modified: 22.3.2024
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
    if ! dpkg -s ansible &>/dev/null; then
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
        ubuntu_setup
        ;;
    Darwin)
        mac_setup
        ;;
    *)
    echo "Unsupported OS"
esac

repopath=$(pwd)
echo "Cloning repository into $repopath"
git clone --quiet --filter=blob:none https://github.com/FedjaW/btw-i-use-ansible.git $repopath 2>/dev/null

echo "Running playbook"
ansible-playbook "$REPO_PATH/local.yml" -K
echo "Playbook done"