FROM ubuntu:jammy as base
ENV  DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install git curl sudo
RUN apt-get install -y software-properties-common sudo wget curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential

FROM base as final
WORKDIR /usr/local/bin
COPY ./ /root/.config/btw-i-use-ansible

# tag "node" is missing because it takes to long to install
# CMD [ "sh", "-c", "ansible-playbook local.yml --tags \"zsh,dotfiles,system,scripts,nvim\"; zsh" ]
# CMD [ "sh", "-c", "ansible-playbook local.yml; zsh" ]
RUN [ "chmod", "+x", "/root/.config/btw-i-use-ansible/main.sh" ]
CMD [ "sh", "-c", "/root/.config/btw-i-use-ansible/main.sh --debug; bash" ]
