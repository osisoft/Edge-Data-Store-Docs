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

# Storage runtime configuration schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                                 |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | ---------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Storage_Runtime_schema.json](Storage_Runtime_schema.json) |

# StorageRuntimeConfiguration properties

| Property                                          | Type      | Required     | Nullable | Defined by                                |
| ------------------------------------------------- | --------- | ------------ | -------- | ----------------------------------------- |
| [IngressDebugExpiration](#ingressdebugexpiration) | `string`  | **Required** | No       | StorageRuntimeConfiguration (this schema) |
| [StreamStorageLimitMb](#streamstoragelimitmb)     | `integer` | **Required** | No       | StorageRuntimeConfiguration (this schema) |
| [StreamStorageTargetMb](#streamstoragetargetmb)   | `integer` | **Required** | No       | StorageRuntimeConfiguration (this schema) |

## IngressDebugExpiration

`IngressDebugExpiration`

- is **required**
- type: `string`
- defined in this schema

Ingress Debug Expiration is a property that can be used when debugging OMF. If the date and time is the future incoming OMF messages will be logged until the date and time specified. Once the configured time is past OMF messages will no longer be logged for debugging purposes.

### IngressDebugExpiration type

`string`

- format: `date-time` – date and time (according to [RFC 3339, section 5.6](http://tools.ietf.org/html/rfc3339))
- minimum length: 1 characters

## StreamStorageLimitMb

`StreamStorageLimitMb`

- is **required**
- type: `integer`
- defined in this schema

### StreamStorageLimitMb type

`integer`

- minimum value: `2`
- maximum value: `2147483647`

## StreamStorageTargetMb

`StreamStorageTargetMb`

- is **required**
- type: `integer`
- defined in this schema

### StreamStorageTargetMb type

`integer`

- minimum value: `1`
- maximum value: `2147483647`

**All** of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property                 | Type    | Required     |
| ------------------------ | ------- | ------------ |
| `IngressDebugExpiration` | string  | **Required** |
| `StreamStorageLimitMb`   | integer | **Required** |
| `StreamStorageTargetMb`  | integer | **Required** |

#### IngressDebugExpiration

`IngressDebugExpiration`

- is **required**
- type: `string`

##### IngressDebugExpiration type

`string`

- format: `date-time` – date and time (according to [RFC 3339, section 5.6](http://tools.ietf.org/html/rfc3339))
- minimum length: 1 characters

#### StreamStorageLimitMb

`StreamStorageLimitMb`

- is **required**
- type: `integer`

##### StreamStorageLimitMb type

`integer`

- minimum value: `2`
- maximum value: `2147483647`

#### StreamStorageTargetMb

`StreamStorageTargetMb`

- is **required**
- type: `integer`

##### StreamStorageTargetMb type

`integer`

- minimum value: `1`
- maximum value: `2147483647`
