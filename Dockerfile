# Test web-app to use with Pluralsight courses and Docker Deep Dive book
# Linux x64
FROM ubuntu:18.04

LABEL maintainer="nigelpoulton@hotmail.com"

# Replace apt source
ADD sources.list /etc/apt/sources.list

# Install Node and NPM
RUN apt-get update && apt-get -y install nodejs npm

# Copy app to /src
COPY . /src

WORKDIR /src

# Install dependencies
RUN npm install -g npm --registry=http://registry.npm.taobao.org
RUN npm config set registry http://registry.npm.taobao.org && npm install

EXPOSE 8080

ENTRYPOINT ["node", "./app.js"]
