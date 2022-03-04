---
uid: linuxWindows
---

# Linux and Windows platform differences

Edge Data Store is available on both Windows and Linux platforms and it works the same way on both platforms. There are a few differences between the platforms. Files are stored in different locations based on the platform and Linux systems have a file descriptor limit that can affect EDS function.

## File locations

### Windows

Program binaries are located in the `C:\Program Files\OSIsoft\EdgeDataStore` directory by default. For information about changing this location, see [Install Edge Data Store](xref:InstallEdgeDataStore). 

Configuration, log, and data files are located in `C:\ProgramData\OSIsoft\EdgeDataStore`. This location is not configurable. If you uninstall EDS, this folder structure is not automatically removed. For information about clearing these files, see [Uninstall Edge Data Store](xref:UninstallEdgeDataStore).

Key material for encrypted secrets of configuration files is stored using the Windows DPAPI in a secure Windows store. This is not configurable.

### Linux

File locations for Linux cannot be configured. 

Program binaries are located in the `/opt/OSIsoft/EdgeDataStore` directory. Configuration, log, and data files are located in `/usr/share/OSIsoft/EdgeDataStore`. If you uninstall EDS, this folder structure is not automatically removed. For information about clearing these files, see [Uninstall Edge Data Store](xref:UninstallEdgeDataStore).

Key material for encrypted secrets of configuration files is stored using limited access files under `/usr/share/OSIsoft/EdgeDataStore`. 

When the Debian installer is used, Edge Data Store is installed using the service identity `osisoft.edgedatastore.service`. If you need to restart the service from the Linux command line, use the following command:

```bash
sudo systemctl restart osisoft.edgedatastore.service
```

## File descriptors (handles)

When installed on a Linux operating system, EDS is configured with a file descriptor limit that may be higher than the corresponding limit for most processes. The limit is controlled by the `LimitNOFILE` variable in the file `/lib/systemd/system/osisoft.edgedatastore.service`.

Linux operating systems impose a limit on the number of file descriptors used in a process. The number of open file descriptors is directly related to the number of streams used in EDS, for example, data ingress. Every EDS stream uses two file descriptors. EDS will no longer function properly when it reaches the limit of available file descriptors. To ensure EDS functions properly, it is necessary to either limit the number of streams used in EDS or increase the maximum file descriptors allowed per process.

File descriptor usage differs on different Linux operating systems and devices, and may differ slightly from execution to execution, so it is important to understand your system and adjust accordingly.

For example, when tested on a Raspberry Pi 3 Model B+ using a Raspbian operating system, an installation of EDS with no user-defined streams had an average of 424 open file descriptors. The same installation with 250 streams had an average of 932 open file descriptors. The file descriptor limit per process for the operating system used was 1024.

Windows has an object called a handle that is used in much the same way that Linux uses file descriptors. However, Windows does not have a limitation on the number of handles.
