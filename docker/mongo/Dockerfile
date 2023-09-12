FROM mongo

#User variables
ENV UID="1000"
ENV GID="1500"
ENV USER="sfeller"

#ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES},display


#Create user and groups
RUN groupadd -g $GID devs
RUN useradd --create-home --no-log-init -u $UID -g $GID -s /bin/bash $USER


RUN apt-get update && apt-get install -y lxterminal vim python3-dev 

USER ${USER}
#RUN ln -s /root/develop /home/$USER
RUN mkdir /home/$USER/build
CMD ["lxterminal", "--working-directory=/home/$USER"]


#RUN apt-get update && apt-get install -y firefox xauth xterm glmark2
#CMD ["glmark2"]

# nvidia-container-runtime

#ENV NVIDIA_VISIBLE_DEVICES \
#        ${NVIDIA_VISIBLE_DEVICES:-all}
#ENV NVIDIA_DRIVER_CAPABILITIES \
#        ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics,compat32,utility


# Required for non-glvnd setups. This is a passthrough tha allows the container to use local libraries.
#ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/lib/i386-linux-gnu${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}:/usr/local/nvidia/lib:/usr/local/nvidia/lib64

