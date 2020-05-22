#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=overrider/capstonetest

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
echo "User: $DOCKER_USER, pass: $DOCKER_PASSWORD"
docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
docker tag capstonetest $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath