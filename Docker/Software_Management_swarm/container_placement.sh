
docker run -it -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock dockersamples/visualizer

# Create service on manager node only
docker service create --constraints node.role==manager img_name

docker service create -d --name postgresdb -e POSTGRES_PASSWORD=mypass --constraint node.role==manager postgres
docker service create --name webserver --constraint node.role==worker --replicas=5 nginx

# labels is just like tags
docker node update --label-add=region=east-1-d node_value

docker service create --name service_name --constraint=node.labels.region=east-1-d image_name

docker service create --name service_name --constraint-rm=node.labels.region=east-1-d --constraint-add node.role=worker image_name