#Prerequisites

## Ubuntu 23.04


### Packages
docker-buildx-plugin
docker-ce
docker-ce-cli
docker-ce-rootless-extras
docker-compose-plugin
docker-scan-plugin
docker.io


## nVidia graphics support
nvidia/opengl 1.1-glvnd-runtime

### Images
docker pull nvidia/opengl:1.2-glvnd-runtime


### Packages
- nvidia-container-toolkit
-

#This container has been tested on the following systems:
- Ubuntu 23.04 with a nVidia GTX 1080 graphics card 

#Command Execution from host system command line
docker exec -it -u root  develop sh -c "apt install doxygen"
