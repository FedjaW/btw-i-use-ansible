FROM ubuntu:jammy as base
ENV  DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install git curl sudo


FROM base as final
WORKDIR /usr/local/bin
COPY ./.dotfiles/ ./.dotfiles/
COPY ./scripts/ ./scripts/
COPY ./tasks/ ./tasks/
COPY ./local.yml .
COPY ./main.sh .

# tag "node" is missing because it takes to long to install
# CMD [ "sh", "-c", "ansible-playbook local.yml --tags \"zsh,dotfiles,system,scripts,nvim\"; zsh" ]
CMD [ "sh", "-c", "./main.sh" ]
