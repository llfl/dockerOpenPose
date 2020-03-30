#!/bin/bash

apt install -y curl vim

curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh --mirror Aliyun

groupadd docker
usermod -aG docker $USER
gpasswd -a $USER docker

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

apt-get update && apt-get install -y nvidia-container-toolkit
systemctl restart docker

docker build . -t magicstick