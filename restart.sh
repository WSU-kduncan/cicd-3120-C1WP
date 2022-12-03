#!/bin/sh
# Pull latest version of the image
docker pull caupp7wsu/proj5_dock
# Remove unused images
docker image prune -f
# Stop the container
docker stop main
# Remove the container
docker rm main
# Recreate the container
docker run -p 80:80 -d --name main caupp7wsu/proj5_dock