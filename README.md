**Trinity Docker Image for de novo RNA-Seq Assembly**

This repository contains a Dockerfile and a script to facilitate the de novo RNA-Seq assembly using Trinity. The Dockerfile sets up an environment with all the necessary dependencies for running Trinity and creates a Docker image. The script provides instructions for building the Docker image and running Trinity using the Docker image.
Dockerfile

The Dockerfile uses the Ubuntu 20.04 base image and installs the required packages for Trinity and its dependencies. It also sets the HTTP and HTTPS proxy environment variables if required. After installing the necessary packages, it downloads and installs Trinity.
Script File

The script file sets the HTTP_TIMEOUT environment variable and prints the http_proxy and https_proxy values. It then builds the Docker image using the Dockerfile and runs Trinity using the Docker image. The script mounts a directory containing the input files (R1_trimmed.fastq.gz and R2_trimmed.fastq.gz) to the Docker container and specifies the output directory (Output_docker) for Trinity.

This setup allows for easy and reproducible de novo RNA-Seq assembly using Trinity within a Docker container.
