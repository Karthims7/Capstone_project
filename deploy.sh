#!/bin/bash

echo "Logging into Docker Hub..."
docker login -u karthims -p dckr_pat_M6JLQV_yR9w9tZoGYCixNmL83KA

# Get the current branch name
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch: $GIT_BRANCH"

# Tag and push the image based on the branch
if [[ $GIT_BRANCH == 'main' ]]; then
    echo "Tagging and pushing image for main branch..."
    docker tag projectguvi:v1 karthims/prod
    docker push karthims/prod
    echo "Image tagged and pushed to karthims/prod."
elif [[ $GIT_BRANCH == 'dev' ]]; then
    echo "Tagging and pushing image for dev branch..."
    docker tag projectguvi:v1 karthims/dev
    docker push karthims/dev
    echo "Image tagged and pushed to karthims/dev."
else
    echo "No action taken. Branch not recognized."
fi

