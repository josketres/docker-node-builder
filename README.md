# docker-node-builder
Build your node.js based project using a docker container to cache the dependencies

[![Build Status](https://travis-ci.org/josketres/docker-node-builder.svg?branch=master)](https://travis-ci.org/josketres/docker-node-builder)

# Requirements
* docker

# How does it work?
First create a docker image (this image will contain the dependencies of your package.json)
```sh
./create-docker-image.sh
```
This will create the file `node-builder.image` which contains the docker image that will be used to build the project.

Then use that docker image to create a container to build your project:
```sh
./build.sh
```

If you update your package.json you'll have to create a new docker image.
```sh
./create-docker-image.sh
git add package.json node-builder.image
git commit -m "Update dependencies"
```



