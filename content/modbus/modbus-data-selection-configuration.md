---
uid: ModbusTCPDataSelectionConfiguration
---

# Data selection configuration

Once a data source is configured for a Modbus TCP instance, create a data selection configuration file to specify the data for the Modbus TCP EDS adapter instance to collect from the data source.

## Configure Modbus TCP data selection

To configure Modbus TCP data selection:

1. Using any text editor, create a file that contains a Modbus TCP data selection in JSON form.

    - For content structure, see [Modbus TCP data selection examples](#modbus-tcp-data-selection-examples).

1. Update the parameters as needed. For a table of all available parameters, see [Parameters for Modbus TCP data selection](#parameters-for-modbus-tcp-data-selection).

1. Save the file to the device with EDS installed with the name `DataSelection.config.json`.

1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:<port_number>/api/v1/configuration/<EDS adapterId>/DataSelection/`.

The following example shows the HTTPS request using curl, which must be run from the same directory where the file is located, and uses the adapter instance created during installation, which is Modbus1:

```bash
curl -d "@DataSelection.config.json" -H "Content-Type: application/json" "http://localhost:5590/api/v1/configuration/Modbus1/DataSelection"
```

To see the streams that have been created in EDS storage for the data specified in the configuration, run the following curl script:

```bash
curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/
```

## Parameters for Modbus TCP data selection

The following parameters are available for configuring Modbus TCP data selection.

| Parameter | Required | Type | Nullable | Description |
|-----------|----------|------|----------|-------------|
| **DeviceId** | Required | `string` | No | Specifies the DataSource device that this data selection item is read from. The value must match one of the `<Id>` values specified in the DataSource Devices configuration.
| **Selected** | Optional | `Boolean` | No | Used to select or clear a measurement. To select an item, set to true. To remove an item, leave the field empty or set to false.  If not configured, the default value is true.|
| **Name** | Optional | `string` | Yes | The optional friendly name of the data item collected from the data source. If not configured, the default value will be the stream ID. |
| **UnitId** | Required | number | No | Modbus TCP slave device unit ID. This must be a value between 0 and 247, inclusively. |
| **RegisterType** | Required | number or `string` | No | Modbus TCP register type. Supported types are Coil, Discrete, Input16, Input32, Holding16 and Holding32.<br><br>Input16 and Holding16 are used to read registers that have a size of 16 bits. For registers that have a size of 32 bits, use the Input32 and Holding32 register types. To represent the types, type the register type ID or the exact name: <br><br>1 or Coil (Read Coil Status)<br>2 or Discrete (Read Discrete Input Status)<br>3 or Holding16 (Read 16-bit Holding Registers)<br>4 or Holding32 (Read 32-bit Holding Registers)<br>6 or Input16 (Read 16-bit Input Registers)<br>7 or Input32 (Read 32-bit Input Registers) |
| **RegisterOffset** | Required | number | No | The 0 relative offset to the starting register for this measurement. For example, if the Holding registers start at base register 40001, the offset to this register is 0. For 40002, the offset to this register is 1.|
| **DataTypeCode** | Required | number | No | Represents the data type that Modbus TCP EDS adapter will read starting at the register specified by the offset. Supported data types are:<br>1 = Boolean<br>10 = Int16<br>20 = UInt16<br>30 = Int32<br>31 = Int32ByteSwap<br>100 = Float32<br>101 = Float32ByteSwap<br>110 = Float64<br>111 = Float64ByteSwap<br>1001 - 1250 = String <br>2001 - 2250 = StringByteSwap |
| **ScanRate** | Required | number | No | Defines how often this measurement is read from the device in milliseconds. Acceptable values are from 0 to 86400000. If 0 ms is specified, Modbus TCP EDS adapter will scan for data as fast as possible.|
| **BitMap** | Optional | `string` | Yes | Bitmap used to extract and reorder bits from a word register. The format of the bitmap is uuvvwwxxyyzz, where uu, vv, ww, yy, and zz each refer to a single bit. A leading zero is required if the referenced bit is less than 10. The low-order bit is 01 and high-order bit is either 16 or 32. Up to 16 bits can be referenced for a 16-bit word (data types 10 and 20) and up to 32 bits can be referenced for a 32-bit word (data type 30 and 31). The bitmap 0307120802 will map the second bit of the original word to the first bit of the new word, the eighth bit to the second bit, the twelfth bit to the third bit, and so on. The high-order bits of the new word are padded with zeros if they are not specified. |
| **ConversionFactor** | Optional | number | Yes | Used to scale the raw response received from the Modbus TCP device. If this is specified, regardless of the specified data type, the value will be promoted to a float32 (single) when stored. [Result = (Value / Conversion Factor)] |
| **ConversionOffset** | Optional | number | Yes | Used to apply an offset to the response received from the Modbus TCP device. If this is specified, regardless of the specified data type, the value will be promoted to a float32 (single) when stored.  [Result = (Value - Conversion Offset)] |
| **StreamID** | Optional | `string` | Yes | The custom stream ID that will be used to create the streams. If not specified, the Modbus TCP EDS adapter will generate a default stream ID based on the measurement configuration. A properly configured custom stream ID follows these rules:<br><br>Is not case-sensitive.<br>Can contain spaces.<br>Cannot start with two underscores ("__").<br>Can contain a maximum of 100 characters.<br>Cannot use the following characters: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % < > &#124;<br>Cannot start or end with a period.<br>Cannot contain consecutive periods.<br>Cannot consist of only periods.

Each JSON object in the file represents a measurement. Add additional JSON objects in the file for each measurement to collect. Modify the fields in each object to configure the measurement parameters.

## Modbus TCP data selection examples

The following are examples of valid Modbus TCP data selection configurations.

**Minimum data selection configuration:**

```json
[
    {
        "DeviceId": "Device1",
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 122,
        "DataTypeCode": 20,
        "ScanRate": 1000
    }
]
```

**Maximum data selection configuration:**

```json
[
    {
        "DeviceId": "Device1",
        "Selected": true,
        "Name": "MyDataItem",
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 123,
        "DataTypeCode": 20,
        "ScanRate": 300,
        "StreamId": "stream.1",
        "BitMap": "020301",
        "ConversionFactor": 12.3,
        "ConversionOffset": 14.5
    }
]
