---
uid: edgeDocker
---

# Using Edge System with Docker

Docker is a set of tools that can be used on Linux to manage application deployments. It is beyond the scope of this document to explain concepts behind Docker containers, and it is assumed that if a reader wants to use Docker they are familiar with the underlying technology, and have determined it is appropriate for their planned use of Edge System.

The objective of this document is to provide examples of how to successfully create a Docker container with Edge System, if you have decided that you want to use Docker. Docker is not a requirement to use Edge System, and is regarded as an advanced user scenario.

## Creating a Docker container for Edge System

### ARM32 Processor

1. Create the following Dockerfile in the directory where you wish to create and/or run the container:

```docker
FROM mcr.microsoft.com/dotnet/core/sdk:2.2
ARG source
WORKDIR /
ADD ./EdgeSystem_linux-arm.tar .
ENTRYPOINT ["./EdgeSystem_linux-arm/OSIsoft.Data.System.Host"]
```

2. Copy the EdgeSystem_linux-arm.tar file to the same directory as the Dockerfile.
3. Run the following command line (sudo may be necessary):

```bash
docker build -t edgesystem .
```

### AMD64 (x64) Processor

1. Create the following Dockerfile in the directory where you wish to create and/or run the container:

```docker
FROM mcr.microsoft.com/dotnet/core/sdk:2.2
ARG source
WORKDIR /
ADD ./EdgeSystem_linux-x64.tar .
ENTRYPOINT ["./EdgeSystem_linux-x64/OSIsoft.Data.System.Host"]
```

2. Copy the EdgeSystem_linux-x64.tar file to the same directory as the Dockerfile.
3. Run the following command line (sudo may be necessary):

```bash
docker build -t edgesystem .
```

## Running Edge System Docker containers

### REST access from the local machine from Docker

To run the container you can use the command line (sudo may be necessary):

```bash
docker run -d --network host edgesystem
```

Port 5590 will be accessible from the host and REST calls can be made to the Edge System from applications on the local host computer. With this configuration, all data stored by the Edge System is stored in the container itself, and when the container is deleted the data stored will also be deleted.

### Persistent storage on the local file system from Docker

To run the container you can use the command line (sudo may be necessary):

```bash
docker run -d --network host -v /edgeds:/usr/share/OSIsoft/ edgesystem
```

Port 5590 will be accessible from the host and REST calls can be made to the Edge System from applications on the local host computer. In addition, in this example, all data that would be written to the container is written instead to the host directory /edgeds. This directory can be anything the user wishes - this example just uses a simple directory on the local machine.

### Changing Port number from Docker

If a port other than 5590 is desired, see the section regarding [Port configuration](#edgeSystemConfiguration) of the Edge System. Changing the configuration of the Edge System running in the container will change the port exposed to the local machine.

### Limiting local host access to Docker

If the `--network host` option is removed from the docker run command no REST access is possible from outside the container. This may be of value where a user wishes to host an application in the same container as the EdgeSystem, and does not wish to have external REST access enabled.
