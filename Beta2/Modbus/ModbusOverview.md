---
uid: modbusOverview
---

# Modbus Connectivity

## Overview

The Modbus TCP Connectivity transfers time-series data from Modbus TCP slave devices into the Edge System.

The Modbus TCP connectivity models the register measurements in a Modbus data source by polling data from the Modbus devices, based on the measurement configuration provided.

Modbus is a commonly available communication protocol used for connecting and transmitting information between industrial electronic devices. The Modbus TCP connectivity communicates with any device conforming to the Modbus TCP/IP protocol through a gateway or router. The Modbus slave devices and routers do not need to be on the same subnet as Edge System.

## Configuration of Modbus Data Source

To utilize the Modbus TCP connectivity component of the Edge System, it must be configured to which Modbus data source it will be polling data from.

### Procedure for Configuring Modbus Data Source

> **Note:** You cannot modify Modbus data source configurations manually. You must use the REST endpoints to add/edit the configuration. See [REST Urls](#rest-urls).

The following procedure is for configuring Modbus data source.

1. Using any text editor, create a file that contains a Modbus data source in JSON form
    - See Modbus Data Source Example section below for content structure
    - See Parameters for Modbus Data Source section below for a table of all available parameters
1. Save the file as DataSource.config.json.
1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<connectivityId>/DataSource/`
    - Example using cURL:

        ```bash
        curl -v -d "@DataSource.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/<connectivityId>/DataSource"
        ```

### Parameters for Modbus Data Source

The following parameters are available for configuring a Modbus data source.

| Parameter                |Required       | Type      | Description  |
|--------------------------|-----------|-----------|---------------------------------------------------|
| **IpAddress**           | Required  | string    | The IP Address of the device from which the data is to be collected using the Modbus protocol. Host name is not supported. |
| **Port**                | Required  | number | The TCP port of the target device that listens for and responds to Modbus requests. The value ranges from 0 to 65535. The default TCP port for Modbus protocol is 502. |
| **StreamIdPrefix**      | Optional          | number | Parameter applied to all data items collected from the data source. If not configured, the default value will be the component ID Modbus1. The custom StreamIdPrefix has the highest priority.|
| **ConnectTimeout**      | Optional          | number  | Parameter to specify the time (in milliseconds) to wait when Modbus TCP connectivity is trying to connect to the data source. The value ranges from 1000 ms to 30000 ms. The default value is 5000 ms.|
| **ReconnectInterval**   | Optional          | number  | Parameter to specify the time (in milliseconds) to wait before retrying to connect to the data source when the data source is offline. The value ranges from 100 ms to 30000 ms. The default value is 1000 ms. |
|**RequestTimeout**       | Optional          | number  |Parameter to specify the time (in milliseconds) that Modbus TCP connectivity waits for a pending request before marking it as timeout and dropping the request. The default value is 10000 ms. The value must be a positive integer, there is no value range.|
|**DelayBetweenRequests** | Optional          |number|Parameter to specify the minimum time (in milliseconds) between two successive requests sent to the data source. The value ranges from 0 ms to 1000 ms. The default value is 0 ms.|
|**MaxResponseDataLength**| Optional          |number    |Parameter to limit the maximum length (in bytes) of data that can be read within one transaction. This feature is provided to support devices that limit the number of bytes that can be returned. If there is no device limitation, the request length should be the maximum length of 250 bytes. The value ranges from 2 to 250. The default value is 250 ms.|

### Modbus Data Source Example

Below is an example of valid Modbus Data Source configuration.

```json
{
    "IpAddress": "117.23.45.110",
    "Port" : 502,
    "ConnectTimeout" : 10000,
}
```

## Configuration of Modbus Data Selection

Once a data source is configured for a Modbus instance, which data is to be collected from the Modbus slave device must be configured.

### Procedure for Configuring Modbus Data Selection

> **Note:** You cannot modify Modbus data selection configurations manually. You must use the REST endpoints to add/edit the configuration. See [REST Urls](#rest-urls).

The following procedure is for configuring Modbus data selection.

1. Using any text editor, create a file that contains a Modbus data selection in JSON form
    - See Modbus Data Selection Example section below for content structure
    - See Parameters for Modbus Data Selection section below for a table of all available parameters
1. Save the file as DataSelection.config.json.
1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<connectivityId>/DataSelection/`
    - Example using cURL:

        ```bash
        curl -v -d "@DataSelection.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/<connectivityId>/DataSelection"
        ```

### Parameters for Modbus Data Selection

The following parameters are available for configuring a Modbus data selection.

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| **Selected** | Optional | bool | This field is used to select or clear a measurement. To select an item, set to true. To remove an item, leave the field empty or set to false. |
| **Name** | Optional | string | The optional friendly name of the data item collected from the data source. If not configured, the default value will be the stream ID. |
| **UnitId** | Required | number | Modbus slave device unit ID. This must be a value between 0 and 247, inclusively. |
| **RegisterType** | Required | number | Modbus register type. Supported types are Coil, Discrete, Input16, Input32, Holding16 and Holding32.<br><br>Input16 and Holding16 are used to read registers that have a size of 16 bits. For registers that have a size of 32 bits, use the Input32 and Holding32 register types. To represent the types, you can type in the register type ID or the exact name: <br><br>1 or Coil (Read Coil Status)<br>2 or Discrete (Read Discrete Input Status)<br>3 or Holding16 (Read 16-bit Holding Registers)<br>4 or Holding32 (Read 32-bit Holding Registers)<br>6 or Input16 (Read 16-bit Input Registers)<br>7 or Input32 (Read 32-bit Input Registers) |
| **RegisterOffset** | Required | number | The 0 relative offset to the starting register for this measurement. For example, if your Holding registers start at base register 40001, the offset to this register is 0. For 40002, the offset to this register is 1.|
| **DataTypeCode** | Required | number | An integer representing the data type that Modbus TCP connectivity will read starting at the register specified by the offset. Supported data types are:<br>1 = Boolean<br>10 = Int16<br>20 = UInt16<br>30 = Int32<br>31 = Int32ByteSwap<br>100 = Float32<br>101 = Float32ByteSwap<br>110 = Float64<br>111 = Float64ByteSwap<br>1001 - 1250 = String <br>2001 - 2250 = StringByteSwap |
| **ScanRate** | Required | number | How often this measurement should be read from the device in milliseconds. Acceptable values are from 0 to 86400000. If 0 ms is specified, Modbus TCP connectivity will scan for data as fast as possible.|
| **BitMap** | Required | number | The bitmap is used to extract and reorder bits from a word register. The format of the bitmap is uuvvwwxxyyzz, where uu, vv, ww, yy, and zz each refer to a single bit. A leading zero is required if the referenced bit is less than 10. The low-order bit is 01 and high-order bit is either 16 or 32. Up to 16 bits can be referenced for a 16-bit word (data types 10 and 20) and up to 32 bits can be reference for a 32-bit word (data type 30 and 31). The bitmap 0307120802 will map the second bit of the original word to the first bit of the new word, the eighth bit to the second bit, the twelfth bit to the third bit, and so on. The high-order bits of the new word are padded with zeros if they are not specified. |
| **ConversionFactor** | Required | number | This numerical value can be used to scale the raw response received from the Modbus TCP device. If this is specified, regardless of the specified data type, the value will be promoted to a float32 (single) when stored. [Result = (Value / Conversion Factor)] |
| **ConversionOffset** | Required | number | This numerical value can be used to apply an offset to the response received from the Modbus TCP device. [Result = (Value - Conversion Offset)] |
| **StreamID** | Required | string | The custom stream ID that will be used to create the streams. If not specified, the Modbus TCP connectivity will generate a default stream ID based on the measurement configuration. A properly configured custom stream ID follows these rules:<br><br>Is not case-sensitive.<br>Can contain spaces.<br>Cannot start with two underscores ("__").<br>Can contain a maximum of 260 characters.<br>Cannot use the following characters: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % < > &#124;<br>Cannot start or end with a period.<br>Cannot contain consecutive periods.<br>Cannot consist of only periods.

Each JSON object in the file represents a measurement. You can modify the fields in each object to configure the measurement parameters. To add more measurements, you need to create more JSON objects with properly completed fields.

### Data Selection Examples

Below is an example of valid Modbus Data Source configuration.

**Modbus Data Selection example.**

```json
[
  {
    "Selected": true,
    "Name": "Measurement1",
    "UnitId": 0,
    "RegisterType": 1,
    "RegisterOffset": 0,
    "DataTypeCode": 1,
    "BitMap": "",
    "ConversionFactor": null,
    "ConversionOffset": null,
    "StreamId": "SampleStreamID1",
    "ScanRate": 0
  },
  {
    "Selected": true,
    "Name": "Measurement2",
    "UnitId": 247,
    "RegisterType": 2,
    "RegisterOffset": 65535,
    "DataTypeCode": 10,
    "BitMap": "",
    "ConversionFactor": 1,
    "ConversionOffset": 0,
    "StreamId": "",
    "ScanRate": 86400000
  },
  {
    "Selected": true,
    "Name": "Measurement3",
    "UnitId": 1,
    "RegisterType": 3,
    "RegisterOffset": 1,
    "DataTypeCode": 20,
    "BitMap": "16151413",
    "ConversionFactor": 2,
    "ConversionOffset": 3.4,
    "StreamId": "Sample Stream ID 2",
    "ScanRate": 1000
  },
  {
    "Selected": true,
    "Name": "Measurement4",
    "UnitId": 1,
    "RegisterType": 4,
    "RegisterOffset": 1,
    "DataTypeCode": 30,
    "BitMap": "30293231",
    "ConversionFactor": 1,
    "ConversionOffset": 2,
    "StreamId": "Sample_Stream_ID_3",
    "ScanRate": 1000
  }
]
```
