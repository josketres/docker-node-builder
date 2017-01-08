#!/bin/bash
#Build this project's frontend code using a docker container as the builder (node based)

image=josketres/node-builder
mount=$(pwd):/project

set -e 

# cleanup
docker run --rm -v $mount $image sh -c 'cd /project && mv node_modules host_node_modules >/dev/null 2>&1 || true && ln -s /cached-dependencies/node_modules node_modules' 

# build
docker run --rm -v $mount $image sh -c 'cd /project && gulp'

# interactive console
#docker run --rm -v $mount -it $image sh -c 'cd /project && bash' 

# cleanup
docker run --rm -v $mount $image sh -c 'cd /project && rm node_modules && mv host_node_modules node_modules >/dev/null 2>&1 2>&1 || true' 
