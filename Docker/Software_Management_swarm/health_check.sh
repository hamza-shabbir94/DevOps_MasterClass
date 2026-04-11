

mkdir healthcheck
docker container run --name postgres1 -e POSTGRES_PASSWORD=mypass -d postgres
docker container exec -it postgres1 bash
# to check it accepting the connection
pg_isready -U postgres

# exit 1 means health check fail exit the container, exit 0 means pass
docker container run -d --name postgres2 -e POSTGRES_PASSWORD=mypass --health-cmd="pg_isready -U postgres || exit 1" postgres

docker container run -d --name postgres3 -e POSTGRES_PASSWORD=mypass --health-cmd="pg_isready -U root || exit 1" postgres

# health check has 3 mode
starting
healthy
unheathly

# now we create it in docker swarm
docker service create --name postgresService -e POSTGRES_PASSWORD=mypass postgres

docker service create --name postgresService1 -e POSTGRES_PASSWORD=mypass --health-cmd="pg_isready -U root || exit 1" postgres
