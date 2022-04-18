# Blender Docker Container setup

## Description
This container contains a blender application and bpy.so python module that can be used to simulated packed luggage.


# Quick Start
## Install dependencies
sudo apt install nvidia-docker docker-ce docker-ce-cli 

## Clone container and software repositories
git clone git@github.com:FellerTech/containers.git

## Go to the appropriate repository
cd docker/blender

## Modify the docker-compose.yml file to mount any volumes needed for persistent data. Each volume entry specifies the data location on the server followed by a ':'. The second entry is where the data will reside in the docker container. An example of docker-compose.yml file is shown below. In this case, the /mnt/data directory on the server is mounted to the same place in the docker container. The /home/sfeller/develop directory is mounted at /root/develop. Any changes to the container are transient unless they are in a mounted volume.

`
version: "3"

services:
  app:
    image: guitest:latest
    build: .
    environment:
      - DISPLAY=${DISPLAY}
    volumes:
      - /tmp/.X11-unix:/tmp/.X11-unix
      - /mnt/data:/mnt/data
      - /home/sfeller/develop:/root/develop
    network_mode: host
    deploy:
      resources:
        reservations:
          devices:
          - driver: nvidia
            capabilities: [gpu]
            count: all
networks:
  default:
    external: true
`


## Build docker
docker-compose build

## Allow docker to access your X11 display
xhost +

## Start the container
sudo docker-compose up

An LXTerminal will pop up. This terminal allows you to run command inside the container. To run blender, just type `blender`. Custom software should be accessible through a mounted volume. T
