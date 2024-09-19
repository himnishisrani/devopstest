# Use the official Node.js image.
# https://hub.docker.com/_/node
FROM node:14

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Copy the source code into the container image.
COPY . .

# Run the web service on container startup.
CMD [ "node", "app.js" ]

# Document that the service listens on port 8080.
EXPOSE 8000
