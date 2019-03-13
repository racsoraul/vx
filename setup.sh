#!/usr/bin/env bash

{
  echo "VX_ROOT=/home/$USER/vx"
} > config/.env
{
  echo "USER_ID=$(id -u "${USER}")"
  echo "GROUP_ID=$(id -g "${USER}")"
} > services/.env

function ipfs() {
  docker exec vx_ipfs_host ipfs "$@"
}

# exporting variables of .env and other locally defined.
set -a
. config/.env
. services/.env
ANSIBLE_ROLES_PATH=roles
set +a

mkdir -p "$VX_ROOT/downloads"
mkdir -p "$VX_ROOT/apps"