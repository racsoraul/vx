FROM ipfs/go-ipfs:latest

USER root

RUN wget -O ipdr_1.3.tar.gz https://github.com/miguelmota/ipdr/releases/download/v0.1.3/ipdr_0.1.3_linux_amd64.tar.gz

RUN tar -xvzf ipdr_1.3.tar.gz \
    && mv ipdr /usr/local/bin

RUN echo "127.0.0.1 docker.localhost" | tee -a /etc/hosts