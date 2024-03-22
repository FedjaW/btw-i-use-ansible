# Description

This repo contains an ansible playbook for fully automated setup of a development environment.

# Prerequisites 

This ansible playbook supports `MacOSX` and `Ubunug`.

The bare minimum you need to have on your system is `sudo`, `git`, `curl`

Make sure you have the latest packages installed:

```
# MaxOSX
brew update && brew upgrade
# Ubuntu
sudo apt-get update && sudo apt-get upgrade -y
```

# Usage

## Run *

Replace `<REPO_PATH>` with the absolut path to the desired target clone directory, e.g.: `/happypath`

```SHELL
curl -fsSL https://raw.githubusercontent.com/FedjaW/btw-i-use-ansible/main/main.sh | bash -s -- <REPO_PATH>
```

**Grab a coffee, come back and voilà, your development environment is set up and ready to use.**

\* If you don't want the script to run immediately, then clone the repo, make changes to it as you like and then run within the repo folder:

```SHELL
./main.sh
```

## For debugging

- you need to have `docker` installed

- cd into `./debug`
- run `./build-and-run-dockers.sh`

It will automatically bring up a docker container and run the ansible playbook.

## Something to read

- https://phelipetls.github.io/posts/introduction-to-ansible/
- https://github.com/TechDufus/dotfiles/tree/main
- https://github.com/logandonley/dotfiles
- https://www.devas.life/effective-neovim-setup-for-web-development-towards-2024/
- https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_conditionals.html#ansible-facts-os-family

---

# Some random information I need to persist somewhere

## Max out your window management performance by using

- i3 (for ubuntu)
- Yabai (for mac)
- bug.n (for windows)

