#!/usr/bin/env bash

set -o errexit

NVIDIA_DRIVER_VERSION=415

echo "Setting up your computer."
echo "This may take a while..."
echo
echo "Installing prerequisites"
sudo apt update -y && sudo apt upgrade -y
sudo apt install net-tools -y
sudo apt install openssh-server -y
sudo apt install git -y
sudo apt install git-lfs -y

echo "Copying public key to allow ansible remote configuration"
mkdir -p "$HOME"/.ssh
cat id_rsa.pub > "$HOME"/.ssh/authorized_keys

echo "Installing nvidia drivers"
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt-get update -y
sudo apt install nvidia-driver-$NVIDIA_DRIVER_VERSION -y

echo
echo "==============="
echo "    SUCCESS"
echo "==============="
echo
echo "Rebooting system to apply nvidia drivers changes."
echo "Save your work and close your applications."
echo -n "Continue (yes/no): "
read -rn 1 choice
echo
if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
  echo "Ok. Rebooting... Bye!"
  sleep 1
  sudo reboot
elif [ "$choice" == "n" ] || [ "$choice" == "N" ]; then
  echo "Make sure to reboot later to apply changes."
else
  echo "Invalid answer."
  echo "Make sure to reboot later to apply changes."
fi
