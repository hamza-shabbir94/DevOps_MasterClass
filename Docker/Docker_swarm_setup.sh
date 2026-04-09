# install docker ce ubuntu
# after installing the ce
https://docs.docker.com/engine/install/ubuntu/

docker swarm init --advertise-addr 192.241.154.143

# on leader node to find the token

# for manager 
docker swarm join-token manager
# for worker
docker swarm join-token worker

# switch manager node in docker
docker node update --role manager <node_name>

docker service create --replicas 10 alpine ping www.google.com 

docker service ls
docker service ps <svc_name>

docker container ls
