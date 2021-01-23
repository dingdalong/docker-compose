#!/bin/sh
#<url> <token> <runner-name>
docker exec -it $3 gitlab-runner register --non-interactive --url "$1" --registration-token "$2" --executor "shell" --description "$3" --run-untagged
docker exec -it $3 gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
docker exec -it $3 gitlab-runner start
docker exec -it $3 systemctl enable gitlab-runner
