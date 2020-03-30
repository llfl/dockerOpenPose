#!/bin/bash

docker build . -t magicstick &&\
docker run --gpus all --rm --name openpose -v `pwd`:/data magicstick /openpose/build/examples/user_code/magicstick2.bin --video ../data/$1 --no_gui_verbose --display 0 --write_video ../data/output.mp4