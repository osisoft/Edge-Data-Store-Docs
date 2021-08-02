---
uid: disasterRecovery
---

# Disaster recovery

If a device with Edge Data Store installed fails, use the following procedures to recover data from the failed device and restore it to a new device. The disaster recovery process is similar for both Windows and Linux systems and includes the following steps:

- Back up the EDS data from the failed device to another location.

- Install EDS on a new device. For instructions, see [Install Edge Data Store](xref:InstallEdgeDataStore).

- Move the backed-up data to the new device.

- Restore the backed-up data files to the new device.

- Reenter credentials.

## Windows recovery

Use the following procedures to recover EDS data from a Windows device.

### Create a backup of EDS data from the failed device

**Prerequisite:** Administrative access on the device is needed to successfully restore on Windows system.

To create a backup of data from the failed device, perform the following steps:

1. If your device is still able to boot, verify that Edge Data Store service has stopped. Use the Windows Task Manager to stop the Edge Data Store service.

2. Locate the storage and configuration files.

   **Note:** Windows storage and configuration files are stored in the following locations:
   
	_C:\ProgramData\OSIsoft\EdgeDataStore\Configuration_
   
	_C:\ProgramData\OSIsoft\EdgeDataStore\Storage_

	Stream data files are stored in the following locations:

	Default namespace: _C:\ProgramData\OSIsoft\EdgeDataStore\Storage\data\default\default_
	
    Diagnostics namespace: _C:\ProgramData\OSIsoft\EdgeDataStore\Storage\data\default\diagnostics_
   
	The ProgramData folder is typically hidden; to view it, go to the **View** tab in **Windows Explorer** and select the **Hidden Items** check box.

3. Create a zip or tar file containing the storage and configuration directories, and move it to a USB device or other safe location. File transfer can be done with WinSCP, SFTP, or external device.

### Delete default storage and configuration folders

When EDS is installed on the new device, the new system has a default configuration. Perform the following steps to delete the default storage and configuration folders on the new device:

1. Use the Windows Task Manager to stop the Edge Data Store service.	

2. Once the service has stopped, navigate to the _C:\ProgramData\OSIsoft\EdgeDataStore_ directory, and delete the default storage and configuration folders from the new device.

### Restore backed up data files

To restore the data files on the new device, perform the following steps:

1. Copy or unzip the backup storage and configuration files into the _C:\ProgramData\OSIsoft\EdgeDataStore_ directory.

   **Note:** The C: drive may not be the default drive letter of your system. Refer to My Computer, This PC, or open a command prompt to verify the default drive letter.

2. Use the Windows Task Manager to restart the Edge Data Store service.

### Reenter credentials

All credentials are encrypted for security purposes, so they cannot be copied or transferred. After the the storage and configuration files are copied to the new system, and the service has started, perform the following steps to enter credentials:

1. Reenter the credentials for the operating system using API calls. 

2. After updating, restart the Edge Data Store service. 
	
The new EDS device runs as the previous device, and contains all the data up to the point when the previous device failed.

## Linux recovery

Use the following procedures to recover EDS data from a Linux device.

### Create a backup of EDS data from the failed device

To create a backup of data from the failed device, perform the following steps:

**Prerequisite:** Root access on the Linux device is required.

1. If your device is still able to boot, open a terminal window and verify that Edge Data Store service has stopped using the following command: 

	  ```
	  sudo systemctl stop osisoft.edgedatastore
	  ```

2. Locate the storage and configuration files.

   **Note:** Linux storage and configuration files are stored in the following locations:
	
	_/usr/share/OSIsoft/EdgeDataStore/Configuration_
	
	_/usr/share/OSIsoft/EdgeDataStore/Storage_

	Stream data files are stored in the following locations:

	Default namespace: _/usr/share/OSIsoft/EdgeDataStore/Storage/data/default/default_

    Diagnostics namespace: _/usr/share/OSIsoft/EdgeDataStore/Storage/data/default/diagnostics_

3. Create a zip or tar file containing the storage and configuration directories, and move it to a USB device or other safe location. Use WinSCP, SFTP, or the external device to transfer the file.

   **Note:** Using the _cp_ command may result in a change in file ownership to the current user. 

### Move the files to the new device

When EDS is installed on the new device, the new system has a default configuration. Perform the following steps to copy the backed up storage and configuration folders to the new device: 

1. Open a terminal window and stop the Edge Data Store service using the following command:

	  ```
	  sudo systemctl stop osisoft.edgedatastore
	  ```

2. Once the service has stopped, navigate to the _/usr/share/OSIsoft/EdgeDataStore_ directory and extract the zip or tar file in that directory using WinSCP, SFTP, or external device.

### Restore backed up data files

To restore the data files on the new device, perform the following steps:

1. Delete the default storage and configuration folders from the _/usr/share/OSIsoft/EdgeDataStore_ directory.

2. Copy or unzip the backup storage and configuration files into the EdgeDataStore directory.

3. If the ownership of the two directories does not match, update it to _edgedatastore_ for the user and group. 

4. Start the Edge Data Store service with the following command:

	  ```
	  sudo systemctl start osisoft.edgedatastore
	  ```

5. Verify that EDS is running with the following command:

	  ```
	  sudo systemctl status osisoft.edgedatastore
	  ```

   **Note:** Default directory permissions are set to 755, and each subsequent file is 644. If you do not use tar it is possible to have permission issues with the recovery files. Tar matches via string name rather than the account ID/UID.
 
### Reenter credentials

All credentials are encrypted for security purposes, so they cannot be copied or transferred. After the the storage and configuration files are copied to the new system, and the service has started, perform the following steps to enter credentials:

1. Re-enter the credentials for the operating system using API calls. 

2. After updating, restart the Edge Data Store service. 

The new EDS device runs as the previous device, and contains all the data up to the point when the previous device failed.
