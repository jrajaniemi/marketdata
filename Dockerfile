# Create image based on the official Node 6 image from dockerhub
FROM node:carbon

RUN npm set progress=false && npm config set depth 0 && npm cache clean --force

# Create a directory where our app will be placed
RUN mkdir -p /ng-app
RUN chown node:node /ng-app

# Change directory so that our commands run inside this new directory
WORKDIR /ng-app

# Copy dependency definitions
COPY package*.json /ng-app

# Install dependecies
RUN npm install

# Get all the code needed to run the app
COPY . .

# Expose the port the app runs in
EXPOSE 8080

# Serve the app
CMD ["npm", "start"]
