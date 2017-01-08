#!/bin/bash
#Build this project's frontend code using a docker container as the builder (node based)

if [ ! -f 'node-builder.image' ]; then
    >&2 echo 'No docker image name found. Run ./create-docker-image.sh and try again.'
    exit 1
fi

image=$(cat 'node-builder.image')
mount=$(pwd):/project

set -e 

# avoid conflicts with node_modules folder on the host
# and link the cached node_modules from the image
docker run --rm -v $mount $image sh -c 'cd /project && mv node_modules host_node_modules >/dev/null 2>&1 || true && ln -s /cached-dependencies/node_modules node_modules' 

# build
docker run --rm -v $mount $image sh -c 'cd /project && gulp'

# interactive console for debugging
#docker run --rm -v $mount -it $image sh -c 'cd /project && bash' 

# cleanup links and restore host node_modules (if it exists)
docker run --rm -v $mount $image sh -c 'cd /project && rm node_modules && mv host_node_modules node_modules >/dev/null 2>&1 2>&1 || true' 
