#!/bin/bash

function error_exit {
    echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
    exit 1
}

if ! mvn clean package; then
    error_exit "Maven build failed"
fi

if ! docker build -t simple-servlet .; then
    error_exit "docker build failed"
fi

docker stop simple-servlet && docker rm simple-servlet
sleep 1
docker run -d -p 7080:9080 -p 443:9443 --name=simple-servlet simple-servlet

echo "curl localhost:7080/SimpleServlet/SimpleServlet"
