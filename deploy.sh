#!/bin/bash
docker login -u karthims -p dckr_pat_M6JLQV_yR9w9tZoGYCixNmL83KA
# Tag the image with the Docker Hub repository name and version
if [[ $GIT_BRANCH == 'origin/main' ]]; then
docker tag projectguvi:v1 karthims/prod
docker push karthims/prod
# Docker login
elif [[ $GIT_BRANCH == 'origin/dev' ]]; then
docker tag projectguvi:v1 karthims/dev
docker push karthims/dev
fi
