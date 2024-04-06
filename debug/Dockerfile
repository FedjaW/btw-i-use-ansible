FROM --platform=linux/amd64 ubuntu:jammy as base
ENV  DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install git curl sudo
RUN apt-get install -y software-properties-common sudo wget curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential

FROM base as final
RUN addgroup --gid 1000 fwilms 
RUN adduser fwilms --uid 1000 --gid 1000 
RUN echo "fwilms:12345" | chpasswd
RUN echo "fwilms ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/fwilms
USER fwilms 
# Do not change WORKDIR, other you want to
# have the remote repo cloned and have that playbook ran.
# Then, ofc RUN and CMD needs to be adapted as well.
WORKDIR /btw-i-use-ansible
COPY ./ ./
CMD ["sh", "-c", "/btw-i-use-ansible/main.sh; bash"]