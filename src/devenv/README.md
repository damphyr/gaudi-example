# Dockerized development environment

## Purpose

The dockerized development environment is a container, created via a Dockerfile, that contains all the tools required for building, deploying and testing locally.

## Usage notes

The root of your repository clone is mapped into `/workspace` within the container.

Changes made to files/folders anywhere else in the container's filespace are not
persisted when the container is exited.

## Setup

Build the docker image

```bash
docker build -t gaudi-devenv:latest .
```

Run the docker image

```bash
docker run --privileged -it --env HOST_UID=$(id -u) --env HOST_GID=$(id -g) gaudi-devenv:latest
```
