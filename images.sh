#!/bin/bash

# Exit the script on any error
set -e

# Variables
IMAGE_NAME="nginx:latest"
CUSTOM_IMAGE_NAME="custom-nginx"
LOCAL_PORT=8080
CONTAINER_NAME="nginx-container"
HTML_FILE="index.html"

# Step 1: Pull the Docker image from Docker Hub
echo "Pulling the Docker image: $IMAGE_NAME..."
docker pull $IMAGE_NAME

# Step 2: Search for images (optional, uncomment if needed)
# Uncomment the line below to search for Docker Hub images
# docker search ubuntu

# Step 3: Create a Dockerfile
echo "Creating Dockerfile..."
cat <<EOF > Dockerfile
# Use the official NGINX base image
FROM $IMAGE_NAME

# Set the working directory in the container
WORKDIR /usr/share/nginx/html/

# Copy the local HTML file to the NGINX default public directory
COPY $HTML_FILE /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# Default command is inherited from the NGINX base image
EOF

# Step 4: Create an example index.html file
if [[ ! -f $HTML_FILE ]]; then
  echo "Creating example $HTML_FILE..."
  echo "<!DOCTYPE html><html><head><title>Welcome</title></head><body><h1>Welcome to Darey.io</h1></body></html>" > $HTML_FILE
else
  echo "$HTML_FILE already exists, skipping creation."
fi

# Step 5: Build the Docker image
echo "Building Docker image: $CUSTOM_IMAGE_NAME..."
docker build -t $CUSTOM_IMAGE_NAME .

# Step 6: Run the Docker container
echo "Running the Docker container: $CONTAINER_NAME on port $LOCAL_PORT..."
docker run -d --name $CONTAINER_NAME -p $LOCAL_PORT:80 $CUSTOM_IMAGE_NAME

# Step 7: Verify the container is running
echo "Checking container status..."
docker ps | grep $CONTAINER_NAME

# Step 8: Print the success message with access URL
echo "Your application is now running. Access it at: http://localhost:$LOCAL_PORT"

# Optional: Clean up unused Docker resources (uncomment to enable)
# echo "Cleaning up unused Docker resources..."
# docker system prune -f

