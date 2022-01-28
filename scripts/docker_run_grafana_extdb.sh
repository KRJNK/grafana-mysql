#!/bin/bash
sudo docker rm grafana
sudo mkdir /home/docker/grafana
dir=/home/docker/grafana
### -v $dir/grafana_conf:/etc/grafana/ \
#Create directories
mkdir $dir;
mkdir $dir/grafana_conf;
mkdir $dir/grafana_data;
mkdir $dir/grafana_logs;
mkdir $dir/grafana_plugins;
###Deploy container
docker run -d \
--name grafana \
-p 3000:3000 \
-v $dir/grafana_data:/var/lib/grafana \
-v $dir/grafana_logs:/var/log/grafana \
-v $dir/grafana_plugins:/var/lib/grafana/plugins \
-e GF_LOG_MODE="console file" \
-e GF_DEFAULT_INSTANCE_NAME="KRJNK Grafana" \
-e GF_SECURITY_ADMIN_USER=krjnk \
-e GF_DATABASE_TYPE=mysql \
-e GF_DATABASE_HOST=localhost:3306 \
-e GF_DATABASE_USER=grafana \
-e GF_DATABASE_PASSWORD=grafana_mysql_grafana \
-e GF_DATABASE_NAME=grafana_mysql \
grafana/grafana:latest
