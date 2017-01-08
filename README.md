# docker-node-builder
Build your node.js based project using a docker container to cache the dependencies

# Requirements
* docker

# How does it work?
First create a docker image from (this can take a while)
```sh
docker build -t josketres/node-builder .
```

Then use that image to build your project:
```sh
./build-with-docker-container.sh
```
