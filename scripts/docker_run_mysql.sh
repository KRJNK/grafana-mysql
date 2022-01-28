#!/bin/bash/
dir=/home/docker/grafana

###Create Directories
sudo mkdir "$dir"
sudo mkdir "$dir/mysql_conf";
sudo mkdir "$dir/mysql_data";

###Deploy container
docker run -d \
--name grafana-mysql \
-p 3306:3306 \
-v $dir/mysql_conf:/etc/mysql/conf.d \
-v $dir/mysql_data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=jelen666 \
-e MYSQL_DATABASE=grafana_mysql \
-e MYSQL_USER=grafana \
-e MYSQL_PASSWORD=grafana_mysql_grafana \
mysql
