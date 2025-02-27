##########################Step-by-Step Process: How Containers Work?#####################

Step 1: Install Docker
Use the following command to install Docker on your local machine.
sudo yum -y install docker
Install Docker
Now start and enable docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
To Start,Enable & Check Status Of Docker

Step 2: Create a Dockerfile
A Dockerfile is a script containing a series of instructions on how to build a container image.
The Dockerfile typically starts with a base image (e.g., a specific version of Linux or an official image for a programming language like Python or Node.js).
Example Dockerfile:

=========================================================
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
==========================================================

Step 3: Create package.json file
Ensure that the express module is listed under the dependencies section.

==========================================================
{

  "name": "my-node-app",

  "version": "1.0.0",

  "main": "app.js",

  "dependencies": {

    "express": "^4.17.1"

  }

}
===========================================================

Step 4: Create the app.js File
If you need to create the file, here's a basic example:
const express = require('express');

===========================================================
const app = express();

const port = 3000;

app.get('/', (req, res) => {

  res.send('Hello, World!');

});

app.listen(port, () => {

  console.log(`App running on http://localhost:${port}`);

});
===========================================================


Step 5: Build the Container Image
Use the Dockerfile to build the container image. This image includes the application code, all dependencies, and any necessary environment settings.
Command to build the image:

===========================================================
docker build -t my-node-app .
===========================================================

The -t flag tags the image with a name (my-node-app) and the . shows that the Dockerfile is located in the current directory.
Command to build the image


Step 6: Store the Image
After building the image, it can be stored locally or pushed to a container registry (like Docker Hub or a private registry).
Command to push the image to Docker Hub:

============================================================
docker login -u username -p "password"
docker push akashraj2211/devops-projects:my-node-app-hello-world
============================================================

Step 7: Run the Container
Once the image is built (and optionally stored in a registry), it can be run as a container.
The container runs the application in an isolated environment, ensuring consistency across different deployment environments.
Command to run the container:

=============================================================
docker run -d -p 3000:3000 my-node-app
=============================================================

The -d flag runs the container in detached mode (in the background), and -p 3000:3000 maps port 3000 on the host to port 3000 on the container.
Run the Container
We can check container list by using following command

=============================================================
docker ps
=============================================================

To Check Container List


Step 8: Access the Application
Finally, if everything is set up correctly, you should be able to access your Node.js application by navigating to  in your web browser.

http://<Public IP > or <localhost>:3000
