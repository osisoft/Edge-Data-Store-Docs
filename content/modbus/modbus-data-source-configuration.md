---
uid: ModbusTCPDataSourceConfiguration
---

# Data source configuration

For each instance of the Modbus TCP EDS adapter defined in system configuration, you must configure the data source from which it polls data.

## Configure Modbus TCP data source

Modbus TCP data source configurations cannot be modified manually. You must use the REST endpoints to add or edit the configuration.

To configure the Modbus TCP data source, follow these steps:

1. Using any text editor, create a file that contains a Modbus TCP data source in JSON form. 

    - For content structure, see [Modbus TCP data source examples](#modbus-tcp-data-source-examples).

1. Modify the parameters in the example to match your environment. For a table of all available parameters, see [Parameters for Modbus TCP data source](#parameters-for-modbus-tcp-data-source). 

1. Save the file to the device with EDS installed using a file name based on the adapter instance name. For example, to use the adapter instance created during installation, which is `Modbus1`, name the file `Modbus1Datasource.json`.

1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:<port_number>/api/v1/configuration/<EDS adapterId>/DataSource/`.

The following example shows the HTTPS request using curl, which must be run from the same directory where the file is located, and uses the adapter instance created during installation, which is `Modbus1`:

```bash
curl -d "@Modbus1DataSource.config.json" -H "Content-Type: application/json" "http://localhost:5590/api/v1/configuration/Modbus1/DataSource"
```

## Parameters for Modbus TCP data source

The following parameters are available for configuring a Modbus TCP data source.

| Parameter                |Required       | Type      | Nullable | Description  |
|--------------------------|-----------|-----------|------------|---------------------------------------------------|
| **IpAddress**             | Required  | `string` | Yes | The IP address of the device from which the data is to be collected using the Modbus TCP protocol. Host name is not supported. |
| **Port**                  | Optional  | number | No | The TCP port of the target device that listens for and responds to Modbus TCP requests. The value ranges from 0 to 65535. If not configured, the default TCP port is 502 (which is the default port for Modbus TCP protocol). |
| **StreamIdPrefix**        | Optional          | number | Yes | Parameter applied to all data items collected from the data source. If not configured, the default value is the ID of the Modbus TCP EDS adapter. The custom StreamIdPrefix has the highest priority.|
| **ApplyPrefixToStreamId** | Optional          | `Boolean` | No | Parameter applied to all data items collected from the data source that have custom stream ID configured. If configured, the adapter will apply the StreamIdPrefix property to all the streams with custom ID configured. The property does not affect any streams with default ID configured|
| **ConnectTimeout**        | Optional          | number | No | Parameter to specify the time (in milliseconds) to wait when Modbus TCP EDS adapter is trying to connect to the data source. The value ranges from 1000 ms to 30000 ms. The default value is 5000 ms.|
| **ReconnectInterval**     | Optional          | number | No | Parameter to specify the time (in milliseconds) to wait before retrying to connect to the data source when the data source is offline. The value ranges from 100 ms to 30000 ms. The default value is 1000 ms. |
|**RequestTimeout**         | Optional          | number | No | Parameter to specify the time (in milliseconds) that Modbus TCP EDS adapter waits for a pending request before marking it as timeout and dropping the request. The default value is 10000 ms. The value must be a positive integer, there is no value range.|
|**DelayBetweenRequests**   | Optional          | number | No | Parameter to specify the minimum time (in milliseconds) between two successive requests sent to the data source. The value ranges from 0 ms to 1000 ms. The default value is 0 ms.|
|**MaxResponseDataLength**  | Optional          | number | No | Parameter to limit the maximum length (in bytes) of data that can be read within one transaction. This feature is provided to support devices that limit the number of bytes that can be returned. If there is no device limitation, the request length should be the maximum length of 250 bytes. The value ranges from 2 to 250. The default value is 250 ms.|

## Modbus TCP data source examples

The following are examples of valid Modbus TCP data source configurations.

**Minimal data source configuration:**

```json
{
    "IpAddress": "127.0.0.2" 
}
```

**Complete data source configuration:**

```json
{
    "IpAddress": "127.0.0.4",
    "Port": 502,
    "StreamIdPrefix": "my.prefix",
    "ApplyPrefixToStreamId": true,
    "ConnectTimeout": 5000,
    "ReconnectInterval": 1000,
    "RequestTimeout": 10000,
    "DelayBetweenRequests": 500,
    "MaxResponseDataLength": 125
}
```
