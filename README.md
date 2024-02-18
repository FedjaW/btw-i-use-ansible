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