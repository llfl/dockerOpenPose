#!/bin/bash
xhost +localhost
docker build . -t magicstick &&\
# docker run --gpus all --rm --name openpose -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:/data magicstick /openpose/build/examples/user_code/magicstick2.bin --video ../data/$1 --no_gui_verbose --display 0 --write_video ../data/output.mp4

docker run --gpus all --rm --name openpose -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:/data --device /dev/video0 magicstick /openpose/build/examples/user_code/magicstick2.bin --camera 0