---
uid: InstallEdgeDataStore
---

# Install Edge Data Store

**Note:**  You can change the port assignment either during or after installation. For more information on how to change the port number, see [System port configuration](xref:SystemPortConfiguration).

## Windows (Windows 10 x64)

You must have administrative privileges to run the installer.

1. To use any of the installers, copy the appropriate file to the file system of the device.
2. To start the installer UI, double-click the _EdgeDataStore.msi_ file in Windows Explorer.

    Alternatively, you can start the installer from the command line with the following command:

    ```bash
    msiexec /i EdgeDataStore.msi PORT=5590 INSTALLFOLDER="C:\otherdir"
    ```

    > **Note:** The INSTALLFOLDER (must be all caps) is optional. You can specify an alternate location for Edge Data Store's binary components. The default value is "C:\Program Files\OSISoft\EdgeDataStore". OSIsoft recommends you use the default value.

3. In the OSIsoft Edge Data Store Setup window, click **Next**.
4. Optional: Change the install folder and port number (default 5590) and select the Modbus or OpcUa component or both.

   > **Note:** The optional PORT must be in all caps. It can be changed to a valid value in the range of 1024 to 65535. Any other characters or values will be considered invalid. You should select a port not already in use by another program on the host because the installer will not check for this case.

    If you omit PORT=nnnn, the default will be used. The UI will start with the port pre-set to the value specified; validity will be checked as mentioned previously, with the install proceeding only when a valid port number is provided. If, however,the "quiet" or "no ui" flag for msiexec is specified, and the PORT value on the command line is not valid, the install will proceed with the default 5590 value.

5. Click **Next** > **Install**.
When the install finishes, Edge Data Store will be installed and running on the port specified.
6. Click **Finish**.

## Debian 9 or later Linux (Ubuntu  Raspberry PI, BeagleBone, other Debian based Linux distros)

You must have administrative privileges to install the software, for example root or sudo privilege. The following examples assume a user with permission to use sudo.

1. Open a terminal window and type:

    ```bash
    sudo apt install ./EdgeDataStore_linux-<either x64 or arm depending upon processor>.deb
    ```

    ![alt text](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/LinuxInstall1.jpg "Linux Installation")

    A validation check for prerequisites will be completed. If the Linux OS is up to date, the install will succeed.

    If the install fails, run the following commands from the terminal window and try the install again:

    ```bash
    sudo apt update
    sudo apt upgrade
    ```

    After the check for prerequisites succeeds, you will be prompted if you want to change the default port (5590).

2. Optional: Type the port value you want and press Enter. If 5590 is acceptable, press Enter.

    > **Note** If you specify an invalid value for the port, the install will proceed with the default value of 5590.

    You will then be prompted if you want to install a Modbus TCP or OPC UA EDS adapter in addition to the default Storage component. The default is not to install them. You can add them after the installation is complete if you want.

3. If you want to install neither EDS adapter, press enter to proceed.

    The install will complete and Edge Data Store will be running on your device.
