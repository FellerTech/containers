#FROM ubuntu:20.04
#FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu20.04
#FROM nvidia/cudagl:11.4.0-devel-ubuntu20.04 
#FROM docker:20.10
#FROM nvidia/opengl:1.0-glvnd-runtime 
#FROM nvcr.io/nvidia/cudagl:11.4.0-devel-ubuntu20.04
#FROM nvidia/cudagl:11.4.0-devel-ubuntu20.04
FROM nvidia/cuda:11.0-base

RUN apt-get update && apt-get install -y firefox xauth xterm glmark2
CMD ["glmark2"]

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
        ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
        ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics,compat32,utility


# Required for non-glvnd setups.
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/lib/i386-linux-gnu${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}:/usr/local/nvidia/lib:/usr/local/nvidia/lib64

