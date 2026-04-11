https://github.com/dockersamples/example-voting-app
docker network create -d overlay frontend
docker network create -d overlay backend
docker network ls

docker service create --name redis --network frontend --replicas 4 redis:alpine 
docker service create --name voting-app --network frontend -p 5000:80 --replicas 4 dockersamples/examplevotingapp_vote

docker service create --name worker --network frontend --network backend --replicas 4 dockersamples/examplevotingapp_worker

docker service create --name db --network backend --replicas 1 -e POSTGRES_PASSWORD=mypass --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:15-alpine

docker service create --name result --network backend --replicas 1 -p 5001:80 dockersamples/examplevotingapp_result