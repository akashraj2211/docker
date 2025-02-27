# Use an official Node.js runtime as the base image.
FROM node:14
# Specify the working directory inside the container.
WORKDIR /app
# Copy package.json and package-lock.json files
COPY package*.json ./
# Install the application dependencies
RUN npm install
# Copy the rest of the application code
COPY . .
# Define the command to run the application
CMD ["node", "app.js"]