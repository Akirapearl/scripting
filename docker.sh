#!/bin/bash
#
# THIS IS A SCRIPT INTENDED TO BE USED ONLY ON DEBIAN INSTALLATIONS, IT HAS BEEN
# TESTED FOR DEBIAN 12 IN JUNE 2024, UPDATE TBD, USE IT AT YOUR OWN RISK.
# 
# source: https://docs.docker.com/engine/install/debian/
#
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Option to run docker hello world container
sleep 0.5
echo "Do you want to run the hello world container to check your installation?[Y/n]"
read hello

if [ "$hello" != "n" ]; then
	sudo docker run hello-world
else 
	echo "Docker installation complete, enjoy!"
	sleep 0.5
	echo ""
	echo "Let me clean your terminal, just a sec..."
	sleep 1
	clear
fi
