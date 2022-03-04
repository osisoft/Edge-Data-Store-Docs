---
uid: SystemPortConfiguration
---

# System port configuration

The _System_Port.json_ file specifies the port on which Edge Data Store is listening for REST API calls. The same port is used for configuration and for writing data to OMF and SDS. The default port is 5590. Valid ports are in the range of 1024-65535. 

## Configure system port

Before changing the port, ensure that no other service or application on the device running EDS is using that port because only one application or service can use a port. If you change the port number through the REST API, you must restart EDS.

To configure the system port, follow these steps:

1. Using any text editor, create a JSON file based on the following example and enter the new port number:

   ```json
   {
     "Port": 5590
   }
   ```

1. Save the JSON file with the name _EdgePort.json_ 

1. Run the following script:

    ```bash
    curl -d "@EdgePort.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/system/port
    ```

    **Note:** The port number in the script must be the current port number, not the new port number in the file.

1. After the REST command completes, restart EDS for the change to take effect.

## Parameters for system port

The following parameters is used to specify the system port.

| Parameter      | Required    | Type   | Nullable | Description                      |
| ------------- | --------- | -------- | -------- | ------------------------------- |
| **Port** | Required | `integer` | No       | The TCP port to bind EDS to. (Range [1024,65535]) Example: 5590 | 
