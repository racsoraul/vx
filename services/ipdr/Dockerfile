FROM ubuntu:bionic

ARG IPDR_VERSION=0.1.5

RUN apt update && apt install -y wget

RUN cd /tmp

RUN wget -O ipdr-release.tar.gz http://localhost:8080/ipfs/QmSDrFczfqZfEmqAew3RwzUjP5ApnBSgM5fAJZg4AYwyan && \
    tar -xzf ipdr-release.tar.gz && mv ipdr /usr/local/bin

RUN echo '127.0.0.1 docker.localhost' | sudo tee -a /etc/hosts

