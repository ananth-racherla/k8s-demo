FROM node:8.17.0-alpine3.11 as builder
# Create app directory
WORKDIR /usr/src/app

# Install app dependencies before copying the source.
# This ensures better utilization of docker layer caching
COPY package*.json ./

# npm ci should be faster than npm install and would not overwrite the package*.json files.
# only=production option would not install any devDependencies
RUN npm ci --only=production

# Bundle app source
COPY ./src/ ./src/

# Run the container as a nonroot user
#RUN addgroup --gid 2000 --system neptune && adduser --uid 1001 --system --ingroup neptune neptune

#USER neptune

# App port
EXPOSE 8080

# Metrics port
#EXPOSE 9999

CMD [ "node", "./src/server.js" ]
