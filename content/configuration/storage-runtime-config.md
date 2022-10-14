---
uid: storageruntime
---

# Storage runtime configuration

The Edge Data Store storage component is installed with default configurations that are sufficient for most scenarios; however, you can configure the runtime characteristics of the storage component.  

**Note:** Consult with Technical Support before you modify the default configuration.

To update the storage runtime configuration:

1. Using any text editor, create a JSON file that contains the storage runtime configuration.

  - For the content structure, see [Parameters](#parameters).

1. Save the JSON file with the name `Storage_Runtime.config.json`.

1. From the same directory where the file exists, run the following curl script:

  ```bash
  curl -d "@Storage_Runtime.config.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/Runtime
  ```

  **Note:** The @ symbol is a required prefix for this command.

## Parameters

The following table lists all available runtime parameters for EDS storage configuration.

| Parameter                       | Required | Type     | Description                                        |
|---------------------------------|----------|----------|----------------------------------------------------|
| **IngressDebugExpiration**      | Required | `string`   | Sets the date and time when debugging should be disabled. If you specify a future date and time, incoming OMF messages are logged and the HTTP request and response content is stored to disk for review. The debug logging stops at the date and time specified. Set the value to `null` to disable logging.<br></br>Every incoming OMF message logs a request and response log file. Log files are located in `C:\ProgramData\OSIsoft\EdgeDataStore\Logs\IngressDebugLogs\` and grouped by the associated OMF message type. Each log file name is in the format: `{ticks}-{operationId}-{Request/Response}.txt`. <br></br>Valid formats are UTC: `yyyy-mm-ddThh:mm:ssZ` and Local: `mm-dd-yyyy hh:mm:ss`. <br></br>When you activate logging, the content of an incoming OMF message, including the headers, is written to multiple files in the `Logs` directory. Those files are written to the `IngressDebugLogs` directory in the usual logs directory for every incoming OMF type, container, and data message. |
| **StreamStorageLimitMb**        | Required | `integer`  | The maximum size in megabytes that a stream can reach. When a stream exceeds the specified size, older data is deleted from the file until the stream is at or below the **StreamStorageTargetMb** value. The target value, set in the **StreamStorageTargetMb** property, needs to be smaller than the maximum specified in this property. Minimum value: `2`. Maximum value: `2147483647`. |
| **StreamStorageTargetMb**       | Required | `integer`  | The size in megabytes that a stream will be reduced to after **StreamStorageLimitMb** size is reached for a single stream. When a stream exceeds the size specified in the **StreamStorageLimitMb** property, older data is deleted from the file until the stream is at or below the **StreamStorageTargetMb** value. The target value needs to be smaller than the maximum specified in the **StreamStorageLimitMb** property. Minimum value: `1`. Maximum value: `2147483647`. |
| **TransactionLogLimitMB**     | No       | `integer`  | Maximum size in megabytes for transaction log file. When a transaction log exceeds this size, it is deleted, which reduces the amount of data that you can recover if the host device loses power. Minimum value: `1`. Maximum value: `2147483647`.   |
| **CheckpointRateInSec**         | No       | `integer`  | Defines, in seconds, how often the storage component ensures recent data and configuration changes are flushed to storage. A setting of `0` disables checkpointing. Disabling checkpointing reduces the resiliency of the product, which can result in data loss if the host device loses power. Minimum value: `0`. Maximum value: `86400`.  |
| **EnableMetrics** | No | `Boolean` | Enables EDS to create a new stream in the diagnostics namespace to track some metrics about internal storage operations. These metrics have no value outside of troubleshooting specific issues with the help of OSIsoft support. This should be set to `false` unless directed by OSIsoft support. |

## Examples

The following is a valid runtime configuration example.

```
{
  "streamStorageLimitMb": 2,
  "streamStorageTargetMb": 1,
  "ingressDebugExpiration": "0001-01-01T00:00:00",
  "checkpointRateInSec": 30,
  "transactionLogLimitMB": 250,
  "enableTransactionLog": true,
  "enableMetrics": false
}
```
