#!/bin/bash
#
# This script installs dependencies needed for these containers
#

#get versin
DISTRIB=`cat /etc/lsb-release |grep DISTRIB_ID|cut -d '=' -f 2`
RELEASE=`cat /etc/lsb-release |grep RELEASE |cut -d '=' -f 2`

echo "$DISTRIB $RELEASE"


if [ "$DISTRIB" == "Ubuntu" ]; then
   if [ "$RELEASE" == "20.04" ]; then
   	echo "Installing container dependencies for $DISTRIB $RELEASE"
   	sudo apt update
   	sudo apt install -y ca-certificates curl gnupg lsb-release

	curl https://get.docker.com | sh && sudo systemctl --now enable docker
	distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   		&& curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   		&& curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list


	sudo apt-get update
	sudo apt-get install -y nvidia-docker2
	sudo systemctl restart docker
	echo "TEST:"
	echo
	sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
	echo

   else
       echo "$RELEASE is not a supported release for $DISTRIB"
       return 1
   fi
else
   echo "$DISTRIB is not supported. Goodbye"
   return 1
fi
