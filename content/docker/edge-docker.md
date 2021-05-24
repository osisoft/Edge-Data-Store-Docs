---
uid: edgeDocker
---

# Install Edge Data Store using Docker

Docker is a set of tools that can be used on Linux to manage application deployments. To use Docker, you must be familiar with the underlying technology and have determined that it is appropriate for your planned use of Edge Data Store. Docker is not a requirement to use EDS.

The following examples describe how to create a Docker container for EDS. 

## Create a Docker container for EDS

1. Using the example appropriate for your operating system and processor, create the Dockerfile in the directory where you want to create and run the container. The file must be named Dockerfile.
2. Copy the appropriate .tar.gz file to the same directory as the Dockerfile.
3. Run the following command line in the same directory (sudo may be necessary):

```bash
docker build -t edgedatastore .
```

### ARM32 example

```bash
FROM ubuntu:18.04
WORKDIR /
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates libicu60 libssl1.0.0
ADD ./EdgeDataStore_linux-arm.tar.gz .
ENTRYPOINT ["./EdgeDataStore_linux-arm/OSIsoft.Data.System.Host"]
```

### ARM64 example

```bash
FROM ubuntu:18.04
WORKDIR /
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates libicu60 libssl1.0.0
ADD ./EdgeDataStore_linux-arm64.tar.gz .
ENTRYPOINT ["./EdgeDataStore_linux-arm64/OSIsoft.Data.System.Host"]
```

### AMD64 (x64) example

```bash
FROM ubuntu:18.04
WORKDIR /
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates libicu60 libssl1.0.0
ADD ./EdgeDataStore_linux-x64.tar.gz .
ENTRYPOINT ["./EdgeDataStore_linux-x64/OSIsoft.Data.System.Host"]
```

## Run the EDS Docker container

Before running the Docker container, determine whether to store the data in the container or in a host directory.

### REST access from the local machine from Docker

Complete the following steps to run the container:

1. Open command line.
2. Type the following in the command line (sudo may be necessary):

```bash
docker run -d --network host edgedatastore
```

Port 5590 is accessible from the host and you can make REST calls to EDS from applications on the local host computer. In this example, all data collected by EDS is stored in the container itself. When the container is deleted, the data stored is also deleted.

### Persistent storage on the local file system from Docker

Complete the following steps to run the container:

1. Open a terminal window.
2. Type the following in the command line (sudo may be necessary):

```bash
docker run -d --network host -v /edgeds:/usr/share/OSIsoft/ edgedatastore
```

Port 5590 is accessible from the host and you can make REST calls to EDS from applications on the local host computer. In this example, all data is written to the host directory, and the host directory is a directory on the local machine, /edgeds. You can specify any directory.

### Port number change

To use a port other than 5590, see [System port configuration](xref:SystemPortConfiguration). Changing the configuration of EDS running in the container changes the port exposed to the local machine.

### Limiting local host access to Docker

If you remove the `--network host` option from the docker run command, no REST access is possible from outside the container. This can be used when you want to host an application in the same container as EDS, and do not want to have external REST access enabled.
