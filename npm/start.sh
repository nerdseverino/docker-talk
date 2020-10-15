#!/bin/bash

docker stop portainer 
docker rm portainer
docker stop nextcloud_db
docker rm nextcloud_db
docker stop nextcloud
docker rm nextcloud


#inicia os containers sem orquestração:
#Portainer
#docker run -d -p 9000:9000 --name portainer  -v /var/run/docker.sock:/var/run/docker.sock hypriot/rpi-portainer
docker run -d -p 9000:9000 --name portainer  -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer


#MariaDB
docker run -d --name nextcloud_db -v $PWD/nextcloud/db:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=supersecretpassword -e MYSQL_DATABASE=nextcloud -e MYSQL_USER=nextcloud -e MYSQL_PASSWORD=supersecretpassword ugeek/mariadb:arm

#Nextcloud
docker run -d --name nextcloud --link nextcloud_db:nextcloud_db -v $PWD/nextcloud/dados:/var/www/html nextcloud

#LEGO
#docker run --name lego -v "$PWD/lego/cert:/.lego" -e "CLOUDFLARE_DNS_API_TOKEN=g54W4ODcOOpYDZihpN1auhguX19InXWQWqDlQPxD" goacme/lego --dns cloudflare -a --domains cloud.nerdseverino.com.br --email machado.computer@gmail.com run

