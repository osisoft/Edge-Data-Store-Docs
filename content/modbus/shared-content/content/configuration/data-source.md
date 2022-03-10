---
uid: ModbusTCPDataSourceConfiguration
---

# Data source configuration

For each instance of the Modbus TCP EDS adapter defined in system configuration, you must configure the data source from which it will poll data.

## Configure Modbus TCP data source

**Note:** Modbus TCP data source configurations cannot be modified manually. You must use the REST endpoints to add or edit the configuration.

To configure the Modbus TCP data source, follow these steps:

1. Using any text editor, create a file that contains a Modbus TCP data source in JSON form.

    - For content structure, see [Modbus TCP data source examples](#modbus-tcp-data-source-examples). 

1. Modify the parameters in the example to match your environment. For a table of all available parameters, see [Parameters for Modbus TCP data source](#parameters-for-modbus-tcp-data-source). 

1. Save the file to the device with EDS installed using a file name based on the adapter instance name. For example, to use the adapter instance created during installation, which is Modbus1, name the file `Modbus1Datasource.json`.

1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:<port_number>/api/v1/configuration/<EDS adapterId>/DataSource/`.

The following example shows the HTTPS request using curl, which must be run from the same directory where the file is located, and uses the adapter instance created during installation, which is Modbus1:

```bash
curl -d "@Modbus1DataSource.config.json" -H "Content-Type: application/json" "http://localhost:5590/api/v1/configuration/Modbus1/DataSource"
```

    **Notes:**
  
    * If you installed the adapter to listen on a non-default port, update `5590` to the port number in use.

    * If you use a component ID other than `Modbus1`, update the endpoint with your chosen component ID.
    
    * For a list of other REST operations you can perform, like updating or deleting a data source configuration, see [REST URLs](#rest-urls).
    <br/>
    <br/>

## Parameters for Modbus TCP data source

The following parameters are available for configuring a Modbus TCP data source.

| Parameter                |Required       | Type      | Description  |
|--------------------------|-----------|-----------|---------------------------------------------------|
| **Devices**               | Required          | Array of objects | List of Modbus devices that this adapter instance reads. All devices read by the adapter share the common configuration defined in this table. For the properties that a device is comprised of, see the [Devices](#devices) table.|
| **StreamIdPrefix**        | Optional          | `string` | Specifies what prefix is used for Stream IDs. The naming convention is `{StreamIdPrefix}{StreamId}`. An empty string means no prefix will be added to the Stream IDs and names. A `null` value defaults to ComponentID followed by a period. <br><br>Example: `Modbus1.{DeviceId}.{UnitId}.{RegisterType}.{RegisterOffset}`<br><br>**Note:** Every time you change the StreamIdPrefix of a configured adapter, for example when you delete and add a data source, you need to restart the adapter for the changes to take place. New streams are created on adapter restart and pre-existing streams are no longer updated.<br><br>Allowed value: any string<br>Default value: `null` |
| **DefaultStreamIdPattern** | Optional          | `string` | Specifies the default stream Id pattern to use.<br><br>Allowed value: any string<br>Default value:<br> `{DeviceId}.{UnitId}.{RegisterType}.{RegisterOffset}`. |
| **ConnectTimeout**        | Optional          | `string` | Parameter to specify the TimeSpan to wait when the adapter is trying to connect to the data source. * <br><br>Minimum value: `00:00:01`<br>Maximum value: `00:00:30` <br>Default value: `00:00:05` |
| **ReconnectInterval**     | Optional          | `string` | Parameter to specify the TimeSpan to wait before retrying to connect to the data source when the data source is offline. * <br><br>Minimum value: `00:00:00.1`<br>Maximum value: `00:00:30` <br>Default value: `00:00:01` |
|**RequestTimeout**         | Optional          | `string` | Parameter to specify the TimeSpan that the adapter waits for a pending request before marking it as timeout and dropping the request. * <br><br>Minimum value: must be positive <br> Maximum value: 48 hours or `02:00:00:00`<br>Default value: `00:00:10` |
|**DelayBetweenRequests**   | Optional          | `string` | Parameter to specify the minimum TimeSpan between two successive requests sent to the data source. * <br><br>Minimum value: `00:00:00`<br>Maximum value: `00:00:01` <br>Default value: `00:00:00` |
|**MaxResponseDataLength**  | Optional          | number | Parameter to limit the maximum length (in bytes) of data that can be read within one transaction. This feature is provided to support devices that limit the number of bytes that can be returned. If there is no device limitation, the request length should be the maximum length of `250` bytes. <br><br>Minimum value: `2`<br> Maximum value: `250`<br>Default value: `250` |
|**SimultaneousRequests**  | Optional          | number | Parameter to allow multiple simultaneous reads from a single IP address and port combination to prevent scan overruns when a lot of data is being read from a single device. <br><br>Minimum value: `1`<br>Maximum value: `16`<br>Default value: `1`|

\* **Note:** You can also specify timespans as numbers in seconds. For example, `"RequestTimeout": 25` specifies 25 seconds, or `"RequestTimeout": 125.5` specifies 2 minutes and 5.5 seconds.

### Devices

The following parameters are available for configuring the 'Devices' parameter of a Modbus TCP data source.

| Parameter                |Required       | Type      | Description  |
|--------------------------|-----------|-----------|---------------------------------------------------|
| **Id**             | Required  | `string` | The ID of the device that is used in data selection to associate a register with a device. |
| **IpAddress**         | Required  | `string` | The IP address of the device from which the data is collected using the Modbus TCP protocol. Host name is not supported. |
| **Port**                  | Optional  | number | The TCP port of the target device that listens for and responds to Modbus TCP requests. The value ranges from `0` to `65535`. If you do not configure it, the default TCP port is `502`, which is the default port for Modbus TCP protocol. |

## Modbus TCP data source examples

The following are examples of valid Modbus TCP data source configurations:

### Minimal data source configuration

```json
{
    "Devices":
    [
        {
            "Id": "Device1",
            "IpAddress": "127.0.0.1"
        }
    ]
}
```

### Complete data source configuration

```json
{
    "Devices":
    [
        {
            "Id": "Device1",
            "IpAddress": "127.0.0.1",
            "Port": 502
        },
        {
            "Id": "Device2",
            "IpAddress": "127.0.0.2",
            "Port": 502
        },
        {
            "Id": "Device3",
            "IpAddress": "127.0.0.3",
            "Port": 502
        }
    ],
    "StreamIdPrefix": "my.prefix",
    "DefaultStreamIdPattern": "{DeviceId}.{UnitId}.{RegisterType}.{RegisterOffset}",
    "ConnectTimeout": "00:00:05",
    "ReconnectInterval": "00:00:01",
    "RequestTimeout": "00:00:10",
    "DelayBetweenRequests": "00:00:00.5",
    "MaxResponseDataLength": 125,
    "SimultaneousRequests": 1
}
```

## REST URLs

| Relative URL | HTTP verb | Action |
| ------------ | --------- | ------ |
| api/v1/configuration/\<ComponentId\>/DataSource | `GET` | Retrieves the data source configuration. |
| api/v1/configuration/\<ComponentId\>/DataSource | `POST` | Creates the data source configuration. The adapter starts collecting data after the following conditions are met:<br/><br/>&bull; The data source configuration `POST` request is received.<br/>&bull; A data selection configuration is active. |
| api/v1/configuration/\<ComponentId\>/DataSource | `PUT` | Configures or updates the data source configuration. Overwrites any active data source configuration. If no configuration is active, the adapter starts collecting data after the following conditions are met:<br/><br/>&bull; The data source configuration `PUT` request is received.<br/>&bull; A data selection configuration is active. |
| api/v1/configuration/\<ComponentId\>/DataSource | `DELETE` | Deletes the data source configuration. After the request is received, the adapter stops collecting data. |

**Note:** Replace \<ComponentId\> with the Id of your Modbus TCP component. For example, _Modbus1_.
