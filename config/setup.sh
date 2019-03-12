#!/usr/bin/env bash

{
  echo "USER_ID=$(id -u "${USER}")"
  echo "GROUP_ID=$(id -g "${USER}")"
  echo "HOME_SIM=/home/sim"
  echo "VX_ROOT=/home/$USER/vx"
} > .env

function ipfs() {
  docker exec vx_ipfs_host ipfs "$@"
}

# exporting variables of .env and other locally defined.
set -a
. .env
ANSIBLE_ROLES_PATH=roles
set +a

mkdir -p "$VX_ROOT/downloads"
mkdir -p "$VX_ROOT/apps"