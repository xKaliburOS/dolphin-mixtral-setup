# Use an official base image with your desired version
FROM ollama/ollama:latest

ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

# Set up the working directory
RUN mkdir -p /usr/app
WORKDIR /usr/app

RUN apt-get update
RUN apt-get install -y \
    software-properties-common \
    gpg-agent \
    build-essential apt-utils

RUN apt-get install --reinstall ca-certificates


RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python3 \
    python3-pip \
    python-is-python3

RUN pip install --upgrade pip
RUN pip install --upgrade runpod

# Add your file
COPY . .
RUN chmod +x create-model.sh
RUN ./create-model.sh
