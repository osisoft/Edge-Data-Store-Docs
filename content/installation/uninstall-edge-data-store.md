---
uid: UninstallEdgeDataStore
---

# Uninstall Edge Data Store

Uninstall Edge Data Store to remove the program files from a device. The data files, configuration files, and log files can also be removed.

## Uninstall from Windows

To remove EDS from a Windows device, follow these steps:

1. To remove the EDS program files from a Windows device, use the Windows Control Panel uninstall application process.

    The configuration, data, and log files are not removed by the uninstall process.

1. (Optional) To remove all data stored in the Edge Storage component, all configuration files, and all log files, delete the directory `C:\ProgramData\OSIsoft\EdgeDataStore`.

## Uninstall from Linux

To remove EDS from a Linux device, follow these steps:

1. To remove EDS software from a Linux device, open a terminal window and run the following command:

    ```bash
    sudo apt remove osisoft.edgedatastore

    ```

The configuration, data, and log files are not removed by the uninstall process.

1. (Optional) To remove all data stored in the Edge Storage component, all configuration files, and all log files, delete the directory `/usr/share/OSIsoft/EdgeDataStore/`.

    Alternatively, run the following command:

    ```bash
    sudo rm -r /usr/share/OSIsoft/EdgeDataStore/
    ```
