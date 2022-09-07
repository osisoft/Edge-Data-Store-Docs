---
uid: troubleShooting
---

# Troubleshoot Edge Data Store

Edge Data Store includes both local and remote means of diagnosing issues encountered while using or developing against EDS.

Edge Data Store supports a diagnostics namespace that stores streams containing diagnostic information from Edge Data Store itself. Egress this data to either a PI Web Server or AVEVA Data Hub to monitor the state of a system remotely. For details about egressing diagnostic data, see [Diagnostics configuration](xref:EdgeDataStoreDiagnostics).

In addition to diagnostics data, all components in Edge Data Store support OMF health messages. Configure health messages to send health data to either PI Web Server or OSIsoft Cloud Service endpoints for remote monitoring of devices. For more information, see [Health endpoints configuration](xref:HealthEndpointsConfiguration).

## OMF ingress

When a custom application fails to write stream data to EDS:

1. Verify the custom application is sending OMF messages in the correct order: 1) OMF type, 2) OMF container, 3) OMF data.

   **Note:** OMF messages must be sent in the correct order to be ingressed into Edge Data Store.

1. Refer to logging of warnings, errors, and messages for help with diagnosing these issues.

### OMF ingress logging

Ingress logging messages provide a record of ingress events. To capture the most information for troubleshooting:

1. Refer to [System-level logging configuration](xref:systemloggingConfiguration) to set logging parameters.

1. For maximum message logging information, set the log level to `Trace`.

### OMF ingress message debugging

Every incoming OMF message logs a request and response log file. Log files are located in the following location and grouped by the associated OMF message type:

`C:\ProgramData\OSIsoft\EdgeDataStore\Logs\IngressDebugLogs\`

Each log file leverages the following filename format:

`{ticks}-{operationId}-{Request/Response}.txt`

Use debugging information to troubleshoot problems between an OMF application and Edge Data Store. To enable debugging:

1. Refer to [Storage runtime configuration](xref:storageruntime) to enable debugging.

1. Set an appropriate time value for the **IngressDebugExpiration** property.

   **Note:** You can also disable debugging by setting the expiration value to `null`.

Date and time strings should use the following formats:

- UTC: `yyyy-mm-ddThh:mm:ssZ`

- Local: `mm-dd-yyyy hh:mm:ss`

## Periodic egress

EDS periodic egress extracts data from SDS streams and sends the appropriate sequences of type, container, and data OMF messages on startup.  

If unexpected data appears in an AVEVA Data Hub or PI System, check if multiple devices are writing to the same SDS stream. To check egress configuration:

1. Check all egress configuration files in Edge Data Store to verify whether any endpoints are duplicated. A duplicate endpoint means that more than one device is egressing data to it, resulting in unexpected data.

1. Assign stream prefixes in the periodic egress endpoint configuration to ensure that output data streams are logically separated in the systems of record. For instructions, see [Configure data egress](xref:configureEgress).

   **Note:** Type prefixes may be helpful if you have changed a stream type definition on EDS. OMF types on both AVEVA Data Hub and the PI System are immutable once created. If the type of the data stream changes, it is best to either delete the old type definition (if nothing is still using it) or add a type prefix to create a new unique type that will be used by new streams egressing from EDS to the systems of record.

### Periodic egress logging

Egress logging messages provide a record of egress events. To capture maximum information for troubleshooting:

1. Refer to [System-level logging configuration](xref:systemloggingConfiguration) to set logging parameters.

1. For maximum message logging information, set the log level to `Trace`.

### Periodic egress debugging

Use debugging information to troubleshoot problems between Edge Data Store and the egress destination. To enable debugging:

1. Refer to [Data egress configuration](xref:egress) to enable debugging.

1. Set an appropriate time value for the **DebugExpiration** property.

   **Note:** Disable debugging by setting the expiration value to `null`.

Date and time strings should use the following formats:

   - UTC: `yyyy-mm-ddThh:mm:ssZ`

   - Local: `mm-dd-yyyy hh:mm:ss`

### Debugging folder/file structure

Because the overall number and content length of each request/response pair captured by debugging can be quite large, debugging information is stored to disk in a separate location from other log messages. Debug folders and files are created under the Edge Data Store data folder as follows:

   Windows: `%programdata%\OSIsoft\EdgeDataStore\Logs\EgressDebugLogs\Data\{egressId}\{omfType}\{Ticks}-{Guid}-{Request/Response}.txt`

   Linux: `/usr/share/OSIsoft/EdgeDataStore/Logs/EgressDebugLogs/Data/{egressId}/{omfType}/{Ticks}-{Guid}-{Request/Response}.txt`

The OMF specific elements of the file structure are defined in the following table.

| Element    | Represents                       |
|------------|----------------------------------|
| *omfType*  | The OMF message type: Type, Container, or Data.    |
| *Ticks*    | The time in milliseconds (tick count) for UTC DateTime when determined message would be written to disk.  |
| *Guid*     | The unique GUID for each request/response pair.     |
| *Req/Res*  | Whether the message was HTTP request or response.   |

## Additional resources

For information about specific log messages and possible resolutions, refer to the [OSIsoft Customer Portal](https://my.osisoft.com/).
