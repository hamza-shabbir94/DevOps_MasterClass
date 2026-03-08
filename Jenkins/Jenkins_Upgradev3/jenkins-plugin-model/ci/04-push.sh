#!/bin/bash
docker image build -t hamza94/udemy:$1 -f Jenkins/Jenkins_Upgradev3/jenkins-plugin-model/src/demo2-publish/dockerfile .

if [ -z ${DOCKER_HUB_USER+x} ]
then 
    echo 'Skipping login - credentials not set' 
else 
    docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASSWORD
fi

docker push hamza94/udemy:$1