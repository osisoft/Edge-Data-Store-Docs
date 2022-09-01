---
uid: edgeDocker
---

# Install Edge Data Store with Docker

Docker is a set of tools you can use on Linux to manage application deployments. This topic provides examples of how to create a Docker container with Edge Data Store (EDS).

**Note**: You should only use Docker to install EDS if your environment requires it and you are proficient with Docker. Docker is not required to use EDS.

## Create a startup script

To create a startup script for EDS:

1. Use a text editor to create a script similar to one of the following examples:

    **Note**: The script varies slightly by processor.

    **ARM32**

    ```bash
    #!/bin/sh
    if [ -z $portnum ] ; then
        exec /EdgeDataStore_linux-arm/OSIsoft.Data.System.Host
    else
        exec /EdgeDataStore_linux-arm/OSIsoft.Data.System.Host --port:$portnum
    fi
    ```

    **ARM64**

    ```bash
    #!/bin/sh
    if [ -z $portnum ] ; then
        exec /EdgeDataStore_linux-arm64/OSIsoft.Data.System.Host
    else
        exec /EdgeDataStore_linux-arm64/OSIsoft.Data.System.Host --port:$portnum
    fi
    ```

    **AMD64**

    ```bash
    #!/bin/sh
    if [ -z $portnum ] ; then
        exec /EdgeDataStore_linux-x64/OSIsoft.Data.System.Host
    else
        exec /EdgeDataStore_linux-x64/OSIsoft.Data.System.Host --port:$portnum
    fi
    ```

2. Name the script `edsdockerstart.sh` and save it to the directory where you plan to create the container.

## Create a Docker container

To create a Docker container that runs EDS:

1. Create the following `Dockerfile` in the directory where you want to create and run the container.

    **Note**: `Dockerfile` is the required name for the file. Use appropriate variation for your operating system:

    **ARM32**

    ```dockerfile
    FROM ubuntu:20.04
    WORKDIR /
    RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates libicu70 libssl3 curl
    COPY edsdockerstart.sh /
    RUN chmod +x /edsdockerstart.sh
    ADD ./EdgeDataStore_linux-arm.tar.gz .
    ENTRYPOINT ["/edsdockerstart.sh"]
    ```

    **ARM64**

    ```dockerfile
    FROM ubuntu:20.04
    WORKDIR /
    RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates libicu70 libssl3 curl
    COPY edsdockerstart.sh /
    RUN chmod +x /edsdockerstart.sh
    ADD ./EdgeDataStore_linux-arm64.tar.gz .
    ENTRYPOINT ["/edsdockerstart.sh"]
    ```

    **AMD64 (x64)**

    ```dockerfile
    FROM ubuntu:20.04
    WORKDIR /
    RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates libicu70 libssl3 curl
    COPY edsdockerstart.sh /
    RUN chmod +x /edsdockerstart.sh
    ADD ./EdgeDataStore_linux-x64.tar.gz .
    ENTRYPOINT ["/edsdockerstart.sh"]
    ```

2. Copy the `EdgeDataStore_linux-platform.tar.gz` file into the same directory as the `Dockerfile`.

3. Copy the `edsdockerstart.sh` script into the same directory as the `Dockerfile`.

4. Run the following command line in the same directory:

   **Note**: You may need to include the `sudo` command.

    ```bash
    docker build -t edgedatastore .
    ```

## Docker container startup

The following procedures contain instructions on how to run EDS inside a Docker container with different options enabled.

**Note**: Before running the Docker container, determine whether to store the data in the container or in a host directory.

### Run the Docker container with REST access enabled

To run EDS inside a Docker container with access to its REST API from the local host, complete the following:

1. Use the Docker container image `edgedatastore` you previously created.

2. Type the following in the command line:
3.
   **Note**: You may need to include the `sudo` command.

    ```bash
    docker run -d --network host edgedatastore
    ```

Port `5590` is accessible from the host and you can make REST calls to EDS from applications on the local host computer. In this example, all data retained by EDS is stored in the container itself. When you delete the container, the stored data is also deleted.

### Run the Docker container with persistent storage

To run EDS inside a Docker container while using the host for persistent storage, complete the following steps.

**Note**: This procedure also enables access to EDS REST API from the local host.

1. Use the docker container image `edgedatastore` you previously created.

2. Type the following in the command line:

   **Note**: You may need to include the `sudo` command.

    ```bash
    docker run -d --network host -v /edgeds:/usr/share/OSIsoft/ edgedatastore
    ```

Port `5590` is accessible from the host and you can make REST calls to EDS from applications on the local host computer. In this example, all data written to the container is written to the host directory instead and the host directory is a directory on the local machine, <!-- customize -->`/edgeds`. You can specify any directory.

### Change port number

To use a port other than `5590`, you can specify a `portnum` variable on the `docker run` command line. For example, to start EDS using port `6000` instead of `5590`, use the following command:

```bash
docker run -d -e portnum=6000 --network host edgedatastore
```

This command accesses the REST API with port `6000` instead of port `5590`. The following `curl` command returns the configuration for the container.

```bash
curl http://localhost:6000/api/v1/configuration
```

### Remove REST access

If you remove the `--network host` option from the docker run command, REST access is not possible from outside of the container. This may be useful if you want to host an application in the same container as EDS without external REST access enabled.

## Upgrade

To upgrade a Docker container with persistent storage to the latest version of EDS, you should follow the process above for creating a new container image. Then, when you run the container, use the same persistent storage that you previously used. This allows you to carry over all of the configuration data to the upgraded container.

**Note**: If you previously used the REST API to change the port number the container listened on, you will need to follow the [Change port number](#change-port-number) section to reenable listening on the specified port.
