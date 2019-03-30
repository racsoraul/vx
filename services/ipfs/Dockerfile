FROM golang:1.12.1-stretch as builder

ENV SRC_DIR /go-ipfs

WORKDIR /

RUN git clone https://github.com/ipfs/go-ipfs.git

RUN cd $SRC_DIR && go mod download

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

FROM busybox:1-glibc

ENV SRC_DIR /go-ipfs

COPY --from=builder $SRC_DIR/cmd/ipfs/ipfs /usr/local/bin/ipfs
COPY --from=builder /tmp/su-exec/su-exec /sbin/su-exec
COPY --from=builder /tmp/tini /sbin/tini
COPY --from=builder /etc/ssl/certs /etc/ssl/certs
COPY --from=builder /lib/x86_64-linux-gnu/libdl-2.24.so /lib/libdl.so.2
COPY bin/start_ipfs.sh /usr/local/bin/start_ipfs
# COPY --from=builder $SRC_DIR/bin/container_daemon /usr/local/bin/start_ipfs
