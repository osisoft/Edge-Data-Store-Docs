---
uid: InstallEdgeDataStore
---

# Install Edge Data Store

You can install Edge Data Store using an install kit, as described in this section, or by using Docker containers. For more information, see [Install Edge Data Store using Docker](xref:edgeDocker).

For a list of supported platforms and processors, see [System requirements](xref:SystemRequirements).

**Note:**  You can change the port assignment either during or after installation. For more information on how to change the port number, see [System port configuration](xref:SystemPortConfiguration).

## Windows (Windows 10 x64)

You must have administrative privileges to run the installer. Complete the following to install Edge Data Store on Windows:

1. Copy the _EdgeDataStore.msi_ file to the file system of the device.
2. To start the installer, double-click the _EdgeDataStore.msi_ file in Windows Explorer.

    **Note:** To specify an alternate location for Edge Data Store's binary components from the default location of "C:\Program Files\OSISoft\EdgeDataStore", enter the following command in the command prompt and update the <file_path> with the path to the directory where you want to install the files. OSIsoft recommends you use the default value.
    
    ```bash
    msiexec /i EdgeDataStore.msi PORT=5590 INSTALLFOLDER=<file_path>
    ```

    **Note:** INSTALLFOLDER must be in all caps as shown in the preceding example.

3. In the OSIsoft Edge Data Store Setup window, click **Next**.
4. Optional: Change the install folder and port number (default 5590) and select the Modbus or OpcUa component or both.

   **Note:** Valid values are in the range of 1024 to 65535. Select a port not already in use on the host because the installer will not check for this case. In the command line, use the optional PORT parameter (must be in all caps) to specify the port. 

    If you omit PORT=nnnn, the default port will be used. The UI will start with the port pre-set to the value specified; validity will be checked as mentioned previously, with the install proceeding only when a valid port number is provided. However, if the "quiet" or "no ui" flag for msiexec is specified and the PORT value on the command line is not valid, the install will proceed with the default 5590 value.

5. Click **Next** > **Install**.

    When the install finishes, Edge Data Store will be installed and running on the port specified.
    
6. Click **Finish**.

## Linux

You must have administrative privileges to install the software, for example root or sudo privilege. Complete the following to install Edge Data Store on Linux:

1. Open a terminal window and type the sudo command for the installation kit appropriate to your operating system and processor. 

    **Debian 9 or later (Intel/AMD 64 bit processors)**

    ```bash
    sudo apt install ./EdgeDataStore_linux-x64.deb
    ```

    **Debian 9 or later (ARM32, Raspberry PI 2,3,4: Raspbian, BeagleBone)**

    ```bash
    sudo apt install ./EdgeDataStore_linux-arm.deb
    ```

    ![alt text](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/LinuxInstall1.jpg "Linux Installation")

    **Debian 9 or later (Raspberry PI 3,4: Ubuntu ARM64 Server, Google Coral Dev Board, Nvidia Nano Jetson)**

    ```bash
    sudo apt install ./EdgeDataStore_linux-arm64.deb
    ```

    A validation check for prerequisites will be completed. If the Linux OS is up to date, the install will succeed.

2. If the install fails, run the following commands from the terminal window and try the install again:

    ```bash
    sudo apt update
    sudo apt upgrade
    ```

    After the check for prerequisites succeeds, you will be prompted if you want to change the default port (5590).

3. Optional: Type the port value you want and press Enter. If 5590 is acceptable, press Enter.

   **Note:** If you specify an invalid value for the port, the install will proceed with the default value of 5590.

    You will then be prompted if you want to install a Modbus TCP or OPC UA EDS adapter in addition to the default Storage component. The default is not to install them. You can add them after the installation is complete if you want.

4. If you want to install neither EDS adapter, press Enter to proceed.

   The install will complete and Edge Data Store will be running on your device.
