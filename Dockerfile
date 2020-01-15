FROM node:8.17.0-alpine3.11 as builder
# Create app directory
WORKDIR /usr/src/app

# Add dependency file
ADD ./src/package*.json ./

# Install dependencies
RUN npm install

# Add scripts
ADD ./src/server.js /usr/src/app

ENTRYPOINT ["node", "server.js"]
