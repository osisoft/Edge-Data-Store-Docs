---
uid: releaseNotes
---

# Edge Data Store Beta 2 Release Notes

Edge Data Store Beta 2 contains all the features expected to be present in the first release of Edge Data Store. Since this is a Beta release, some features may change slightly in the final release, but most of the engineering work will focus on bug fixes and performance improvements after this Beta.

This is the second beta release of the combined Edge Data Store - including Storage (SDS and OMF) along with Modbus and Opc Ua connectivity. Upon installation, storage functions will be immediately available - Modbus TCP and OPC UA will require additional configuration steps. Additional steps for configuring connectivity will be available, along with other documentation at <https://edge-docs.osisoft.com/> shortly after Beta 2 is available.

## Overview

Edge Data Store is supported on a variety of platforms and processors. OSIsoft provides ready to use install kits for the following platforms:

* Windows 10 x64 - EdgeSystem.msi (Intel/AMD 64 bit processors)
* Debian 9 or later x64/AMD64 - EdgeSystem_linux-x64.deb (Intel/AMD 64 bit processors)
* Debian 9 or later ARM32 - EdgeSystem_linux-arm.deb (Raspberry PI 2,3,4, BeagleBone devices, other ARM v7 and ARM v8 32 bit processors)

In addition to ready to use install kits, OSIsoft also provides examples of how to create Docker Containers in a separate file. tar.gz files are provided with binaries for customers who want to build their own custom installers or containers for Linux.

## Differences from Beta 1

* Edge Data Store is built using Microsoft .NET Core version 2.2.6.
* The default port has been changed from 5000 to 5590. It can be changed during the install process, and also through configuration after installation.  Changing the port requires a restart of Edge Data Store for it to take effect.
* When run in a Docker container, the exposed port is now 5590 and not port 80 as in Beta 1.
* Entire Edge Data Store (including Modbus TCP and OPC UA adapters) can now be configured using a single file in a single REST call.
* Secret storage on Linux has been moved from the /.OSIsoft to a directory under /usr/share/OSIsoft.
* PeriodicEgressTargets has been renamed to PeriodicEgressEndpoints.
* StreamStorage configuration has been renamed Runtime configuration and includes a new setting for ingress debugging.
* Both ingress and egress debugging options have been changed from a boolean value to a DateTime. After the configured DateTime for debugging, it will automatically be disabled.
* OMF Health messages are now supported for all Edge Components (Storage, Modbus TCP, OPC UA)
* A new diagnostics namespace has been added where streams are populated by components in the system with information useful for monitoring performance and reliabiliy. It can be egressed to a remote PI Web API server or OSIsoft Cloud Services to assist with remote montitoring of an Edge Data Store.
* Support for PI Connector Relay has been removed - the only authentication models supported for egress are now Basic Authentication for PI Web Api, and ClientId and ClientSecret for OSIsoft Cloud Services.
* Schemas for a number of configuration files have changed to make them more consistent across different components. Please refer to the updated documentation for the new schemas.
* Issues related to errors caused by egressing data upon startup of the product have been resolved.
* The TypePrefix property  is now properly applied to types when they are egressed to PI Web Api or OSIsoft Cloud Services.
* The Event Filtering capabilities of PeriodicEgressEndpoints has been removed from the product.
* Significant improvements have been made in the reliability of egressing data to PI Web Api or OSIsoft Cloud Services.
* Edge Data Store now supports a REST method for performing a full reset of the product, which will include removal of all existing configuration and stored event data.
* A new REST method has been added for purging all stored event data and configuration related to the Storage component.
* Individual connectivity components may be started and stopped through newly added REST methods.
* Startup of Edge Data Store has been made more resilient so that the product will start and may be configured even in circumstances where it's improperly configured.
* Library libicu63 is now added as a dependency on Linux so Edge Data Store may properly install on Raspberry PI 4 devices.
* The optional Type and Stream prefix strings for PeriodicEgressTargets were relaxed. Previously they had to be alphanumeric with an optional underscore. They can now be any string, including special characters, but there are a list of restriced characters that are not allowed. See documentation for list of restricted characters.

## Install Edge Data Store on a Device using an install kit

To use any of the installers, first copy the appropriate file to the file system of the device.

### Windows (Windows 10 x64)

Double click the EdgeSystem.msi file in Windows Explorer or execute the file from a command prompt. You will be prompted for install location and default port, and when the install finishes the EdgeSystem will be installed and running on either the default port 5590 or the port you specified during the install.

### Debian 9 or later Linux (Ubuntu  Raspberry PI, BeagleBone, other Debian based Linux distros)

Open a terminal window and type:

```bash
sudo apt install ./EdgeSystem_linux_<either x64 or arm depending upon processor>.deb
```

A check will be done for prerequisites. If the Linux OS is up to date, the install will succeed. If the install fails, run the following commands from the terminal window and try the install again:

```bash
sudo apt update
sudo apt uggrade
```

After the check for prerequisites succeeds, a prompt will display asking if you want to change the default port (5590). If you want to change the port type in another port in the acceptable range for the OS you are using, or if 5590 is acceptable, press enter.

The install will complete and EdgeSystem will be running on your device. You can verify that EdgeSystem is correctly installed by running the following script from the terminal window. **Note:** Depending on the processor, memory, and storage, it may take the system a few seconds to start up

```bash
curl http://localhost:5590/api/v1/configuration
```

If the installation was successful, you will get back a JSON copy of the default system configuration:

```json
{
    "Storage": {
        "Runtime": {
            "streamStorageLimitMb": 2,
            "streamStorageTargetMb": 1,
            "ingressDebugExpiration": "0001-01-01T00:00:00"
        },
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "OEM": {
            "checkpointRateInSec": 30,
            "transactionLogLimitMB": 250,
            "enableTransactionLog": true
        },
        "PeriodicEgressEndpoints": []
    },
    "System": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "Components": [{
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
        ],
        "HealthEndpoints": [],
        "Port": {
            "port": 5590
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

When configuration is retrieved from a default installation of Edge Data Store <http://localhost:5590/api/vi/configuration>, the output JSON cannot be successfully written back to configure the system. The workaround is to remove the OEMConfiguration section of the JSON schema and any non-configured Modbus or Opc Ua components before updating the configuration. Otherwise, 400 errors will occur when the <http://localhost:5590/api/vi/configuration> URI is called with a PUT command. This will be fixed before the inital release of Edge Data Store.

Final component health status updates may be lost when the product is shutdown.  This will be fixed before the inital release of the Edge Data Store.

The Edge Data Store reset and Storage component reset methods do not properly restart the server when invoked. You must manually restart the server in order to complete the reset of the System or Storage component. This will be fixed before the inital release of the Edge Data Store.
