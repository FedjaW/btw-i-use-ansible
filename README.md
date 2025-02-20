# Description

This repo contains an ansible playbook for fully automated setup of a development environment.

## Prerequisites

This ansible playbook supports `MacOSX` and `Ubuntu`.

The bare minimum you need to have on your system is `sudo`, `git`, `curl`

Make sure you have the latest and greatest packages installed before running the playbook:

```shell
# MaxOSX
brew update && brew upgrade
# Ubuntu
sudo apt-get update && sudo apt-get upgrade -y
```

## Usage

Currently I have set my username throughout the project. Change this by find and replace to your needs.

### Run

```SHELL
# Clones repo into ./btw-i-use-ansible and runs ansible playbook
curl -fsSL https://raw.githubusercontent.com/FedjaW/btw-i-use-ansible/main/main.sh | bash
```

**Grab a coffee, come back and voilà, your development environment is set up and ready to use.**

If you don't want the script to run immediately, then clone the repo, make changes to it as you like and then run within the repo folder:

```SHELL
./main.sh
```

### For debugging

- you need to have `docker` installed

- cd into `./sandbox`
- run `./build-and-run-docker.sh`

It will automatically bring up a docker container and run the ansible playbook.

## Something to read

- <https://phelipetls.github.io/posts/introduction-to-ansible/>
- <https://github.com/TechDufus/dotfiles/tree/main>
- <https://github.com/logandonley/dotfiles>
- <https://www.devas.life/effective-neovim-setup-for-web-development-towards-2024/>
- <https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_conditionals.html#ansible-facts-os-family>
