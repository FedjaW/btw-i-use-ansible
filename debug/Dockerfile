FROM ubuntu:jammy as base
ENV  DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install git curl sudo
RUN apt-get install -y software-properties-common sudo wget curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential

FROM base as final
WORKDIR /happypath
COPY ./ ./

# Variable substitution
# Using the exec form doesn't automatically invoke a command shell. 
# This means that normal shell processing, such as variable substitution, doesn't happen.
# For example, RUN [ "echo", "$HOME" ] won't handle variable substitution for $HOME.
# RUN  "chmod", "+x", ${REPO_DIR}"/main.sh" ]
# see: https://docs.docker.com/reference/dockerfile/#exec-form
RUN  chmod +x /happypath/main.sh

# CMD sh -c ${REPO_DIR}/main.sh --debug; bash
CMD ["sh", "-c", "/happypath/main.sh /happypath --debug; bash"]

# print the CMD of an existing image
# docker inspect -f '{{.Config.Cmd}}' <image:tag>
# docker inspect -f {{.Config.Cmd}} virgin_machine