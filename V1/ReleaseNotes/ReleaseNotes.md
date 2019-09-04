---
uid: releaseNotes
---

# Edge Data Store Release Notes

## Overview

Edge Data Store is supported on a variety of platforms and processors. OSIsoft provides ready to use install kits for the following platforms:

* Windows 10 x64 - EdgeDataStore.msi (Intel/AMD 64 bit processors)
* Debian 9 or later x64/AMD64 - EdgeDataStore_linux-x64.deb (Intel/AMD 64 bit processors)
* Debian 9 or later ARM32 - EdgeDataStore_linux-arm.deb (Raspberry PI 2,3,4, BeagleBone devices, other ARM v7 and ARM v8 32 bit processors)

In addition to ready to use install kits, OSIsoft also provides examples of how to create Docker Containers in a separate file. tar.gz files are provided with binaries for customers who want to build their own custom installers or containers for Linux.

## Differences from Beta 2

### General

* The "OSIsoft Edge System" product was renamed to "OSIsoft Edge Data Store".
* The edgecmd command line utility is now provided to allow access to and modification of Edge Data Store configuration.  This utility supercedes the command line functionality that was previously available via OSIsoft.Data.System.Host.
* Improvements were made to ensure component health status updates may not lost when the product is shutdown.  
* When the reset functionality for the entire product or the storage component is invoked, the product now properly restarts.
* The OPCUA and Modbus adapters may now be enabled at install time of the product.
* The structure for health streams produced by the product has been updated.
* Adapter components may be added or removed at runtime and no longer requires a restart of the product.
* Changes to the Health Endpoints configuration are now applied at runtime and no longer requires a restart of the product.
* All endpoint configurations related to transfering data and configuration to PI Web Api or OSIsoft Cloud Services have the following new properties:
   * ValidateEndpointCertificate - Enable/Disable validation of endpoint certificate. Any endpoint certificate is accepted if false.
   * TokenEndpoint - For use with OSIsoft Cloud Services endpoints only.  Allows for alternative endpoint for retrieval of an OCS access token.

### Modbus Adapter

* Support has been added for an user-defined optional Streamid prefix.

### Storage

* Significant improvements have been made in the reliability and performance of egressing configuration and data to PI Web Api or OSIsoft Cloud Services.
* Improvements were made to ensure that no data is lost when egressing data to an egress endpoint.
* The OEM configuration facet of the Storage component has been deprecated.  The following configuration properties were relocated to the Storage Runtime configuration facet:
   * CheckpointRateInSec
   * TransactionLogLimitMB
   * EnableTransactionLog
* The Id property of a PeriodicEgressEndpoint configuration has been changed to be optional.  If one is not provided when the endpoint is configured, a unique value will be assigned to it.
* Improvements were made to improve resiliency of the product by ensuring data and configuration are properly checkpointed to storage.
* Improvements were made to handle a wider range of data corruptions encountered when power loss scenarios are encountered.
* In Beta 2, under certain data egress scenarios, the Storage component would attempt to retrieve all data destine to be egressed and then egress the data to the destination endpoint.  This could lead to high memory useage and potential stability issues.  This behavior has been changed to stream the data from streams in a more controlled manner leading to less memory being demanded.

## Install Edge Data Store on a Device using an install kit

To use any of the installers, first copy the appropriate file to the file system of the device.

### Windows (Windows 10 x64)

Double click the EdgeDataStore.msi file in Windows Explorer or execute the file from a command prompt. You will be prompted for install location and default port, and when the install finishes the EdgeDataStore will be installed and running on either the default port 5590 or the port you specified during the install.

### Debian 9 or later Linux (Ubuntu  Raspberry PI, BeagleBone, other Debian based Linux distros)

Open a terminal window and type:

```bash
sudo apt install ./EdgeDataStore_linux_<either x64 or arm depending upon processor>.deb
```

A check will be done for prerequisites. If the Linux OS is up to date, the install will succeed. If the install fails, run the following commands from the terminal window and try the install again:

```bash
sudo apt update
sudo apt upgrade
```

After the check for prerequisites succeeds, a prompt will display asking if you want to change the default port (5590). If you want to change the port type in another port in the acceptable range for the OS you are using, or if 5590 is acceptable, press enter.

The install will complete and EdgeDataStore will be running on your device. You can verify that EdgeDataStore is correctly installed by running the following script from the terminal window. **Note:** Depending on the processor, memory, and storage, it may take the system a few seconds to start up

```bash
curl http://localhost:5590/api/v1/configuration
```

If the installation was successful, you will get back a JSON copy of the default system configuration:

```json
{
  "Storage": {
    "PeriodicEgressEndpoints": [],
    "Runtime": {
      "streamStorageLimitMb": 2,
      "streamStorageTargetMb": 1,
      "ingressDebugExpiration": "0001-01-01T00:00:00",
      "checkpointRateInSec": 30,
      "transactionLogLimitMB": 250,
      "enableTransactionLog": true
    },
    "Logging": {
      "logLevel": "Information",
      "logFileSizeLimitBytes": 34636833,
      "logFileCountLimit": 31
    }
  },
  "Modbus1": {
    "Logging": {
      "logLevel": "Information",
      "logFileSizeLimitBytes": 34636833,
      "logFileCountLimit": 31
    },
    "DataSource": {},
    "DataSelection": []
  },
  "System": {
    "Logging": {
      "logLevel": "Information",
      "logFileSizeLimitBytes": 34636833,
      "logFileCountLimit": 31
    },
    "HealthEndpoints": [],
    "Port": {
      "port": 5590
    },
    "Components": [
      {
        "componentId": "OpcUa1",
        "componentType": "OpcUa"
      },
      {
        "componentId": "Modbus1",
        "componentType": "Modbus"
      },
      {
        "componentId": "Storage",
        "componentType": "EDS.Component"
      }
    ]
  },
  "OpcUa1": {
    "Logging": {
      "logLevel": "Information",
      "logFileSizeLimitBytes": 34636833,
      "logFileCountLimit": 31
    },
    "DataSource": {},
    "DataSelection": []
  }
}
```

If you get back an error, wait a few seconds and try it again. On a device with limited processor, memory, and slow storage, it may take some time before Edge Data Store is fully initialized and running for the first time.

## Known Issues

