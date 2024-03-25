#!/bin/bash
export HTTP_TIMEOUT=300

echo $http_proxy
echo $https_proxy

# Step 1: Build the Docker image
docker build -t trinity_image .

# Step 2: Run Trinity using the Docker image
docker run --rm -v /home/group_bioIT01/Group_SH/Priyansha/denovo_assembly:/data trinity_image /usr/local/trinityrnaseq-v2.15.1.FULL/trinityrnaseq-v2.15.1/Trinity --left /data/R1_trimmed.fastq.gz --right /data/R2_trimmed.fastq.gz --output /data/Output_docker

