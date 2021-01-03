#!/bin/sh

docker build ./build -t gitlab-runner-alpine-docker
docker-compose up -d
