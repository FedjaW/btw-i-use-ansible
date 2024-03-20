# Usage

**Run**

```SHELL
bash -c $(curl -fsSL https://raw.githubusercontent.com/FedjaW/btw-i-use-ansible/main/main.sh)
```

**Or**

Make sure you have `git` and `ansible` installed, then run:

```SHELL
ansible-pull -U https://github.com/FedjaW/btw-i-use-ansible
```

**Grab a coffee, come back and voilà, your development environment is set up and ready to use.**

## For debugging

- you need to have `docker` installed

- cd into debug
- run `./build_dockers.sh`
- run `./start_dockers.sh`

It will automatically execute `./main.sh --debug`.

# Something to read

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

## Cool command to inspect processes on ubuntu

execute: `zsh`\
execute: `ps -o pid,ppid= -C zsh`\
execute: `zsh`\
execute: `ps -o pid,ppid= -C zsh`\
execute: `exit`\
execute: `ps -o pid,ppid= -C zsh`\
execute: `exit`\
execute: `ps -o pid,ppid= -C zsh`
