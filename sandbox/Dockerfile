FROM ubuntu:jammy AS base
ENV  DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install git curl sudo
RUN apt-get install -y software-properties-common sudo wget curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential

FROM base AS final
RUN addgroup --gid 1000 fedjaw 
RUN adduser fedjaw --uid 1000 --gid 1000 
RUN echo "fedjaw:12345" | chpasswd
RUN echo "fedjaw ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/fedjaw
USER fedjaw 

WORKDIR /btw-i-use-ansible
# Do not change WORKDIR, other you want to
# have the remote repo cloned and have that playbook ran.
# Reason is that the main.sh script looks for an repo called /btw-i-use-ansible
# if it will find one then it won't clone the repo, otherwise it will clone.
# If you want this sandbox to clone the repo change the WORKDIR and
# adapt CMD accordingly.

COPY ./ ./
CMD ["sh", "-c", "/btw-i-use-ansible/main.sh; bash"]