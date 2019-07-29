---
uid: modbus_DataSource_schema
---

# Sample Modbus data source configuration

```json
{
    "IpAddress": "<Modbus IP Address>",
    "Port": <Port - usually 502>,
    "ConnectTimeout": 15000,
    "ReconnectInterval": 5000,
    "RequestTimeout": 9000,
    "DelayBetweenRequests": 0,
    "MaxResponseDataLength": 250
}
```

# Modbus data source configuration schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                                     |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Modbus_DataSource_schema.json](Modbus_DataSource_schema.json) |

# DataSourceConfiguration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [ConnectTimeout](#connecttimeout)               | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| [DelayBetweenRequests](#delaybetweenrequests)   | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| [IpAddress](#ipaddress)                         | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| [MaxResponseDataLength](#maxresponsedatalength) | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| [Port](#port)                                   | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| [ReconnectInterval](#reconnectinterval)         | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| [RequestTimeout](#requesttimeout)               | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| [StreamIdPrefix](#streamidprefix)               | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |

## ConnectTimeout

`ConnectTimeout`

- is optional
- type: `integer`
- defined in this schema

### ConnectTimeout type

`integer`

## DelayBetweenRequests

`DelayBetweenRequests`

- is optional
- type: `integer`
- defined in this schema

### DelayBetweenRequests type

`integer`

## IpAddress

`IpAddress`

- is optional
- type: `string`
- defined in this schema

### IpAddress type

`string`, nullable

## MaxResponseDataLength

`MaxResponseDataLength`

- is optional
- type: `integer`
- defined in this schema

### MaxResponseDataLength type

`integer`

## Port

`Port`

- is optional
- type: `integer`
- defined in this schema

### Port type

`integer`

## ReconnectInterval

`ReconnectInterval`

- is optional
- type: `integer`
- defined in this schema

### ReconnectInterval type

`integer`

## RequestTimeout

`RequestTimeout`

- is optional
- type: `integer`
- defined in this schema

### RequestTimeout type

`integer`

## StreamIdPrefix

`StreamIdPrefix`

- is optional
- type: `string`
- defined in this schema

### StreamIdPrefix type

`string`, nullable

**All** of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property                | Type    | Required |
| ----------------------- | ------- | -------- |
| `ConnectTimeout`        | integer | Optional |
| `DelayBetweenRequests`  | integer | Optional |
| `IpAddress`             | string  | Optional |
| `MaxResponseDataLength` | integer | Optional |
| `Port`                  | integer | Optional |
| `ReconnectInterval`     | integer | Optional |
| `RequestTimeout`        | integer | Optional |
| `StreamIdPrefix`        | string  | Optional |

#### ConnectTimeout

`ConnectTimeout`

- is optional
- type: `integer`

##### ConnectTimeout type

`integer`

#### DelayBetweenRequests

`DelayBetweenRequests`

- is optional
- type: `integer`

##### DelayBetweenRequests type

`integer`

#### IpAddress

`IpAddress`

- is optional
- type: `string`

##### IpAddress type

`string`, nullable

#### MaxResponseDataLength

`MaxResponseDataLength`

- is optional
- type: `integer`

##### MaxResponseDataLength type

`integer`

#### Port

`Port`

- is optional
- type: `integer`

##### Port type

`integer`

#### ReconnectInterval

`ReconnectInterval`

- is optional
- type: `integer`

##### ReconnectInterval type

`integer`

#### RequestTimeout

`RequestTimeout`

- is optional
- type: `integer`

##### RequestTimeout type

`integer`

#### StreamIdPrefix

`StreamIdPrefix`

- is optional
- type: `string`

##### StreamIdPrefix type

`string`, nullable
