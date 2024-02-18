FROM ubuntu:22.04
ENV ANSIBLE_VERSION 2.16
RUN apt-get update; \
    apt-get install -y gcc python3; \
    apt-get install -y python3-pip; \
    apt-get clean all
RUN pip3 install --upgrade pip; \
    pip3 install "ansible==${ANSIBLE_VERSION}"; \
    pip3 install ansible
RUN apt-get -y install git
RUN apt-get -y install curl

WORKDIR /usr/local/bin
COPY . . 

CMD [ "sh", "-c", "ansible-playbook local.yml" ]