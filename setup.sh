#!/usr/bin/env bash

{
  echo "USER_ID=$(id -u "${USER}")"
  echo "GROUP_ID=$(id -g "${USER}")"
} > services/.env

function ipfs() {
  docker exec vx_ipfs ipfs "$@"
}

# exporting variables of .env and other locally defined.
set -a
. services/.env
set +a