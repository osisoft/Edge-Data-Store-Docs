---
uid: PrinciplesOfOperationModbus
---

# Operational overview

Once an instance of the Modbus TCP EDS adapter is defined in the system components configuration, it must be configured for it to create streams and collect data.

## Adapter configuration

For an Modbus TCP EDS adapter instance to start data collection, configure the adapter by defining the following:

- Data source - Provide the connection information for the Modbus data source.

- Data selection - Specify the Modbus TCP items to which the adapter instance should subscribe for data.

- Logging - Set up the logging behavior for the adapter instance.

For more details, see [Data source configuration](xref:ModbusTCPDataSourceConfiguration) and [Data selection configuration](xref:ModbusTCPDataSelectionConfiguration). For more information on how to configure logging, see [Component-level logging configuration](xref:ComponentLoggingConfiguration).

## Connection

The Modbus TCP EDS adapter communicates with the Modbus TCP devices through the TCP/IP network by sending request packets that are constructed based on the data selection configurations, and collects the response packets returned by the devices.

## Stream creation

From the parsed data selection configurations, the Modbus TCP EDS adapter creates types, streams, and data based on the information provided. For each measurement in the data selection configuration, a stream is created in EDS to store time series data.

## Data collection

The Modbus TCP EDS adapter collects data from the Modbus TCP devices at the polling rates specified in the configuration. The rates are set in each of the data selection configurations and can range from 0 milliseconds (as fast as possible) up to 1 day per polling. The adapter automatically optimizes the data collection process by grouping the requests to reduce the I/O load imposed on the Modbus TCP networks.

## Streams by Modbus TCP EDS adapter

For each data selection configuration, the Modbus TCP EDS adapter creates a stream with two properties. The properties are described in the following table.

| Property name | Data type | Description |
|---------------|-----------|-------------|
| Timestamp     | String    | The response time of the stream data from the Modbus TCP device. |
| Value         | Specified by the data selection | The value of the stream data from the Modbus TCP device. |

Stream ID is a unique identifier for each stream created by the adapter for the selected measurement. If a custom stream ID is specified for the measurement in the data selection configuration, the Modbus TCP EDS adapter will use that stream ID to create the stream. Otherwise, the adapter constructs the stream ID using the following format:

```
<Adapter Component ID>.<Unit ID>.<Register Type>.<Register Offset> 
```

**Note:** Naming convention is affected by StreamIdPrefix and ApplyPrefixToStreamID settings in data source configuration. For more information, see [Data source configuration](xref:ModbusTCPDataSourceConfiguration).

## Buffering

Because the Modbus TCP EDS adapter sends data directly to EDS, buffering capability is not provided. EDS acts as a buffer before the data is egressed to either a PI Server or OCS. The amount of data stored in EDS is controlled by the following storage parameters:

 - **StreamStorageLimitMb**

 - **StreamStorageTargetMb**

For more information about configuring data storage in EDS, see [Storage runtime configuration](xref:storageruntime).
