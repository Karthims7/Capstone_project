#!/bin/bash


#build the Docker image
docker build -t projectguvi:v1 .
docker images
docker compose down || true 
# Building Docker container
#docker-compose up -d
