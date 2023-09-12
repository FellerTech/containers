# glxgears
# ftp://www.x.org/pub/X11R6.8.1/doc/glxgears.1.html

# docker build -t glxgears .
# xhost +si:localuser:root
# docker run --runtime=nvidia -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix glxgears

FROM nvidia/opengl:1.2-glvnd-runtime
#FROM nvidia/opengl:1.0-glvnd-runtime

#Environment variables must be added after image specification
ENV UID="1000"
ENV GID="1500"
ENV USER="sfeller"

ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES},display


#RUN echo $UID

RUN groupadd -g $GID devs 
RUN useradd --create-home --no-log-init -u $UID -g $GID -s /bin/bash $USER

RUN apt-get update && apt-get install -y mesa-utils lxterminal vim


#C/C++ Libraries
RUN apt-get install -y build-essential cmake

#meson libraries
RUN apt-get install -y meson git libgtest-dev

#CMD ["gnome-terminal"]
#CMD ["xterm"]
USER ${USER}
RUN ln -s /root/develop /home/$USER
CMD ["lxterminal", "--working-directory=/home/$USER"]

