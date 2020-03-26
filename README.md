# dockerOpenPose

## 使用方法

### 确保设备支持nvidia cuda

命令行中输入nvidia-smi，查看nvidia设备信息，若无结果则，安装nvidia显卡驱动，并重启。

### 安装docker

参照[Get Docker Engine - Community for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
 
### 安装nvidia-docker

注：nvidia-docker需要nvidia驱动支持

参照[nvidia-docker](https://github.com/NVIDIA/nvidia-docker)

### dockerOpenPose

1. cd到dockerOpenPose目录下执行docker build . -t magicstick 等待执行完成

2. 用nvidia-docker run即可运行magicstick镜像，附加参数--video_path 可附加video