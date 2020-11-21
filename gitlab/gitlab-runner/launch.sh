#!/bin/sh

docker build . -t gitlab-runner-alpine-docker
docker-compose up -d
