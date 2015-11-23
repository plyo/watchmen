FROM node:latest

MAINTAINER Aksel Gresvig

# Provides cached layer for node_modules
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/* /src/

# Install deps
RUN npm install -g pm2

# Define working directory
WORKDIR /src
ADD . /src

# Expose port
ENV WATCHMEN_WEB_PORT 8080
EXPOSE 8080

# Run app
CMD ["pm2", "start", "/src/run-monitor-server.js"]
CMD ["pm2", "start", "/src/run-web-server.js"]
