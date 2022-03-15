---
uid: DataSelectionConfiguration
---

# Data selection configuration

Once a data source is configured for a Modbus TCP instance, create a data selection configuration file to specify the data for the Modbus TCP EDS adapter instance to collect from the data source.

## Configure Modbus TCP data selection

To configure Modbus TCP data selection, follow these steps:

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

The following parameters are available to configure a Modbus TCP data selection:

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| **DeviceId** | Required | `string` | Specifies the DataSource device that this data selection item is read from. The value must match one of the `<Id>` values specified in the DataSource [Devices](xref:ModbusTCPDataSourceConfiguration#devices) configuration.
| **Selected** | Optional | `boolean` | Selects or clears a measurement. To select an item, set to `true`. To remove an item, leave the field empty or set to `false`.  <br><br>Allowed value: `true` or `false`<br>Default value: `true`|
| **Name** | Optional | `string` | The optional friendly name of the data item collected from the data source. <br><br>Default value: stream ID |
| **UnitId** | Required | number | Modbus TCP slave device unit ID. <br><br>Minimum value: `0`<br> Maximum value: `247` |
| **RegisterType** | Required | number or `string` | Modbus TCP register type. Supported types are `Coil`, `Discrete`, `Input16`, `Input32`, `Holding16` and `Holding32`.<br><br>`Input16` and `Holding16` are used to read registers that have a size of 16 bits. For registers that have a size of 32 bits, use the `Input32` and `Holding32` register types. To represent the types, you can type in the register type ID or the exact name: <br><br>Allowed values:<br>`1` or `Coil` (Read Coil Status)<br>`2` or `Discrete` (Read Discrete Input Status)<br>`3` or `Holding16` (Read 16-bit Holding Registers)<br>`4` or `Holding32` (Read 32-bit Holding Registers)<br>`6` or `Input16` (Read 16-bit Input Registers)<br>`7` or `Input32` (Read 32-bit Input Registers)<br><br>For more information, see [Register types](#register-types).|
| **RegisterOffset** | Required | number | The 0 relative offset to the starting register for this measurement. For example, if your Holding registers start at base register 40001, the offset to this register is 0. For 40002, the offset to this register is 1.|
| **DataTypeCode** | Required | number | An integer representing the data type that the adapter will read starting at the register specified by the offset. <br><br> Supported data types:<br>`1` = `Boolean`<br>`10` = `Int16`<br>`20` = `UInt16`<br>`30` = `Int32`<br>`31` = `Int32ByteSwap`<br>`100` = `Float32`<br>`101` = `Float32ByteSwap`<br>`110` = `Float64`<br>`111` = `Float64ByteSwap`<br>`1001` - `1250` = `String` <br>`2001` - `2250` = `StringByteSwap` |
| **ScheduleId** | Required | `string` | The ID of an existing schedule for reading values.|
| **BitMap** | Optional | `string` | The bitmap is used to extract and reorder bits from a word register. The format of the bitmap is uuvvwwxxyyzz, where uu, vv, ww, yy, and zz each refer to a single bit. A leading zero is required if the referenced bit is less than 10. The low-order bit is 01 and high-order bit is either 16 or 32. Up to 16 bits can be referenced for a 16-bit word (data types 10 and 20) and up to 32 bits can be referenced for a 32-bit word (data type 30 and 31). The bitmap 0307120802 maps the second bit of the original word to the first bit of the new word, the eighth bit to the second bit, the twelfth bit to the third bit, and so on. The high-order bits of the new word are padded with zeros if they are not specified. |
| **ConversionFactor** | Optional | number | Use this numerical value to scale the raw response received from the Modbus TCP device. If you specify ConversionFactor, regardless of the specified data type, the value is promoted to a float32 (single) when stored. [Result = (Value / Conversion Factor)] |
| **ConversionOffset** | Optional | number | Use this numerical value to apply an offset to the response received from the Modbus TCP device. If you specify ConversionOffset, regardless of the specified data type, the value is promoted to a float32 (single) when stored.  [Result = (Value - Conversion Offset)] |
| **DataFilterId** | Optional | `string` | The ID of the data filter. <br><br>Allowed value: any string <br>Default value: `null`<br>**Note:** If the specified **DataFilterId** does not exist, unfiltered data is sent until that **DataFilterId** is created. |
| **StreamID** | Optional | `string` | The custom stream ID that is used to create the streams. If you do not specify the StreamID, the adapter generates a default stream ID based on the measurement configuration. A properly configured custom stream ID follows these rules:<br><br>Is not case-sensitive.<br>Can contain spaces.<br>Cannot start with two underscores ("__").<br>Can contain a maximum of 100 characters.<br>Cannot use the following characters:<br> `/` `:` `?` `#` `[` `]` `@` `!` `$` `&` `'` `(` `)` `\` `*` `+` `,` `;` `=` `%` `<` `>` or the vertical bar<br>Cannot start or end with a period.<br>Cannot contain consecutive periods.<br>Cannot consist of only periods.<br><br>The default ID automatically updates when there are changes to the measurement and follows the format of `<DeviceId>`.`<UnitId>`.`<RegisterType>`.`<RegisterOffset>`. |

Each JSON object in the file represents a measurement. You can modify the fields in each object to configure the measurement parameters. To add more measurements, you need to create more JSON objects with properly completed fields.

### Register types

Register types are used to configure measurements in Modbus TCP data selection. The adapter supports six register types, corresponding to four function codes (1-4). Since one function code can return two types of registers, 16-bit or 32-bit depending on the device, either the register type or the register type code is required when configuring the data selection for the adapter.

The following table lists all the register types supported in the adapter.

| Register Type | Register Type Code | Description | Function Code |
|---------------|-------------------|-------------|---------------|
| `Coil`        | `1`               |Read `Coil` Status| `1` |
| `Discrete`        | `2`               |Read `Discrete` Input Status | `2` |
| `Holding16`        | `3`               |Read 16-bit Holding Registers | `3` |
| `Holding32`        | `4`               |Read 32-bit Holding Registers | `3` |
| `Input16`        | `6`               |Read 16-bit Input Registers |`4`|
| `Input32`        | `7`               |Read 32-bit Input Registers |`4`|

When reading from function codes `1` and `2`, the adapter expects these to be returned as single bits. For function codes `3` and `4`, the adapter expects 16 bits to be returned from devices that contain 16-bit registers and 32 bits to be returned from devices that contain 32-bit registers.

### DataTypeCode

The following tables list all the DataTypeCodes supported in the adapter.

#### DataTypeCode 1

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| BoolModbus    | `Bool`       | `Coil Discrete` | 0=Modbus0 / 1=Modbus1| `bool`        | NA                      |

#### DataTypeCode 10

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| Int16    | `Int16`      | `Bool`/`16-bit` |Read 1 Modbus register<sup>1</sup> and interpret as a 16-bit integer. Bytes [BA] read from the PLC are stored as [AB]. <sup>2</sup> | `Int16` | 1|

#### DataTypeCode 20

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| UInt16    | `UInt16`      | `Bool`/`16-bit` |Read 1 Modbus register<sup>1</sup> and interpret as an unsigned 16-bit integer. Bytes [BA] read from the PLC are stored as [AB]. <sup>2</sup> | `Int32` | 11|

#### DataTypeCode 30

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| Int32    | `Int32`      | `16-`/`32-bit` |Read 32-bits from the PLC and interpret as a 32-bit integer.  Bytes [DCBA] read from the PLC are stored as [ABCD]. <sup>2</sup>| `Int32` | 7|

#### DataTypeCode 31

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| Int32ByteSwap    | `Int32`      | `16-`/`32-bit` |Read 32-bits from the PLC and interpret as a 32-bit integer.  Bytes [BADC] read from the PLC are stored as [ABCD]. <sup>2</sup> | `Int32` | 7|

#### DataTypeCode 100

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| Float32    | `Float32`      | `16-`/`32-bit` |Read 32-bits from the PLC and interpret as a 32-bit float.  Bytes [DCBA] read from the PLC are stored as [ABCD]. <sup>2</sup>| `Float32` | 6|

#### DataTypeCode 101

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| Float32ByteSwap    | `Float32`      | `16-`/`32-bit` |Read 32-bits from the PLC and interpret as a 32-bit float.  Bytes [BADC] read from the PLC are stored as [ABCD]. <sup>2</sup>| `Float32` | 6|

#### DataTypeCode 110

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| Float64    | `Float64`      | `16-`/`32-bit` |Read 64-bits from the PLC and interpret as a 64-bit float.  Bytes [HGFEDCBA] read from the device are stored as [ABCDEFGH]. <sup>2</sup>| `Float64` | 6 |

#### DataTypeCode 111

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| Float64ByteSwap    | `Float64`      | `16-`/`32-bit`|Read 64-bits from the PLC and interpret as a 64-bit float. Bytes [BADCFEHG] read from the device are stored as [ABCDEFGH]. <sup>2</sup>| `Float64` | 6|

#### DataTypeCode 1001-1250

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| String    | `String`      | `16-`/`32-bit` | 1001 will a 1-character string, 1002 will read a 2-character string, 1003 will read a 3-character string and so on. Bytes [AB] are interpreted as "AB". | `String` | 101 to 199|

#### DataTypeCode 2001-2250

| Name          | Value Type | Register Type | Meaning | Output Type | Interface data type code |
|---------------|------------|---------------|---------|-------------|--------------------------|
| StringByteSwap    | `String`      | `16-`/`32-bit` | 2001 will a 1-character string, 2002 will read a 2-character string, 2003 will read a 3-character string and so on. Bytes [BA] are interpreted as "AB". | `String` | 101 to 199|

<sup>1</sup> For more information about Modbus TCP registers, see [How is data stored in Standard Modbus? (https://www.se.com/us/en/faqs/FA168406/)](https://www.se.com/us/en/faqs/FA168406/)

<sup>2</sup> Bytes are read in reverse order.

## Modbus TCP data selection examples

The following are examples of valid Modbus TCP data selection configurations.

### Minimal data selection configuration

```json
[
    {
        "DeviceId" : "Device1",
        "Selected" : true,
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 0,
        "DataTypeCode": 10,
        "ScheduleId": "Schedule1"
    },
    {
        "DeviceId" : "Device2",
        "Selected" : true,
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 1,
        "DataTypeCode": 10,
        "ScheduleId": "Schedule2"
    }
]
```

### Complete data selection configuration

```json
[
    {
        "DeviceId" : "Device1",
        "Selected": true,
        "Name": "MyDataItem1",
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 0,
        "DataTypeCode": 10,
        "ScheduleId": "Schedule1",
        "StreamId": "stream.1",
        "BitMap": "020301",
        "ConversionFactor": 12.3,
        "ConversionOffset": 14.5,
        "DataFilterId" : "DataFilter1"
    },
    {
        "DeviceId" : "Device1",
        "Selected": true,
        "Name": "MyDataItem2",
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 1,
        "DataTypeCode": 10,
        "ScheduleId": "Schedule2",
        "StreamId": "stream.2",
        "BitMap": "020301",
        "ConversionFactor": 12.3,
        "ConversionOffset": 14.5,
        "DataFilterId" : "DataFilter2"
    }
]
```

## REST URLs

| Relative URL | HTTP verb | Action |
| ------------ | --------- | ------ |
| api/v1/configuration/\<ComponentId\>/DataSelection  | `GET` | Retrieves the data selection configuration, including all data selection items. |
| api/v1/configuration/\<ComponentId\>/DataSelection  | `PUT` | Configures or updates the data selection configuration. The adapter starts collecting data for each data selection item when the following conditions are met:<br/><br/>&bull; The data selection configuration `PUT` request is received.<br/>&bull; A data source configuration is active. |
| api/v1/configuration/\<ComponentId\>/DataSelection | `DELETE` | Deletes the active data selection configuration. The adapter stops collecting data. |
| api/v1/configuration/\<ComponentId\>/DataSelection | `PATCH` | Allows partial updates of configured data selection items.<br/><br/>**Note:** The request must be an array containing one or more data selection items. Each item in the array must include its **StreamId**. |
| api/v1/configuration/\<ComponentId\>/DataSelection/\<StreamId\> | `PUT` | Updates or creates a new data selection item by **StreamId**. For new items, the adapter starts collecting data after the request is received. |
| api/v1/configuration/\<ComponentId\>/DataSelection/\<StreamId\> | `DELETE` | Deletes a data selection item from the configuration by **StreamId**. The adapter stops collecting data for the deleted item. |

**Note:** Replace \<ComponentId\> with the Id of your Modbus TCP component. For example, _Modbus1_.
