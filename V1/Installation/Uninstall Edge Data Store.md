---
uid: UninstallEdgeDataStore
---

# Uninstall Edge Data Store

## Windows uninstallation

1. To remove the EdgeDataStore program files from a computer, use the Windows Control Panel uninstall application process.

    The configuration, data, and log files will not be removed by the uninstallation process.

2. Optional: To remove data, configuration and log files, remove the directory _C:\ProgramData\OSIsoft\EdgeDataStore_.

    This will result in deletion of all data stored in the Edge Storage component in addition to configuration and log files.

## Linux uninstallation

1. To remove Edge Data Store software from a Linux computer, open a terminal window and run the following command:

    ```bash
    sudo apt remove osisoft.EdgeDataStore
    ```

    > **Note:** Running this command will not delete the data, configuration, or log files.

2. Optional: To remove data, configuration, and log files, remove the directory _/usr/share/OSIsoft/EdgeDataStore/_.

    This will result in deletion of all data stored in the Edge Storage component, in addition to configuration and log files.

    Alternatively, you can run the following command:

    ```bash
    sudo rm -r /usr/share/OSIsoft/EdgeDataStore/
    ```
