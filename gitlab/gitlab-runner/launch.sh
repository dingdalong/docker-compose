#!/bin/sh

docker build ./build -t gitlab-runner-centos
docker-compose up -d
