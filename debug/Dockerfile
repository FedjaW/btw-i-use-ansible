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

# ARG at build time
ARG REPO_DIR_ARG=/root/.config/btw-i-use-ansible
# ENV at run time
ENV REPO_DIR_ENV=$REPO_DIR_ARG

COPY ./ $REPO_DIR_ARG

# Variable substitution
# Using the exec form doesn't automatically invoke a command shell. 
# This means that normal shell processing, such as variable substitution, doesn't happen.
# For example, RUN [ "echo", "$HOME" ] won't handle variable substitution for $HOME.
# RUN  "chmod", "+x", ${REPO_DIR}"/main.sh" ]
# see: https://docs.docker.com/reference/dockerfile/#exec-form
RUN  chmod +x ${REPO_DIR_ARG}/main.sh

# CMD sh -c ${REPO_DIR}/main.sh --debug; bash
CMD ["sh", "-c", "${REPO_DIR_ENV}/main.sh --debug; bash"]

# print the CMD of an existing image
# docker inspect -f '{{.Config.Cmd}}' <image:tag>
# docker inspect -f {{.Config.Cmd}} virgin_machine