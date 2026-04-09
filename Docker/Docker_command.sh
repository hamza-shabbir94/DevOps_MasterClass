docker
docker version 
docker info
docker image --help
docker search nginx

# start/ create new container
docker container run --publish <host+port>:<container_port> image_name
docker container run --publish 8080:80 nginx -d # -d detach

docker container ls # new
docker ps  # (old way)

docker container ls -a # new
docker ps -a # (old way)

# start the existing container
docker container start Container_id
docker container run --publish 8080:80 -d --name nginx nginx # --name is container name


docker container logs <container_name>/<container_id>

# to check process running
docker container top <container_id>

ps eg | grep "nginx"

docker container stop Container_id

docker container rm con_id


docker run --name custom-mysql -e MYSQL_ROOT_PASSWORD=1234 -d mysql # -e environment variable
ps -ef | grep mysql

# Resource Consumption 
docker stats con_name/Con_id
# to check process
docker top con_name
# for ip and other things
docker inspect con_name/con_id

docker inspect con_name/con_id -f {{.NetworkSettings.IPAddresses}}

# jump into container/ interacting mode
docker run -it image_name/Image_id command
docker container run -it -p 8080:80  --name nginx nginx /bin/bash

docker exec [option][con_name/con_id] [command_need_to_run inside the container]

# Web App - Front-End + Back-End App
# MariaDB - Back-End
# Wordpress - Front-End

docker network create my-network
docker network ls
docker port con_id



docker run --detach --name my-mariadb-container --env MARIADB_USER=hamza --env MARIADB_PASSWORD=my_cool_secret --env MARIADB_DATABASE=test --env MARIADB_ROOT_PASSWORD=password12 --network my-network mariadb:latest

docker run -detach --name wordpress-container --env WORDPRESS_DB_HOST=my-mariadb-container --env WORDPRESS_DB_USER=hamza  --env WORDPRESS_DB_PASSWORD=my_cool_secret --env WORDPRESS_DB_NAME=test -p 8080:80 --network my-network wordpress

docker pull <image_name:tag >
# to check the layers
docker history <image_name:tag >

# tag
docker tag source_image:tag Your_image_name:tag
docker images 


# upload Docker images
docker login
# if you get the error first tag the name with your username
docker tag image_tag username/image_name:tag
docker push username/image_name:tag

# docker file build
docker build -f < docker_file_path >


# volume
docker volume ls

# bind mount can't be use the dockerfile




# docker compose

# go the directory where you have your compose file
docker compose build
docker compose up
docker compose down
docker compose push # push all the images


# docker custom compose file
docker compose -f Custom-Application up -d

docker compose ls
dokcer compose logs
# log for specific services
docker compose logs[serivce..]

# 
docker compose logs --tail=10

docker compose logs --follow
docker compose logs --follow --tail=5

# go into shell
docker compose exec <service_name> /bin/bash