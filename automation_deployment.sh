#!/bin/bash

folder_project=/project

if [ ! -d "$folder_project" ]; then
    mkdir -p "$folder_project"
fi

cd "$folder_project"
rm -rf *
git clone https://github.com/nammmm156/projects.git
cd projects/CNPMN5
if [ -n "$(docker ps | grep myweb | awk '{print $12}')" ]
then
	docker rm -f $(docker ps | grep myweb | awk '{print $12}')
fi

if [ -n "$(docker images | grep webserver | awk '{print $3}')" ]
then
	docker rmi -f $(docker images | grep webserver | awk '{print $3}')
fi

docker build -t webserver .
docker run -dp 3000:3000 --name myweb $(docker images | grep webserver | awk '{print $3}')
