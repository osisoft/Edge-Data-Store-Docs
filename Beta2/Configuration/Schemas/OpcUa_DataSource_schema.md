---
uid: opcUa_DataSelection_Schema
---

# Sample Opc Ua Data Source Configuration

```json
{
    "EndpointUrl": "opc.tcp://<ip address>:<port - often 62541>/<server path>",
    "UseSecureConnection": false,
    "UserName": null,
    "Password": null,
    "RootNodeIds": null,
    "IncomingTimestamp": "Source",
    "StreamIdPrefix": "OpcUa"
}
```

# OPC UA data source configuration schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                                   |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | ------------------------------------------------------------ |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [OpcUa_DataSource_schema.json](OpcUa_DataSource_schema.json) |

# DataSourceConfiguration properties

| Property                                    | Type      | Required | Nullable | Defined by                            |
| ------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [EndpointUrl](#endpointurl)                 | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| [IncomingTimestamp](#incomingtimestamp)     | reference | Optional | No       | DataSourceConfiguration (this schema) |
| [Password](#password)                       | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| [RootNodeIds](#rootnodeids)                 | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| [StreamIdPrefix](#streamidprefix)           | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| [UseSecureConnection](#usesecureconnection) | `boolean` | Optional | No       | DataSourceConfiguration (this schema) |
| [UserName](#username)                       | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |

## EndpointUrl

`EndpointUrl`

- is optional
- type: `string`
- defined in this schema

### EndpointUrl type

`string`, nullable

## IncomingTimestamp

`IncomingTimestamp`

- is optional
- type: reference
- defined in this schema

### IncomingTimestamp type

- []() – `#/definitions/IncomingTimestampType`

## Password

`Password`

- is optional
- type: `string`
- defined in this schema

### Password type

`string`, nullable

## RootNodeIds

`RootNodeIds`

- is optional
- type: `string`
- defined in this schema

### RootNodeIds type

`string`, nullable

## StreamIdPrefix

`StreamIdPrefix`

- is optional
- type: `string`
- defined in this schema

### StreamIdPrefix type

`string`, nullable

## UseSecureConnection

`UseSecureConnection`

- is optional
- type: `boolean`
- defined in this schema

### UseSecureConnection type

`boolean`

## UserName

`UserName`

- is optional
- type: `string`
- defined in this schema

### UserName type

`string`, nullable

**All** of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property              | Type    | Required |
| --------------------- | ------- | -------- |
| `EndpointUrl`         | string  | Optional |
| `IncomingTimestamp`   |         | Optional |
| `Password`            | string  | Optional |
| `RootNodeIds`         | string  | Optional |
| `StreamIdPrefix`      | string  | Optional |
| `UseSecureConnection` | boolean | Optional |
| `UserName`            | string  | Optional |

#### EndpointUrl

`EndpointUrl`

- is optional
- type: `string`

##### EndpointUrl type

`string`, nullable

#### IncomingTimestamp

`IncomingTimestamp`

- is optional
- type: reference

##### IncomingTimestamp type

- []() – `#/definitions/IncomingTimestampType`

#### Password

`Password`

- is optional
- type: `string`

##### Password type

`string`, nullable

#### RootNodeIds

`RootNodeIds`

- is optional
- type: `string`

##### RootNodeIds type

`string`, nullable

#### StreamIdPrefix

`StreamIdPrefix`

- is optional
- type: `string`

##### StreamIdPrefix type

`string`, nullable

#### UseSecureConnection

`UseSecureConnection`

- is optional
- type: `boolean`

##### UseSecureConnection type

`boolean`

#### UserName

`UserName`

- is optional
- type: `string`

##### UserName type

`string`, nullable
