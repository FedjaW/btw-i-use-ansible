# 1. 

in dotfiles.yaml:

- name: Copy dotfiles
  become: true
  become_user: root
  ansible.builtin.copy:
    src: .dotfiles/     ---------------    warum reicht nicht .dotfiles?
    dest: $HOME/.dotfiles
  tags:
  - dotfiles


# 2.

Was macht stow.sh?
Wie genau kann symlinked stow?

# 3. 

Ich glaube zsh theme wird nicht gesetzt. kein symlink auf .zshrc


# 4.

Primageans stow, wie funktionirt das ohne  `shell: cd $HOME/.dotfiles && chmod +x stow.sh && ./stow.sh` zu rufen

- name: Installing stow
  apt: name=stow
  tags:
    - install
    - dotfiles
    - stow
- name: Cloning .dotfiles
  ansible.builtin.git:
    repo: 'git@github.com:ThePrimeagen/.dotfiles.git'
    dest: "{{ lookup('env', 'HOME') }}/.dotfiles"
    recursive: yes
    update: yes
    accept_hostkey: yes
    version: master
  tags:
    - install
    - dotfiles
    - stow
- name: Stow dotfiles
  shell: cd $HOME/.dotfiles && ./ubuntu
  tags:
    - install
    - dotfiles
    - stow