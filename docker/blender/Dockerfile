FROM nvidia/cuda:11.0-base

#Set timezone
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#Make nVidia libraries accessible
# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
        ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
        ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics,compat32,utility,compute

# Required for non-glvnd setups. This is a passthrough tha allows the container to use local libraries.
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/lib/i386-linux-gnu${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}:/usr/local/nvidia/lib:/usr/local/nvidia/lib64


#Container validation dependencies
RUN apt-get update && apt-get install -y xauth lxterminal glmark2 vim-gui-common 
RUN apt-get upgrade -y

#DEBUG TOols
RUN apt install -y cmake-curses-gui


##Blender Dependencies
RUN apt install -y build-essential git subversion cmake libx11-dev libxxf86vm-dev libxcursor-dev libxi-dev libxrandr-dev libxinerama-dev libglew-dev libjpeg-dev libpng-dev libzstd-dev libfreetype-dev python3-dev libembree-dev libjack-dev libpulse-dev libfftw3-dev libopenimageio-dev libavformat-dev curl python3.9 python3.9-dev libswscale-dev libavdevice-dev

#Install Python dependencies
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.9 get-pip.py
RUN pip3.9 install numpy

##Install blender
RUN mkdir software; cd software \
	&& git clone https://git.blender.org/blender.git; cd blender \
	&& git checkout blender-v2.93-release \
	&& git submodule update --init --recursive \
        && mkdir build; cd build \
        && cmake .. -DWITH_PYTHON_INSTALL=OFF -DWITH_PYTHON_MODULE=ON -DWITH_INSTALL_PORTABLE=OFF -DWITH_CYCLES_EMBREE=OFF -DWITH_MEM_JEMALLOC=OFF -DWITH_XR_OPENXR=OFF -DWITH_BOOST=OFF -DWITH_QUADRIFLOW=OFF -DWITH_AUDASPACE=OFF -DWITH_SDL=OFF -DWITH_CODEC_SNDFILE=OFF -DWITH_FFTW3=OFF -DWITH_HARU=OFF -DWITH_JACK=OFF -DWITH_MOD_FLUID=OFF -DWITH_MOD_OCEANSIM=OFF -DWITH_TBB=OFF -DWITH_PYTHON_MODULE=OFF \ 
	&& make -j8 \
	&& make install




#QSIM Dependencies
#RUN apt install -y cmake-curses-gui cmake

CMD ["lxterminal"]
