---
uid: SystemPortConfiguration
---

# System port configuration

The `appsettings.json` file specifies the port on which Edge Data Store is listening for REST API calls. The same port is used for configuration and for writing data to OMF and SDS. The default port is `5590`. Valid ports are in the range of 1024-65535. During installation a prompt will be presented where a non-default port can be specified.

## Reconfigure system port

Before changing the port, ensure that no other service or application on the device running EDS is using that port because only one application or service can use a port. After reconfiguring the port, EDS must be restarted for the changes to take effect.

To reconfigure the port:

1. Open the `appsettings.json` file in a text editor. 
  
  This file is located in `C:\Program Files\OSIsoft\EdgeDataStore\` on Windows, in `/opt/OSIsoft/EdgeDataStore/` on Linux, or the location specified during installation.

1. Change the port value to a valid value between `1024` and `65535` and save the file.

1. Restart the Edge Data Store service.

## Sample JSON file

```json
{
  "ApplicationSettings": {
    "Port": 5590,
    "ApplicationDataDirectory": "EdgeDataStore"
  }
}
```
