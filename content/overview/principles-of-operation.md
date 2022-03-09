---
uid: PIAdapterForModbusTCPPrinciplesOfOperation
---

# Principles of operation

This adapter's operations focus on data collection and stream creation.

## Adapter configuration

For the Modbus TCP adapter to start data collection, configure the following:

- Data source: Provide the data source from which the adapter should collect data.
- Data selection: Select Modbus TCP items to which the adapter should subscribe for data.
- Logging: Set up the logging attributes to manage the adapter logging behavior.

For more details, see [PI Adapter for Modbus TCP data source configuration](xref:PIAdapterForModbusTCPDataSourceConfiguration) and [PI Adapter for Modbus TCP data selection configuration](xref:PIAdapterForModbusTCPDataSelectionConfiguration).

## Connection

The adapter communicates with the Modbus TCP devices through the TCP/IP network by sending request packets that are constructed based on the data selection configurations. It collects the response packets returned by the devices.

## Data collection

The adapter collects data from the Modbus TCP devices at the polling rates that you specify. The rates are set in each of the data selection configurations and can range from 0 milliseconds (as fast as possible) up to 1 day per polling. The adapter automatically optimizes the data collection process by grouping the requests to reduce the I/O load imposed on the Modbus TCP networks. For more information see [PI Adapter for Modbus TCP data selection configuration](xref:PIAdapterForModbusTCPDataSelectionConfiguration).

### Data types

The adapter converts readings from single or multiple registers into the data types specified by the data type code and populates the value into streams.

The following table lists all data types with their corresponding type codes supported by the adapter.

| Data type code | Data type name | Value type | Register type | Description |
|----------------|----------------|------------|---------------|-------------|
| 1              | `Boolean`        | `Boolean`       | Bool          | 0 = false <br> 1 = true
| 10             | `Int16`          |`Int16`     | Bool/16-bit   | Read 1 Modbus TCP register<sup>1</sup> and interpret as a 16-bit integer. Bytes [BA] read from the device are stored as [AB].<sup>2</sup> |
| 20             | `UInt16`         | `UInt16`     | Bool/16-bit   | Read 1 Modbus TCP register<sup>1</sup> and interpret as an unsigned 16-bit integer. Bytes [BA] read from the device are stored as [AB].<sup>2</sup> |
| 30             | `Int32`          | `Int32`      | 16-bit/32-bit | Read 32 bits from the Modbus TCP device and interpret as a 32-bit integer. Bytes [DCBA] read from the device are stored as [ABCD].<sup>2</sup> |
| 31             | `Int32ByteSwap`  | `Int32`      | 16-bit/32-bit | Read 32 bits from the Modbus TCP device and interpret as a 32-bit integer. Bytes [BADC] read from the device are stored as [ABCD].<sup>2</sup> |
| 100            | `Float32`        | `Float32`    | 16-bit/32-bit | Read 32 bits from the Modbus TCP device and interpret as a 32-bit float. Bytes [DCBA] read from the device are stored as [ABCD].<sup>2</sup> |
| 101            | `Float32ByteSwap` | `Float32`   | 16-bit/32-bit | Read 32 bits from the Modbus TCP device and interpret as a 32-bit float. Bytes [BADC] read from the device are stored as [ABCD].<sup>2</sup> |
| 110            | `Float64`        | `Float64`    | 16-bit/32-bit | Read 64 bits from the Modbus TCP device and interpret as a 64-bit float. Bytes [HGFEDCBA] read from the device are stored as [ABCDEFGH].<sup>2</sup>|
| 111            | `Float64ByteSwap` | `Float64`   | 16-bit/32-bit | Read 64 bits from the Modbus TCP device and interpret as a 64-bit float. Bytes [BADCFEHG] read from the device are stored as [ABCDEFGH].<sup>2</sup>|
| 1001 - 1250    | `String`         | `String`     | 16-bit/32-bit | 1001 reads a one-character string, 1002 reads a two-character string, and 1003 reads a three-character string and so on. Bytes [AB] are interpreted as "AB". |
| 2001 - 2250    | `StringByteSwap` | `String`     | 16-bit/32-bit | 2001 reads a one-character string, 2002 reads a two-character string, and 2003 reads a three-character string and so on. Bytes [BA] are interpreted as "AB". |

<sup>1</sup> For more information about Modbus TCP registers, see [How is data stored in Standard Modbus? (https://www.se.com/us/en/faqs/FA168406/)](https://www.se.com/us/en/faqs/FA168406/)

<sup>2</sup> Bytes are read in reverse order.

## Stream creation

The Modbus TCP adapter creates a stream with two properties for each selected Modbus TCP item. The properties are described in the following table.

| Property name | Data type | Description |
|---------------|-----------|-------------|
| `Timestamp`   | String    | The response time of the stream data from the Modbus TCP device |
| `Value`       | Specified by the data selection | The value of the stream data from the Modbus TCP device |

Certain metadata are sent with each stream created. The following metadata are common for every adapter type:

- **ComponentId**: Specifies the data source, for example, _Modbus1_
- **ComponentType**: Specifies the type of adapter, for example, _Modbus_

Each stream created for the selected measurement has a unique identifier (stream ID). If you specify a custom stream ID for the measurement in the data selection configuration, the adapter uses that stream ID to create the stream. Otherwise, the adapter constructs the stream ID using the following format:

```code
<AdapterComponentID>.<Device ID>.<Unit ID>.<Register Type>.<Register Offset>
```

**Note:** Naming convention is affected by `StreamIdPrefix` and `DefaultStreamIdPattern` settings in the data source configuration. For more information, see [PI Adapter for Modbus TCP data source configuration](xref:PIAdapterForModbusTCPDataSourceConfiguration).
