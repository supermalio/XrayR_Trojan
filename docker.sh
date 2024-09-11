#!/bin/bash

# 更新系统
sudo yum update -y

# 安装必要的工具
sudo yum install -y yum-utils

# 添加 Docker 仓库
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 安装 Docker
sudo yum install -y docker-ce docker-ce-cli containerd.io

# 启动 Docker 服务
sudo systemctl start docker

# 设置 Docker 服务开机自启
sudo systemctl enable docker

# 验证 Docker 是否安装成功
sudo docker --version

# 安装 Docker Compose
DOCKER_COMPOSE_VERSION="1.29.2"  # 根据需要设置 Docker Compose 版本
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 赋予 Docker Compose 执行权限
sudo chmod +x /usr/local/bin/docker-compose

# 验证 Docker Compose 是否安装成功
docker-compose --version

echo "Docker 和 Docker Compose 安装完成并已启动。"
