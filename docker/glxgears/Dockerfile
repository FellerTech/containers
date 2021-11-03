
#FROM nvidia/cuda:11.1-devel-ubuntu18.04
FROM nvidia/cuda:11.1-devel-ubuntu20.04

#Install mesa-utils
RUN apt-get update && \
    apt-get install -y mesa-utils x11-apps 

CMD ["xeyes"]
EXPOSE 5000

## Install Miniconda and any other required system libraries
#ENV MINICONDA_URL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
#RUN apt-get update && \
#    apt-get install -y \
#        wget \
#        libgl1-mesa-dev \
#        libglu1-mesa \
#        libxi6 \
#	libsqlite3-dev \
#	libbson-dev \
#	libfreeimage-dev \
#	libgsl-dev \
#	freeglut3-dev \
#	cmake \
#        libxrender1  && \
#    apt-get autoremove -y && \
#    rm -rf /var/lib/apt/ && \
#    wget "$MINICONDA_URL" && \
#    chmod +x ./Miniconda3-latest-Linux-x86_64.sh  && \
#    ./Miniconda3-latest-Linux-x86_64.sh -b && \
#    rm ./Miniconda3-latest-Linux-x86_64.sh
#ENV PATH /root/miniconda3/bin:$PATH
#
## Install Blender
#ENV BLENDER_VERSION 2.90
#ENV BLENDER_XZ_URL https://mirror.clarkson.edu/blender/release/Blender$BLENDER_VERSION/blender-$BLENDER_VERSION.1-linux64.tar.xz
#RUN mkdir /usr/local/blender && \
#    wget "$BLENDER_XZ_URL" && \
#    tar -xf blender*.xz -C /usr/local/blender --strip-components=1 && \
#    rm blender*.xz 
#ENV PATH /usr/local/blender:$PATH
#
## Install the python libraries in a Conda environment, link the Conda environment to Blender
#RUN conda install -c conda-forge python=3.7 \
#        pip \
#	matplotlib \
#        scipy \
#        pyyaml \
#        numpy \
#        opencv=4.1.1 \
#        pillow \
#        imageio  && \
#    conda list && \
#    conda clean -afy && \
#    rm -rf /usr/local/blender/${BLENDER_VERSION}/python && \
#    ln -s /root/miniconda3 /usr/local/blender/${BLENDER_VERSION}/python

# QSim library paths
#ENV LD_LIBRARY_PATH /qsim/external/legacy/lib/:$LD_LIBRARY_PATH

##SDF remove to test build
## Import the Qsim directory and install Qsim
#WORKDIR /qsim
#RUN mkdir /data
#RUN mkdir /qsim/config && \
#    mkdir /qsim/bin 
#COPY lib64 /qsim/lib64 
#COPY include /qsim/include
#COPY util /qsim/util
#COPY config/Source_Spec.txt /qsim/config/Source_Spec.txt 
#COPY config/QEff_LUT.txt /qsim/config/QEff_LUT.txt 
#COPY config/SoCP_Materials.db /qsim/config/SoCP_Materials.db 
#COPY config/detModelMat_64b.bin /qsim/config/detModelMat_64b.bin 
#COPY data/SoCP_Materials.db /qsim/config/SoCP_Materials.db
#COPY data/qsim_objects /qsim/qsim_objects 
#COPY bin/QSim /qsim/bin/QSim
#COPY lib64/libcublas.so.10 /usr/lib/x86_64-linux-gnu/libcublas.so.10
#COPY lib64/libcublasLt.so.10 /usr/lib/x86_64-linux-gnu/libcublasLt.so.10
#COPY data/qsim_socp_DE.py /qsim/bin/qsim_socp_test.py 
#COPY data/synthetik_bags.py /qsim/bin/synthetik_bags.py 
## testing remove later
##COPY bin/briefcase2_v1_packed_demo.json /qsim/bin/briefcase2_v1_packed_demo.json
##COPY bin/briefcase2_v1_packed /qsim/bin/briefcase2_v1_packed



