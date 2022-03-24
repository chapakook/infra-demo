#!/bin/sh

# Colors
RED="\033[31m"
BLUE="\033[34m"
YELLOW="\033[33m"
GREEN="\033[32m"
WHITE="\033[0m"
BOLD="\033[01m"

# Script
echo ${BOLD}"[RUN] ${YELLOW}REMOVE${BOLD} docker docker-engine docker.io containerd runc"${WHITE}

sudo apt-get remove docker docker-engine docker.io containerd runc 

echo ${BOLD}"[RUN] GET get-docker.sh"${WHITE}

curl -fsSL https://get.docker.com -o get-docker.sh || { echo ${YELLOW}"[ERROR]"; exit 9; }

sh get-docker.sh

sudo mkdir /etc/docker

cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker

sudo usermod -aG docker ubuntu && sudo reboot || { echo ${YELLOW}"[ERROR]"; exit 9; }