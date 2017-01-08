FROM ubuntu:trusty
MAINTAINER "Josue Zarzosa (josketres@gmail.com)"

# node + gulp-cli
RUN apt-get update && apt-get -y upgrade && apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN apt-get install -y nodejs build-essential
RUN npm install -g gulp-cli

# last layers with project dependencies
ADD package.json /cached-dependencies/package.json
RUN cd /cached-dependencies && npm install
