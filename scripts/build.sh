#!/bin/bash

IMAGE_NAME="shopnow-backend"
TAG="latest"

echo "Building Docker Image..."

docker build -t $IMAGE_NAME:$TAG .

echo "Image Built Successfully."