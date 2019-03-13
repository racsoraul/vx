#!/usr/bin/env bash

set -o errexit

NVIDIA_DRIVER_VERSION=415

echo "Setting up your computer."
echo "This may take a while..."

sudo apt update -y && apt upgrade -y
sudo apt install net-tools -y
sudo apt install openssh-server -y
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt install nvidia-driver-$NVIDIA_DRIVER_VERSION -y

echo "Rebooting system to apply nvidia drivers changes."
echo "Save your work and close your applications."
echo -n "Continue (yes/no): "
read -rn 1 choice
echo
if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
  echo "Ok. Rebooting... Bye!"
  sudo reboot
elif [ "$choice" == "n" ] || [ "$choice" == "N" ]; then
  echo "Make sure to reboot later to apply changes."
else
  echo "Invalid answer."
  echo "Make sure to reboot later to apply changes."
fi
