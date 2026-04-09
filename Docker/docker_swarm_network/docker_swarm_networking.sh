# work with the overlay network, 
overlay network -> ingress
Bridge Network -> docker_gwbridge


port:
2377 -> for leader node work (Management Communication)
TCP and UDP -> 7946 for communication among nodes
UDP -> 4789 for overlay network traffic

# Traffic management 
Routing Mesh




# Command
docker network ls
docker network create -d overlay my_network
docker service ls
docker service create --name postgres --network my_network -e POSTGRES_PASSWORD=mypassword postgres

docker service create --name drupal --network my_network -p 8080:80 drupal # this frontend service, We haven't find the reference of backend service, we will provide this at the run time, Browser IP_host_machine:8080
docker service ps <svc_name>

# this service can be access any host, 

# overlay network
docker network create -d overlay <net_name>

# Service on user define Overlay Network
docker service create --name <service_name> --network <net_name> -e POSTGRES_PASSWORD=mypassword <Image_name>

# web-service to access the db and same network
docker service create --name <svc_name> --network <net_name> -p 80:80 <image_name>
# to check the port

docker service inspect --format="{{json.Endpoint.Spec.Ports}} <svc_name>