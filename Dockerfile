FROM node:latest

MAINTAINER Aksel Gresvig

# Provides cached layer for node_modules
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/* /src/

# Install deps
RUN npm install -g nodemon

# Define working directory
WORKDIR /src
ADD . /src

# Expose port
ENV WATCHMEN_WEB_PORT 8080
EXPOSE 8080

# Run app
CMD ["nodemon", "/src/run-monitor-server.js"]
CMD ["nodemon", "/src/run-web-server.js"]
