---
uid: storage_Runtime_schema
---

# Sample storage runtime configuration

```json
{
  "StreamStorageLimitMb": 2,
  "StreamStorageTargetMb": 1,
  "IngressDebugExpiration": "0001-01-01T00:00:00"
}
```

# Storage runtime configuration properties

| Property                                          | Type      | Required     | Nullable | Defined by                                |
| ------------------------------------------------- | --------- | ------------ | -------- | ----------------------------------------- |
| IngressDebugExpiration | `string`  | **Required** | No       | StorageRuntimeConfiguration (this schema) |
| StreamStorageLimitMb     | `integer` | **Required** | No       | StorageRuntimeConfiguration (this schema) |
| StreamStorageTargetMb  | `integer` | **Required** | No       | StorageRuntimeConfiguration (this schema) |

## IngressDebugExpiration

Ingress Debug Expiration is a property that can be used when debugging OMF. If the date and time is the future incoming OMF messages will be logged until the date and time specified. Once the configured time is past OMF messages will no longer be logged for debugging purposes.

### IngressDebugExpiration type

`string`

- format: `date-time` – date and time (according to [RFC 3339, section 5.6](http://tools.ietf.org/html/rfc3339))
- minimum length: 1 characters

## StreamStorageLimitMb

StreamStorageLimitMb is the maximum size in megabytes that a stream can reach. When a stream exceeds the size specified, older data will be deleted from the file. Data will be removed from the stream until the stream is at or below the StreamStorageTargetMb value. It is recommended that the target value be smaller than the limit since trimming can be an expensive operation and should be done infrequently.

### StreamStorageLimitMb type

`integer`

- minimum value: `2`
- maximum value: `2147483647`

## StreamStorageTargetMb

StreamStorageTargetMb is the size in megabytes that a stream will be reduced to after StreamStorageLimitMb size is reached for a single stream. When a stream exceeds the size specified, older data will be deleted from the file. Data will be removed from the stream until the stream is at or below the StreamStorageTargetMb value. It is recommended that the target value be smaller than the limit since trimming can be an expensive operation and should be done infrequently.

### StreamStorageTargetMb type

`integer`

- minimum value: `1`
- maximum value: `2147483647`

**Note:** All of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property                 | Type    | Required     |
| ------------------------ | ------- | ------------ |
| `IngressDebugExpiration` | string  | **Required** |
| `StreamStorageLimitMb`   | integer | **Required** |
| `StreamStorageTargetMb`  | integer | **Required** |

