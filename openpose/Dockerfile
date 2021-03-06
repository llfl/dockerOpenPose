FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
MAINTAINER i@imux.top

RUN apt-get clean && apt-get update && apt-get install -y \
      build-essential \
      git \
      libgtk2.0-dev \ 
      pkg-config \
      libavcodec-dev \ 
      libavformat-dev \
      libswscale-dev \
      libatlas-base-dev \
      libatlas-dev \
      libboost-all-dev \
      libgflags-dev \
      libgoogle-glog-dev \
      libhdf5-dev \
      libleveldb-dev \
      liblmdb-dev \
      libprotobuf-dev \
      libsnappy-dev \
      lsb-release \
      protobuf-compiler \
      zip \
      wget \
      python-pip \
      python-dev \
      ffmpeg \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip

RUN wget https://github.com/Kitware/CMake/releases/download/v3.17.0/cmake-3.17.0-Linux-x86_64.tar.gz && tar -xf cmake-3.17.0-Linux-x86_64.tar.gz && mv cmake-3.17.0-Linux-x86_64 cmake && rm cmake-3.17.0-Linux-x86_64.tar.gz
# ADD cmake-3.16.5-Linux-x86_64.tar.gz .
# ADD 4.2.0.zip .
RUN wget https://github.com/opencv/opencv/archive/4.2.0.zip

RUN unzip /4.2.0.zip && cd opencv-4.2.0 && mkdir -p build && cd build \
    && /cmake/bin/cmake -DCMAKE_BUILD_TYPE=Release .. && make -j"$(nproc)" \
    && make install
    
RUN rm /4.2.0.zip

RUN git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose
RUN cd openpose && mkdir -p build && cd build \
    && /cmake/bin/cmake -DCMAKE_BUILD_TYPE=Release .. && make -j"$(nproc)" && make install 

WORKDIR /openpose

# ENTRYPOINT ["/startup.sh"]
CMD [ "/bin/bash" ]
# CMD ./build/examples/user_code/magicstick2.bin --video ../data/input.mp4 --no_gui_verbose --display 0 --write_video ../data/output.mp4