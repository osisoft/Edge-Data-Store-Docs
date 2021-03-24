---
uid: storageruntime
---

# Storage runtime configuration

The Edge Data Store storage component is install with default configurations that are sufficient for most scenarios; however, the runtime characteristics of the storage component can be configured.  

**Note:** Consult with OSIsoft Support personnel before modifying the default configuration.

## Configure storage runtime

To update the storage runtime configuration, complete the following:

1. Create a JSON file with the storage runtime configuration.

   **Note:** See the following *Parameters* table for all available runtime parameters to define.
          See the following *Examples* section for an example of a valid runtime configuration file.
          
2. Save the JSON file with the name Storage_Runtime.config.json.
3. From the same directory where the file exists, run the following curl script:

  ```bash
  curl -d "@Storage_Runtime.config.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/Runtime
  ```

  **Note:** The @ symbol is a required prefix for the above command.

### Parameters

| Parameter                       | Required | Type     | Description                                        |
|---------------------------------|----------|----------|----------------------------------------------------|
| **IngressDebugExpiration**      | Required | string   | If set, defines how long OMF ingress debug files should be produced. |
| **StreamStorageLimitMb**        | Required | integer  | The maximum size in megabytes that a stream can reach. |
| **StreamStorageTargetMb**       | Required | integer  | The size in megabytes that a stream will be reduced to after StreamStorageLimitMb size is reached for a single stream. |
| **EnableTransactionLog**        | No       | Boolean     | Enables or disables the transaction log. The transaction log helps to ensure no data is lost should a device lose power. |
| **TransactionLogLimitMB**       | No       | integer  | Maximum size for transaction log file. Transaction log files larger than this size will be deleted, resulting is loss of data should the device lose power. |
| **CheckpointRateInSec**         | No       | integer  | How often to flush new data to store.  |


### Examples

The following is a valid runtime configuration example.

```
{
  "streamStorageLimitMb": 2,
  "streamStorageTargetMb": 1,
  "ingressDebugExpiration": "0001-01-01T00:00:00",
  "checkpointRateInSec": 30,
  "transactionLogLimitMB": 250,
  "enableTransactionLog": true
}
```

## Storage runtime configuration properties

| Property                                          | Type      | Required     | Nullable | Defined by                                |
| ------------------------------------------------- | --------- | ------------ | -------- | ----------------------------------------- |
| [IngressDebugExpiration](#ingressdebugexpiration) | `string`  | **Required** | No       | StorageRuntimeConfiguration (this schema) |
| [StreamStorageLimitMb](#streamstoragelimitmb)     | `integer` | **Required** | No       | StorageRuntimeConfiguration (this schema) |
| [StreamStorageTargetMb](#streamstoragetargetmb)   | `integer` | **Required** | No       | StorageRuntimeConfiguration (this schema) |
| [EnableTransactionLog](#enabletransactionlog)     | `bool`    | No           | No       | StorageRuntimeConfiguration (this schema) |
| [TransactionLogLimitMB](#transactionloglimitmb)   | `integer` | No           | No       | StorageRuntimeConfiguration (this schema) |
| [CheckpointRateInSec](#checkpointrateinsec)       | `integer` | No           | No       | StorageRuntimeConfiguration (this schema) |

### IngressDebugExpiration

Use the Ingress Debug Expiration property when debugging OMF to set the date and time when debugging should be disabled. If a future date and time is is specified, incoming OMF messages are logged and HTTP request and response content is stored to disk for review. The debug logging stops at the data and time specified. Set the value to *null* to disable logging.

Examples of valid strings representing date and time:

    UTC: "yyyy-mm-ddThh:mm:ssZ"

    Local: "mm-dd-yyyy hh:mm:ss"

When logging is activated, the content of an incoming OMF message, including the headers, is written to a file in the Logs directory. For an active application, this file can become quite large. As a result, debug information is stored to disk in another format than usual log messages. A single file is written to the usual logs directory for every incoming OMF type, container, and data message.

#### IngressDebugExpiration type

`string`

- format: `date-time` date and time (according to [RFC 3339, section 5.6](http://tools.ietf.org/html/rfc3339))
- minimum length: 1 character

### StreamStorageLimitMb

Use the StreamStorageLimitMb property to set the maximum size in megabytes that a stream can reach. When a stream exceeds the size specified, older data is deleted from the file until the stream is at or below the StreamStorageTargetMb value. The target value, set in the StreamStorageTargetMb property, needs to be smaller than the maximum specified in this property.

#### StreamStorageLimitMb type

`integer`

- minimum value: `2`
- maximum value: `2147483647`

### StreamStorageTargetMb

Use the StreamStorageTargetMb property to set the size in megabytes that a stream will be reduced to after StreamStorageLimitMb size is reached for a single stream. When a stream exceeds the size specified in the StreamStorageLimitMb property, older data is deleted from the file until the stream is at or below the StreamStorageTargetMb value. The target value needs to be smaller than the maximum specified in the StreamStorageLimitMb property.

#### StreamStorageTargetMb type

`integer`

- minimum value: `1`
- maximum value: `2147483647`

### EnableTransactionLog

Use the EnableTransactionLog property to define whether the Storage component maintains a transaction log between checkpoint operations. The transaction log helps the product reduce data loss, should the host device lose power.

#### EnableTransactionLog type

`bool`

### TransactionLogLimitMB

Use the TransactionLogLimitMB property to define the maximum size, in MB, of a transaction log. When a transaction log exceeds this size, it is deleted, which reduces the amount of data that can be recovered should the host device lose power.

#### TransactionLogLimitMB type

`integer`

- minimum value: `1`
- maximum value: `2147483647`

### CheckpointRateInSec

Use the CheckpointRateInSec property to define, in seconds, how often the storage component ensures recent data and configuration changes are flushed to storage.  

A setting of 0 disables checkpointing. Disabling checkpointing reduces the resiliency of the product and thus data loss can occur if the host device loses power.

#### CheckpointRateInSec type

`integer`

- minimum value: `0`
- maximum value: `86400`

**Note:** All of the following _requirements_ need to be fulfilled.

##### Requirement 1

- []() `#/definitions/EdgeConfigurationBase`

##### Requirement 2

`object` with following properties:

| Property                 | Type    | Required     |
| ------------------------ | ------- | ------------ |
| `IngressDebugExpiration` | string  | **Required** |
| `StreamStorageLimitMb`   | integer | **Required** |
| `StreamStorageTargetMb`  | integer | **Required** |
| `EnableTransactionLog`   | Boolean | Optional     |
| `TransactionLogLimitMB`  | integer | Optional     |
| `CheckpointRateInSec`    | integer | Optional     |
