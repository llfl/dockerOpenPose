FROM imux/opencv
MAINTAINER i@imux.top


RUN git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose
RUN cd openpose && mkdir -p build && cd build \
    && /cmake/bin/cmake -DCMAKE_BUILD_TYPE=Release -DDOWNLOAD_BODY_25_MODEL=OFF -DDOWNLOAD_FACE_MODEL=OFF -DDOWNLOAD_HAND_MODEL=OFF -DBUILD_EXAMPLES=OFF .. && make -j"$(nproc)" && make install 

RUN rm -rf openpose && mkdir /openpose

WORKDIR /openpose
 
# ENTRYPOINT ["/startup.sh"]
CMD [ "/bin/bash" ]
# CMD ./build/examples/user_code/magicstick2.bin --video ../data/input.mp4 --no_gui_verbose --display 0 --write_video ../data/output.mp4