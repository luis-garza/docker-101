# Use node 10 runtime base image
FROM node:10-slim

# Set the app directory
WORKDIR /app

# Install app dependencies
COPY ./src/package.json /app
RUN npm install && \
    npm cache clean --force

# Copy app code
COPY ./src /app

# Make port 80 available
ENV PORT 80
EXPOSE 80

# Define container default command
CMD node server.js
