---
uid: InstallEdgeDataStore
---

# Install Edge Data Store

Install Edge Data Store using an install kit, as described in this section, or using Docker containers. For more information on using Docker, see [Install Edge Data Store using Docker](xref:edgeDocker).

For a list of supported platforms and processors, see [System requirements](xref:SystemRequirements).

The installation includes the OPC UA EDS adapter, the Modbus TCP EDS adapter, and the Sequential Data Store (SDS) storage. An OPC UA EDS adapter instance and a Modbus TCP EDS adapter instance can each be added during the installation. Additional instances can be added for each adapter after installation. For more information, see [Data ingress configuration](xref:EDSDataIngress).

The port assignment can be changed either during or after installation. For more information on how to change the port number after installation, see [System port configuration](xref:SystemPortConfiguration).

## Windows (Windows 10 x64)

You must have administrative privileges on the device to install EDS. Run the installation file directly to step through a wizard, or use the command line to run the installation, including silent installation.

For instructions on verifying the EDS installation, see [Verify installation](xref:VerifyInstallation).

### Download the install file

To download the Windows installation file:

1. Download the Windows `EdgeDataStore.msi` file from the [OSIsoft Customer portal](https://customers.osisoft.com/s/products).

  **Note:** Customer login credentials are required to access the portal.

1. Copy the `EdgeDataStore.msi` file to the file system of the device.

### Run the installation wizard

To install EDS on Windows using the installation wizard:

1. To start the installer, double-click the `EdgeDataStore.msi` file in Windows Explorer.

1. In the `OSIsoft Edge Data Store Setup` window, select **Next**.

1. (Optional) Change the installation folder and port number.

   **Note:** OSIsoft recommends you use the default installation path. Valid values for the port number are in the range of 1024 to 65535 and only an unused port number should be entered. The default port is 5590.

1. (Optional) Add a system component for a Modbus TCP EDS adapter instance, an OPC UA EDS adapter instance, or both.

   **Note:** The Modus TCP EDS adapter and the OPC UA EDS adapter are both installed, regardless of whether system components are added. Additional system components can be added for each adapter after installation.

1. Select **Next** > **Install**.

1. Select **Finish**.

### Run the installation from a command line

To install EDS on Windows from the command line:

1. Open a command window, by running as an administrator, and change the working directory to the location of the `EdgeDataStore.msi` file.

1. Enter the `msiexec` command and specify parameters to run the installation, using the following example as a guide.

```
Msiexec /quiet /i EdgeDataStore.msi PORT="<number>" INSTALLFOLDER="<file_path>" WIXUI_ENABLEMODBUS="1" WIXUI_ENABLEOPCUA="1"
```

  Parameters:

  - `/quiet` – The installation runs in silent mode.

  - `/i` – This is the install flag.

  - `PORT` – Specify a port other than the default of 5590. If the "quiet" or "no ui" flag for msiexec is specified and the PORT value on the command line is not valid, the install will proceed with the default 5590 value.

  - `INSTALLFOLDER` – Specify an alternate location for the binary components other than the default location of "%PROGRAMFILES%\OSISoft\EdgeDataStore". OSIsoft recommends you use the default installation path.

  - `WIXUI_ENABLEMODBUS` – Add a system component to create a Modbus TCP EDS adapter instance. The value must be 1 for the component to be added.

  - `WIXUI_ENABLEOPCUA` - Add a system component to create a OPC UA EDS adapter instance. The value must be 1, for the component to be added.

**Note:** If you do not specify a parameter, the default value for the parameter is used. Property names must be in all capital letters, for example, `PORT`.

## Linux

You must have administrative privileges to install the software, for example `root` or `sudo` privilege, and the Linux OS must be up to date for the install to succeed.

For instructions on how to verify the Edge Data Store installation, see [Verify installation](xref:VerifyInstallation).

**Note:** For devices using Ubuntu 20.04 or higher, install the libicu63 package prior to installing Edge Data Store.

### Download the distribution file

To download the appropriate file for your device:

1. Download the Linux distribution file from the [OSIsoft Customer portal](https://customers.osisoft.com/s/products).

**Note:** Customer login credentials are required to access the portal.

1. Copy the Linux distribution file to the file system of the device.

### Install on a Linux device

To install EDS on Linux:

1. Open a terminal window and change the working directory to the location of the distribution file.

1. Run the apt install command for the distribution file appropriate to your operating system and processor.

   **Debian 9 or later (Intel/AMD 64-bit processors)**

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

   A validation check for prerequisites is performed.

1. If the install fails, run the following commands from the terminal window and try the install again:

   ```bash
   sudo apt update
   sudo apt upgrade
   ```

1. (Optional) Change the port number and press Enter. The default port is 5590.

   **Note:** If you specify an invalid value for the port, the install will proceed with the default value of 5590.

1. (Optional) Add a system component for a Modbus TCP EDS adapter instance, an OPC UA EDS adapter instance, or both, and press Enter.

    **Note:** The Modus TCP EDS adapter and the OPC UA EDS adapter are both installed, regardless of whether system components are added. Additional system components can be added for each adapter after installation.

### Silent install on a Linux device

To perform a silent install EDS on Linux with all default options:

1. Open a terminal window and change the working directory to the location of the distribution file.

1. Run the apt-get install command for the distribution file appropriate to your operating system and processor.

   ```bash
   sudo apt-get install -q -y ./Edgeinstallfile.deb < /dev/null
   ```

   Parameters:

   - `-q` – Specifies a silent install.

   - `-y` – Responds Yes to installing prerequisites.

   - `Edgeinstallfile.deb` – The name of the distribution file.

   - `< /dev/null` – All defaults are used in the installation.

### Silent install on a Linux device with specified parameters

Complete the following steps to perform a silent install EDS on Linux using a parameter file to customize the installation:

1. Create a file called `silent.ini` with the following parameters on separate lines:

    - <port_number>

    - <Y/N> - Specifies whether to create a Modbus TCP EDS component.

    - <Y/N> - Specifies whether to create an OPCUA EDS component.

    For example:

    ```
    4567
    Y
    N
    ```

1. Open a terminal window and change the working directory to the location of the distribution file.

1. Run the apt-get install command for the distribution file appropriate to your operating system and processor.

   ```bash
   sudo apt-get install -q -y ./Edgeinstallfile.deb < silent.ini
   ```

  Parameters:

  - `-q` – Specifies a silent install.

  - `-y` – Responds Yes to installing prerequisites.

  - `Edgeinstallfile.deb` – The name of the distribution file.

  - `< silent.ini` – The file with the installation properties.
