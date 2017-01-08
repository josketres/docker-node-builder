# docker-node-builder
Build your node.js based project using a docker container to cache the dependencies

# Requirements
* docker

# How does it work?
First create a docker image (this image will contain the dependencies of your package.json)
```sh
docker build -t josketres/node-builder .
```

Then use that docker image to create a container to build your project:
```sh
./build-with-docker-container.sh
```
