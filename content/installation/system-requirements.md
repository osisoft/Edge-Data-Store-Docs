---
uid: SystemRequirements
---

# System requirements

Edge Data Store is supported on a variety of platforms and processors. Install kits are available for the platforms listed in the following table.

| Operating System        | Platform               | Installation Kit               | Processors           |
|-------------------------|------------------------|--------------------------------|----------------------|
|  Windows 10 Enterprise <br> Windows 10 IoT Enterprise  <br> Windows 11   | x64   | EdgeDataStore_1.1.1.46-x64_.msi    | Intel/AMD 64-bit processors      |
| Debian 10, 11 <br> Ubuntu 20.04, 22.04  | x64       | EdgeDataStore_1.1.1.46-x64_.deb    | Intel/AMD 64-bit processors      |
| Debian 10, 11 <br> Ubuntu 20.04, 22.04  | ARM32     | EdgeDataStore_1.1.1.46-arm_.deb    | Arm 32-bit processors      |
| Debian 10, 11 <br> Ubuntu 20.04, 22.04  | ARM64     | EdgeDataStore_1.1.1.46-arm64_.deb  | Arm 64-bit processors      |

Alternatively, you can use `tar.gz` files with binaries to build your own custom installers or containers for Linux. For more information on installing EDS with Docker containers, see [Install Edge Data Store using Docker](xref:edgeDocker).

## PI Web API compatibility

This version of EDS is compatible with PI Web API 2021 and later.
