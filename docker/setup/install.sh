#!/bin/bash
# Script to install container requirements
# Date: 20210-11-05
#
# Prerequisites
# - nvidia graphics driver (470 tested)
#
# References:
# - https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html
# - https://docs.docker.com/engine/install/ubuntu/
#
# Notes
# - the screen must be made accessible via xhost+ or xhost:local prior to execution

#############################################
# Check prerequisites
#############################################


#############################################
# Install docker
#############################################
#remove older versions
sudo apt remove -y docker docker-engine docker.io containerd runc 

#install dependencies
sudo apt-get update

sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#Add docker GPG key
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

 #Set up the stable repository
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#install docker engine
sudo apt-get update
sudo apt-get install  -y docker-ce docker-ce-cli containerd.io docker-compose

#VErfiy docker isntall
#sudo docker run hello-world



#System packages
#install docker
curl https://get.docker.com | sh \
  && sudo systemctl --now enable docker

#Set up nvidia container toolkit
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

#Get access to experimental features
curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list

#install steps
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker

#Test docker
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi

#############################################
# install docker-compose
#############################################
# get current stable release
 sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#Make file executable
sudo chmod +x /usr/local/bin/docker-compose

#Link to the binary file
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Make sure version is 1:28 or grate
docker-compose --version
