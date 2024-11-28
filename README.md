# Docker-images

## Introduction

Docker images are the building blocks of containers. They are lightweight, portable, and self-sufficient packages that contain everything needed to run a software application, including the code, runtime, libraries, and system tools. Images are created from a set of instructions known as a Dockerfile, which specifies the environment and configuration for the application.

## Pulling image from docker hub

Docker hub  is a cloud-based registry that hosts a vast collection of Docker images. You can pull images from Docker Hub to your local machine using the `docker pull` command
To explore available images on Docker Hub, the docker command provides a search subcommand. For instance, to find the Ubuntu image, you can execute:
`docker search ubuntu`
This command allows you to discover and explore various images hosted on Docker Hub by providing relevant search results. In this case, the output will be similar to this:

`docker pull ubuntu`
Executing this command will fetch the official Ubuntu image from Docker Hub and store it locally on your machine, making it ready for use in creating containers.

Once an image has been successfully downloaded, you can proceed to run a container using that downloaded image by employing the "run" subcommand. Similar to the hello-world example, if an image is not present locally when the

To view the list of images that have been downloaded and are available on your local machine, enter the following command:
`docker images`

Executing this command provides a comprehensive list of all the images stored locally, allowing you to verify the presence of the downloaded image and gather information about its size, version, and other relevant details.

## Dockerfile

A Dockerfile is a plaintext configuration file that contains a set of instructions for building a Docker image. It serves as a blueprint for creating a reproducible and consistent environment for your application. Dockerfiles are fundamental to the containerization process, allowing you to define the steps to assemble an image that encapsulates your application and its dependencies.

## Creating a docker file

To create a Dockerfile, use a text editor of your choice, such as vim or nano. Start by specifying a base image, defining the working directory, copying files, installing dependencies, and configuring the runtime environment.

Here's a simple example of a Dockerfile for a html file:
Let's create an image with using a dockerfile. Paste the code snippet below in a file named

```docker
FROM nginx:latest

WORKDIR  /usr/share/nginx/html/

COPY index.html /usr/share/nginx/html/

EXPOSE 80
```

# No need for CMD as NGINX image comes with a default CMD to start the server

To build an image from this Dockerfile, navigate to the directory containing the file and run:
`docker build -t dockerfile .`

To run the image
`docker run -p 8080:80 dockerfile`