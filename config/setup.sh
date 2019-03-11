#!/usr/bin/env bash

{ 
  echo "USER_ID=$(id -u "${USER}")"
  echo "GROUP_ID=$(id -g "${USER}")"
  echo "HOME_SIM=/home/sim"
  echo "CURRENT_DIRECTORY=$(pwd)"
} > .env

function ipfs() {
  docker exec vx_ipfs_host ipfs "$@"
}

# ansible config

mkdir -p downloads
mkdir -p apps

# exporting variables of .env and other locally defined.
set -a
. .env
ANSIBLE_ROLES_PATH=roles
set +a