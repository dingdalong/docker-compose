#!/bin/sh

docker exec -it $3 gitlab-runner register --non-interactive --url "$1" --registration-token "$2" --executor "shell" --description "$3" --run-untagged
