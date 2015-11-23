FROM node:latest

MAINTAINER Aksel Gresvig <aksel@plyo.io>

# Install deps
RUN npm install -g nodemon bower

# Provides cached layer for deps
ADD package.json bower.json .bowerrc /tmp/
ADD bower.json /tmp/bower.json
RUN cd /tmp && npm install --quiet && bower install --allow-root
RUN mkdir -p /src && cp -a /tmp/* /src/

# Define working directory
WORKDIR /src
ADD . /src

# Expose port
ENV WATCHMEN_WEB_PORT 8080
EXPOSE 8080

# Run app
CMD ["nodemon", "/src/run-monitor-server.js"]
CMD ["nodemon", "/src/run-web-server.js"]
