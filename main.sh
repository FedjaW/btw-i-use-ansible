#!/bin/bash

# setup ubuntu to run ansible tasks
function ubuntu_setup() {
    # 2>/dev/null 1>/dev/null
    # is equal to
    # >/dev/null 2>&1
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

# clone or update "btw-i-use-ansible" repo
REPO_DIR="~/.config/btw-i-use-ansible"
if ! [[ -d "$REPO_DIR" ]]; then
    # TODO: clone repo
    echo "Cloning repository"
else 
    # TODO: update repo
    echo "Updating repository"
fi

ansible-playbook "$REPO_DIR/local.yml"