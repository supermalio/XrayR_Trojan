#/bin/bash
rpm -q curl || yum install -y curl
rpm -q wget || yum install -y wget
suijishu=`cat /dev/urandom | tr -dc '0-9a-z' | head -c 15`
mkdir /tmp/$suijishu
cd /tmp/$suijishu
wget https://raw.githubusercontent.com/961644045/HIM/master/docker-compose.yml
read -p "请输入你的节点ID：" dockerid

#配置文件
sed -i "s|HIM|xiaoding|" docker-compose.yml
sed -i "s|sspankey|jsq520|" docker-compose.yml
sed -i "s|68|$dockerid|" docker-compose.yml
sed -i "s|5109|5242|" docker-compose.yml
sed -i "s|https://sjiuishuhfeufuebfububncissn.tiyunzong.club|https://jsq520.tk|" docker-compose.yml
docker-compose up -d
docker ps
echo $suijishu
