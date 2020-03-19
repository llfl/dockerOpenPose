FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
MAINTAINER i@imux.top

RUN apt-get update && apt-get install -y \
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
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip

ADD cmake-3.16.5-Linux-x86_64.tar.gz .
ADD 4.2.0.zip .

RUN unzip /4.2.0.zip && cd opencv-4.2.0 && mkdir -p build && cd build \
    && /cmake-3.16.5-Linux-x86_64/bin/cmake -DCMAKE_BUILD_TYPE=Release .. && make -j"$(nproc)" \
    && make install

RUN git clone https://github.com/llfl/openpose
RUN cd openpose && mkdir -p build && cd build \
    && /cmake-3.16.5-Linux-x86_64/bin/cmake -DCMAKE_BUILD_TYPE=Release .. && make -j"$(nproc)"

# RUN cd openpose/models && ./getModels.sh

WORKDIR /openpose

CMD ./build/examples/user_code/magicstick2.bin