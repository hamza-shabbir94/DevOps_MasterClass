# Roll update
# 1st need multiple servers
# in rolling update, 1st update one server and move it service to the other server, then use this on other server one by one. 

# to update the service
docker service update --image image_name service_name

# update stack
docker stack deploy -c yml_file service_name


docker service create -p 8080:80 --name web_server nginx:1.14.2
docker service ls

# horizontal and vertical upgrade
docker service scale web_server=10
docker service ls
docker service ps web_server
docker container ls
docker service update --image nginx:1.15.12 web_server
docker service update --publish-rm 8080 --publish-add 9090:80 web_server