#
# Edge Data Store

_Disaster Recovery Process Guidelines_

_(Windows and Linux Systems)_

#

# Intro

This guide will go step by step through the process of recovering Edge Data Store stream data and configuration files. There will be a section for Windows and a section for Linux. If any item has an asterisk like _\* __#__ important_ then refer to the page footer for more information. One last piece of information, this guide does not cover recovering security credentials. Once the new system has the back up files loaded, you will need to re-enter credentials for egress points.

Quick Overview: This will cover creating a backup of the files, moving them to a new system, and then restoring the back up files onto the new system.

**Please refer to the &quot;Credentials&quot; section located at the end of the document before starting.**

# Windows Recovery

_**Step 1 – Creating a backup_**

First, you will need to have administrative access on the device to successfully restore on Windows systems.

When you lose a system the best thing that can be done is to back up the Storage and Configuration files from that system. A good step would be to create a tar or zip file containing both the Storage and Configuration files. The location for these files on a Windows system are in these hidden locations:

\(***1**) C:\ProgramData\OSIsoft\EdgeDataStore\Configuration

\(***1**) C:\ProgramData\OSIsoft\EdgeDataStore\Storage

The ProgramData folder is typically hidden so if it is not in the view you will simply need to go to the view tab in your file explorer and check &quot;Hidden Items&quot;.

First, you will want to make sure your Edge Data Store service has stopped if your device is still able to boot. This can be done through the Service Manager or by using the Task Manager&#39;s services tab. Once the Storage and Configuration files are located create a zip file containing the Storage and Configuration directories and move it to a safe location (could be a usb, disk, another system, etc). File transfer can be done with WinSCP, SFTP, external devices, etc.

**_Step 2 – Moving to the new hardware_***

Once the new hardware has replaced the previous system and has been installed with Edge Data Store, the new system will have a default configuration. First, stop the Edge Data Store service using the Service Manager or Task Manager&#39;s service tab. Once that service has stopped, navigate to the C:\ProgramData\OSIsoft\EdgeDataStore directory and extract your zip or tar file in that directory again using WinSCP, sftp, etc.

**_Step 3 – Recovery_**

Now, the first step to restoring the data files after the service has stopped is to delete the default &#39;Configuration&#39; and &#39;Storage&#39; folders from the new devices directory and then copy or unzip the backups into the directory. Now, use the Service Manager or Task Manager to restart the Edge Data Store service. Once restarted the system should continue to run.

\***1 The C: drive may not be your systems default drive letter, refer to the My Computer, This PC, or simply open a command prompt to verify your systems drive letter**

# Linux Recovery

**_Step 1 – Creating a backup_**

First, you will need to have root access on the device to successfully restore on Linux systems.

When you lose a system the best thing that can be done is to back up the Storage and Configuration files from that system. A good step would be to create a tar or zip file containing both the Storage and Configuration files. The location for these files on a Linux system are:

/usr/share/OSIsoft/EdgeDataStore/Configuration

/usr/share/OSIsoft/EdgeDataStore /Storage

First, you will want to make sure your Edge Data Store service has stopped if your device is still able to boot. This can be done with this command:

_sudo systemctl stop osisoft.edgedatastore_

Word of caution, using the _cp_ command may result in a change in file ownership to the current user. Now, once the Storage and Configuration files are located create a zip or \(***1**) tar file containing the Storage and Configuration directories and move it to a safe location (could be a usb, disk, another system, etc). File transfer can be done with WinSCP, SFTP, external devices, etc.

**_Step 2 – Moving to the new hardware_**

Once the new hardware has replaced the previous system and has been installed with Edge Data Store, the new system will have a default configuration. First, stop the Edge Data Store: _sudo systemctl stop osisoft.edgedatastore_

Once that service has stopped, navigate to the /usr/share/OSIsoft/EdgeDataStore directory and place your zip or tar file in that directory again using WinSCP, sftp, etc.

**_Step 3 – Recovery_**

The first step to restoring the data files after the service has stopped is to delete the default &#39;Configuration&#39; and &#39;Storage&#39; folders from the /usr/share/OSIsoft/EdgeDataStore directory. The next step is to unzip the tar file to the EdgeDataStore directory and update the ownership of the 2 directories to _edgedatastore_ for the user and group if they do not match _edgedatastore_. Now, use the command _sudo systemctl start osisoft.edgedatastore_ to start the service. Once restarted the system should continue to run. You can check if Edge Data Store is running with this command.

_sudo systemctl status osisoft.edgedatastore_

It could be worth double check permissions, note that the directory permissions are by default set to 755 and each subsequent file is 644.

***1: If you do not use tar it is possible to have permission issues with the recovery files. Tar matches via string name rather than the account ID/UID, it also preserves permissions on files when zipping them.**

# Credentials

This guide does not include backing up and restoring of any credentials. All credentials are encrypted for security purposes so they cannot be copied or transferred. Once the new system has had the Configuration and Storage files copied over and the service has started, the credentials for the system will need to be re-entered using API calls. Once updated, restart the Edge Data Store service. Upon completion the edge device will be running just as the previous and will contain all the data up to the point the previous device went down.
