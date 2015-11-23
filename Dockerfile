FROM node:latest

MAINTAINER Aksel Gresvig <aksel@plyo.io>

# Provides cached layer for deps
ADD package.json bower.json .bowerrc /tmp/
ADD bower.json /tmp/bower.json
WORKDIR /tmp
RUN npm install --quiet
RUN ./node_modules/.bin/bower install --allow-root --quiet
RUN mkdir -p /src && cp -a /tmp/* /src/

# Define working directory
WORKDIR /src
ADD . /src

# Expose port
ENV WATCHMEN_WEB_PORT 8080
EXPOSE 8080
