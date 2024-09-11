#!/bin/bash

# 更新系统
echo "Updating system..."
sudo yum update -y

# 安装依赖
echo "Installing dependencies..."
sudo yum install -y yum-utils

# 添加 Docker 仓库
echo "Adding Docker repository..."
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 安装 Docker
echo "Installing Docker..."
sudo yum install -y docker-ce docker-ce-cli containerd.io

# 启动 Docker 服务
echo "Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# 验证 Docker 安装
echo "Verifying Docker installation..."
docker --version

# 安装 Docker Compose
echo "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 赋予 Docker Compose 执行权限
sudo chmod +x /usr/local/bin/docker-compose

# 验证 Docker Compose 安装
echo "Verifying Docker Compose installation..."
docker-compose --version

echo "Docker and Docker Compose installation completed."
