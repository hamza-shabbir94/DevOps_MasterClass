# Terminology
Node Type: # it use raft algo
leader
Manager
Worker Node


Docker Swarm
Docker Host (Manager,worker)
docker Service # deployment

task # task is the running container (Same as pod)
Nodes # same as node


# swarm ingress load balancing 
Load Balancing


# initialize docker swarm
docker swarm init   # if you have two ip address use public ip address
docker swarm init --advertise-addr 192.241.154.143

docker info

docker swarm --help
docker service --help

docker service create 


docker service ls
docker service create image command
docker service create alpine ping www.google.com
docker service ps <svc_name>
docker service inspect id
docker service update svc_id --replicas 5
docker service rollback <svc_id>


# docker swarm cluster
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