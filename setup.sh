#!/usr/bin/env bash

{
  echo "USER_ID=$(id -u "${USER}")"
  echo "GROUP_ID=$(id -g "${USER}")"
} > services/.env

mkdir -p services/ipfs/data

# exporting variables of .env and other locally defined.
set -a
. services/.env
set +a

# wrappers

if [ ! -e /usr/local/bin/ipfs ]
then
  cat <<EOT | sudo tee /usr/local/bin/ipfs
  #!/usr/bin/env bash
  set -o errexit

  docker exec vx_ipfs ipfs "\$@"
EOT

  sudo chmod +x /usr/local/bin/ipfs
  sudo cp ./config/ipfs-completion.bash /etc/bash_completion.d
fi
