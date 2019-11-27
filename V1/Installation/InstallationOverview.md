---
uid: installationOverview
---

# Installation of Edge Data Store

## Overview

Edge Data Store is supported on a variety of platforms and processors. OSIsoft provides ready to use install kits for the following platforms:

* Windows 10 x64 - EdgeDataStore.msi (Intel/AMD 64 bit processors)
* Debian 9 or later x64/AMD64 - EdgeDataStore_linux-x64.deb (Intel/AMD 64 bit processors)
* Debian 9 or later ARM32 - EdgeDataStore_linux-arm.deb (Raspberry PI 2,3,4, BeagleBone devices, other ARM v7 and ARM v8 32 bit processors)
* Debian 9 or later ARM64 - EdgeDataStore_linux-arm.deb (Other ARM v7 and ARM v8 64 bit processors)

Additionally, OSIsoft also provides examples of how to create [Docker containers](xref:edgeDocker). For customers who want to build their own custom installers or containers for Linux, tar.gz files are provided with binaries.

## Install Edge Data Store on a device using an install kit

To use any of the installers, copy the appropriate file to the file system of the device.

With the installers, you can configure the port assignment at install time. The default port is 5590. You can specify any numeric value in the range of 1024 to 65535. Any other characters or values will be considered invalid. You should select a port not already in use by another program on the host because the installer will not check for this case.

**Note**  You can change the port assignment after installation. For more information, see [configuration](xref:EdgeDataStoreConfiguration).

### Windows (Windows 10 x64)

You must have administrative privileges to run the installer.

1. To start the installer UI, double-click the EdgeDataStore.msi file in Windows Explorer.
2. In the _OSIsoft Edge Data Store Setup_ window, click **Next**.
3. Optional: Change the install folder and port number (default 5590) and select the Modbus or OpcUa component or both.
4. Click **Next** > **Install**.
When the install finishes, Edge Data Store will be installed and running on the port specified.
5. Click **Finish**.

**Note** The UI based installer will prompt for a port value, and will not proceed if an invalid port is specified.

The installer can be started from the command line with the following command:

```bash
msiexec /i EdgeDataStore.msi PORT=5590 INSTALLFOLDER="C:\otherdir"
```

The PORT (shown previously as the default value; must be in all caps) is optional, and can be changed to a valid value that you want. If you omit PORT=nnnn, the default will be used. The UI will start with the port pre-set to the value specified; validity will be checked as mentioned previously, with the install proceeding only when a valid port number is provided. If, however, the "quiet" or "no ui" flag for msiexec is specified, and the PORT value on the command line is not valid, the install will proceed with the default 5590 value.

The INSTALLFOLDER (must be all caps) is also optional. You can specify an alternate location for Edge Data Store's binary components. The default value is "C:\Program Files\OSISoft\EdgeDataStore". OSIsoft recommends you use the default value.

#### Windows uninstallation

To remove the EdgeDataStore program files from a computer, use the Windows Control Panel uninstall application process. The configuration, data, and log files will not be removed by the uninstallation process.

To remove data, configuration and log files, remove the directory C:\ProgramData\OSIsoft\EdgeDataStore\. This will result in deletion of all data stored in the Edge Storage component in addition to configuration and log files.

### Debian 9 or later Linux (Ubuntu  Raspberry PI, BeagleBone, other Debian based Linux distros)

You must have administrative privileges to install the software, for example root or sudo privilege. The following examples assume a user with permission to use sudo.

- Open a terminal window and type:

```bash
sudo apt install ./EdgeDataStore_linux-<either x64, arm, or arm64 depending upon processor>.deb
```

![alt text](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/LinuxInstall1.jpg "Linux Installation")

A validation check for prerequisites will be completed. If the Linux OS is up to date, the install will succeed. If the install fails, run the following commands from the terminal window and try the install again:

```bash
sudo apt update
sudo apt upgrade
```

After the check for prerequisites succeeds, you will be prompted if you want to change the default port (5590). If you want to change the port type to another value in the acceptable range, type the port value you want and press Enter. If 5590 is acceptable, press Enter. You will then be prompted if you want to install a Modbus or OPC UA EDS adapter in addition to the default Storage component. The default is not to install them, so you can press enter to proceed if you want to install neither one. You can add them after the installation is complete if you want.

**Note** If you specify an invalid value for the port, the install will proceed with the default value of 5590.

The install will complete and Edge Data Store will be running on your device.

#### Linux uninstallation 

- To remove Edge Data Store software from a Linux computer, open a terminal window and run the command:

```bash
sudo apt remove osisoft.EdgeDataStore
```
Running this command will not delete the data, configuration, or log files.

To remove data, configuration, and log files, remove the directory /usr/share/OSIsoft/EdgeDataStore/. This will result in deletion of all data stored in the Edge Storage component, in addition to configuration and log files. You can do this with the following command:

```bash
sudo rm -r /usr/share/OSIsoft/EdgeDataStore/
```

## After installation (Windows and Linux)

You can verify that Edge Data Store is correctly installed by running the following script from the terminal window. Depending upon the processor, memory, and storage, it may take the system a few seconds to start up:

```bash
curl http://localhost:5590/api/v1/configuration
```

If the installation was successful, a JSON copy of the default system configuration will be returned:

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
        "componentId": "Storage",
        "componentType": "EDS.Component"
      }
    ]
  }
}
```

If you receive an error, wait a few seconds and try it again. On a device with limited processor, memory, and slow storage, it may take some time before the Edge Data Store is fully initialized and running for the first time.
