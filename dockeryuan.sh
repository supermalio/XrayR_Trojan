#!/bin/bash

# 备份现有的镜像源配置
echo "Backing up existing repo files..."
sudo cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

# 创建新的 repo 文件
echo "Creating new repo file with CentOS Vault mirrors..."
sudo bash -c 'cat > /etc/yum.repos.d/CentOS-Base.repo << EOF
[base]
name=CentOS-7 - Base
baseurl=http://vault.centos.org/7.9.2009/os/x86_64/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1

[updates]
name=CentOS-7 - Updates
baseurl=http://vault.centos.org/7.9.2009/updates/x86_64/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1

[extras]
name=CentOS-7 - Extras
baseurl=http://vault.centos.org/7.9.2009/extras/x86_64/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1

[centosplus]
name=CentOS-7 - CentOSPlus
baseurl=http://vault.centos.org/7.9.2009/centosplus/x86_64/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=0
EOF'

# 清理缓存并生成新的缓存
echo "Cleaning and generating yum cache..."
sudo yum clean all
sudo yum makecache

echo "Repository source replacement complete."
