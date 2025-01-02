#!/bin/bash

# Update package list
sudo apt update

#  install docker

sudo apt install -y docker.io
 
#  start the docker daemon

sudo systemctl start docker

#  enable docker to run on system startup
sudo systemctl enable docker

#  grant the default user (ubuntu)  aws provides for ubuntu server, access to run docker commands if needed by adding him to the docker group
sudo usermod -aG docker ubuntu

#  pull an nginx image from docker registry (docker hub) to run a docker container from because the image won't be available locally by default
sudo docker pull nginx

# run an nginx container from the pulled nginx image and assigning the container port 80 and mapping it to the host port 80 running the container in detached mode
sudo docker run -d --name nginx-container -p 80:80 nginx




