docker run -d --name mysql-db -e MYSQL_ALLOW_EMPTY_PASSWORD=True --mount source=mysql-db,destination=/var/lib/mysql mysql

docker run -d --name mysql-db -e MYSQL_ALLOW_EMPTY_PASSWORD=True --mount source=mysql-db,destination=/var/lib/mysql mysql:8.4


docker run -d -it --name nginx --mount type=bind,source=/root/custom_index,destination=/apps  -p 8080:80 nginx 

# in bind mount if you change, or add or delete any file/folder it will also reflect in container, As compare to volume if you modify anything in volume it crash the container.
mkdir /root/custom_index
vi index.html << EOF
<h1> I am the best, I can do it </h1>
EOF
docker run -d -it --name nginx1 --mount type=bind,source=/root/custom_index,destination=/usr/share/nginx/html/  -p 8081:80 nginx