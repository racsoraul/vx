FROM golang:1.12.1-stretch as builder

ENV SRC_DIR /go-ipfs

WORKDIR /

RUN git clone https://github.com/ipfs/go-ipfs.git

RUN cd $SRC_DIR && go mod download

RUN cd $SRC_DIR && make build

ENV SUEXEC_VERSION v0.2
ENV TINI_VERSION v0.16.1
RUN set -x \
  && cd /tmp \
  && git clone https://github.com/ncopa/su-exec.git \
  && cd su-exec \
  && git checkout -q $SUEXEC_VERSION \
  && make \
  && cd /tmp \
  && wget -q -O tini https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini \
  && chmod +x tini

RUN apt-get update && apt-get install -y ca-certificates

FROM ubuntu:18.04

ENV SRC_DIR /go-ipfs

COPY --from=builder $SRC_DIR/cmd/ipfs/ipfs /usr/local/bin/ipfs
COPY --from=builder /tmp/su-exec/su-exec /sbin/su-exec
COPY --from=builder /tmp/tini /sbin/tini
COPY --from=builder /etc/ssl/certs /etc/ssl/certs
COPY --from=builder /lib/x86_64-linux-gnu/libdl-2.24.so /lib/libdl.so.2
COPY bin/start_ipfs.sh /usr/local/bin/start_ipfs
COPY bin/ipdr_1.3 /usr/local/bin/ipdr

# Swarm TCP; should be exposed to the public
EXPOSE 4001
# Daemon API; must not be exposed publicly but to client services under you control
EXPOSE 5001
# Web Gateway; can be exposed publicly with a proxy, e.g. as https://ipfs.example.org
EXPOSE 8080
# Swarm Websockets; must be exposed publicly when the node is listening using the websocket transport (/ipX/.../tcp/8081/ws).
EXPOSE 8081

ENV IPFS_PATH /data/ipfs

RUN mkdir -p $IPFS_PATH

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupadd -g ${GROUP_ID} ipfs && \
    useradd -m -l -u ${USER_ID} -g ipfs ipfs && \
    echo "ipfs:ipfs" | chpasswd && adduser ipfs sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    chown ipfs:ipfs $IPFS_PATH

RUN echo '127.0.0.1 docker.localhost' | tee -a /etc/hosts

USER ipfs

VOLUME $IPFS_PATH

# The default logging level
ENV IPFS_LOGGING ""