#!/bin/bash

# Use a Linux base image
FROM ubuntu:20.04

ENV HTTP_TIMEOUT=600

# Set the HTTP and HTTPS proxy environment variables if required
ENV http_proxy=http://abc:x0x0
ENV https_proxy=http://abc:x0x0


# Update the package manager (apt-get) to use the proxy
RUN echo 'Acquire::http::Proxy "http://proxy.ibab.ac.in:3128";' >> /etc/apt/apt.conf

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    wget \
    build-essential \
    jellyfish \
    salmon \
    && rm -rf /var/lib/apt/lists/*
    
# Download and install Trinity
WORKDIR /usr/local
RUN wget https://github.com/trinityrnaseq/trinityrnaseq/releases/download/Trinity-v2.15.1/trinityrnaseq-v2.15.1.FULL.tar.gz && \
    tar -xvzf trinityrnaseq-v2.15.1.FULL.tar.gz && \
    cd trinityrnaseq-v2.15.1.FULL/trinityrnaseq-v2.15.1 && \
    make

# Set the entrypoint
CMD ["/usr/local/trinityrnaseq-v2.15.1.FULL/trinityrnaseq-v2.15.1/Trinity"]


