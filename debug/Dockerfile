FROM --platform=linux/amd64 ubuntu:jammy as base
ENV  DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install git curl sudo
RUN apt-get install -y software-properties-common sudo wget curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential

FROM base as final
# Do not change WORKDIR, other you want to
# have the remote repo cloned and have that playbook ran.
# Then, ofc RUN and CMD needs to be adapted as well.
WORKDIR /btw-i-use-ansible
COPY ./ ./
RUN ["chmod", "+x", "/btw-i-use-ansible/main.sh"]
CMD ["sh", "-c", "/btw-i-use-ansible/main.sh; bash"]