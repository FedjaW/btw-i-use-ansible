# How to

Make sure you have

- git
- ansible

installed, then run:
`ansible-pull -U https://github.com/FedjaW/btw-i-use-ubuntu`

Grab a coffee, come back and voilà, your development environment is set up and ready to use

## For debugging

- cd into debug
- run `./build_dockers.sh`
- run `./start_dockers.sh`

It will automatically execute `asible-playbook local.yml`.

# Some random information I need to persist somewhere

## Max out your window management performance by using:

- i3 (for ubuntu)
- Yabai (for mac)
- bug.n (for windows)

## Cool command to inspect processes on ubuntu

execute: `zsh`

execute: `ps -o pid,ppid= -C zsh`

execute: `zsh`

execute: `ps -o pid,ppid= -C zsh`