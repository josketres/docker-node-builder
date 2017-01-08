#!/bin/bash
# Update the docker image (do this if you update the package.json)

image=josketres/node-builder
docker build -t $image:tmp . 
id=$(docker images -q josketres/node-builder:tmp)
docker build -t $image:$id .
docker rmi $image:tmp
echo "$image:$id" > node-builder.image
# here you have to push the image to docker registry
