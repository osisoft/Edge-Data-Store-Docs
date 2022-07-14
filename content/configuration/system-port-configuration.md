---
uid: SystemPortConfiguration
---

# System port configuration

The _appsettings.json_ file specifies the port on which Edge Data Store is listening for REST API calls. The same port is used for configuration and for writing data to OMF and SDS. The default port is 5590. Valid ports are in the range of 1024-65535. During installation a prompt will be presented where a non-default port can be specified.

## Reconfigure system port

Before changing the port, ensure that no other service or application on the device running EDS is using that port because only one application or service can use a port. After reconfiguring the port, EDS must be restarted for the changes to take effect.

To reconfiure the port follow the steps below:

1. Open the _appsettings.json_ file in a text editor. This file can be found in `C:\Program Files\OSIsoft\EdgeDataStore\` or the location specified during installation. On Linux, this file can be found in `/opt/OSIsoft/EdgeDataStore/`
2. Change the port value to a valid value and save the file.
3. Restart the Edge Data Store service.

Sample _appsettings.json_ file
```json
{
  "ApplicationSettings": {
    "Port": 5590,
    "ApplicationDataDirectory": "EdgeDataStore"
  }
}
```