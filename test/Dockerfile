FROM ubuntu:22.04
ENV  DEBIAN_FRONTEND=noninteractive
RUN apt update 
RUN apt install -y software-properties-common
RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt install -y ansible
RUN apt-get -y install git
RUN apt-get -y install curl

WORKDIR /usr/local/bin
COPY . . 

CMD [ "sh", "-c", "ansible-playbook local.yml --tags \"zsh,dotfiles,system\"; zsh" ]
