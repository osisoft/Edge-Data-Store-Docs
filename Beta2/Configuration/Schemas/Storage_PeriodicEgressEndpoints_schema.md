---
uid: storage_PeriodicEgressEndpoints_schema
---

# Periodic egress configuration schema

This schema is used to configure data egress from Edge System to a PI Server or to OCS.

## Sample periodic egress configuration file

```json
[{
        "Id": "OCS Data",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "default",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<OCS OMF endpoint>",
        "ClientId": "<clientid>",
        "ClientSecret": "<clientsecret>",
        "UserName": null,
        "Password": null,
        "DebugExpiration": null
    },
    {
        "Id": "PI Web API Data",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "default",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<yourserver>/piwebapi/omf/",
        "ClientId": null,
        "ClientSecret": null,
        "UserName": "<username>",
        "Password": "<password>",
        "DebugExpiration": null
    },
    {
        "Id": "OCS Diagnostics",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "diagnostics",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<OCS OMF endpoint>",
        "ClientId": "<clientid>",
        "ClientSecret": "<clientsecret>",
        "UserName": null,
        "Password": null,
        "DebugExpiration": null
    },
    {
        "Id": "PI Web API Diagnostics",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "diagnostics",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<yourserver>/piwebapi/omf/",
        "ClientId": null,
        "ClientSecret": null,
        "UserName": "<username>",
        "Password": "<password>",
        "DebugExpiration": null
    }
]
```

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined Ii                                                                                 |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | ------------------------------------------------------------------------------------------ |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Storage_PeriodicEgressEndpoints_schema.json](Storage_PeriodicEgressEndpoints_schema.json) |

# PeriodicEgressConfiguration properties

| Property                            | Type      | Required     | Nullable | Defined by                                |
| ----------------------------------- | --------- | ------------ | -------- | ----------------------------------------- |
| [Backfill](#backfill)               | `boolean` | Optional     | No       | PeriodicEgressConfiguration (this schema) |
| [ClientId](#clientid)               | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [ClientSecret](#clientsecret)       | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [DebugExpiration](#debugexpiration) | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [Description](#description)         | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [EgressFilter](#egressfilter)       | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [Enabled](#enabled)                 | `boolean` | Optional     | No       | PeriodicEgressConfiguration (this schema) |
| [Endpoint](#endpoint)               | `string`  | **Required** | No       | PeriodicEgressConfiguration (this schema) |
| [ExecutionPeriod](#executionperiod) | `string`  | **Required** | No       | PeriodicEgressConfiguration (this schema) |
| [Id](#id)                           | `string`  | **Required** | No       | PeriodicEgressConfiguration (this schema) |
| [Name](#name)                       | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [NamespaceId](#namespaceid)         | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [Password](#password)               | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [StreamPrefix](#streamprefix)       | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [TypePrefix](#typeprefix)           | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| [UserName](#username)               | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |

## Backfill

`Backfill`

- is optional
- type: `boolean`
- defined in this schema

### Backfill type

`boolean`

## ClientId

`ClientId`

- is optional
- type: `string`
- defined in this schema

### ClientId type

`string`, nullable

## ClientSecret

`ClientSecret`

- is optional
- type: `string`
- defined in this schema

### ClientSecret type

`string`, nullable

## DebugExpiration

`DebugExpiration`

- is optional
- type: `string`
- defined in this schema

### DebugExpiration type

`string`, nullable

- format: `date-time` – date and time (according to [RFC 3339, section 5.6](http://tools.ietf.org/html/rfc3339))

## Description

`Description`

- is optional
- type: `string`
- defined in this schema

### Description type

`string`, nullable

## EgressFilter

`EgressFilter`

- is optional
- type: `string`
- defined in this schema

### EgressFilter type

`string`, nullable

## Enabled

`Enabled`

- is optional
- type: `boolean`
- defined in this schema

### Enabled type

`boolean`

## Endpoint

`Endpoint`

- is **required**
- type: `string`
- defined in this schema

### Endpoint type

`string`

- minimum length: 1 characters

## ExecutionPeriod

`ExecutionPeriod`

- is **required**
- type: `string`
- defined in this schema

### ExecutionPeriod type

`string`

- minimum length: 1 characters

## Id

`Id`

- is **required**
- type: `string`
- defined in this schema

### Id type

`string`

- minimum length: 1 characters

## Name

`Name`

- is optional
- type: `string`
- defined in this schema

### Name type

`string`, nullable

## NamespaceId

`NamespaceId`

- is optional
- type: `string`
- defined in this schema

### NamespaceId type

`string`, nullable

## Password

`Password`

- is optional
- type: `string`
- defined in this schema

### Password type

`string`, nullable

## StreamPrefix

`StreamPrefix`

- is optional
- type: `string`
- defined in this schema

### StreamPrefix type

`string`, nullable

## TypePrefix

`TypePrefix`

- is optional
- type: `string`
- defined in this schema

### TypePrefix type

`string`, nullable

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

| Property          | Type    | Required     |
| ----------------- | ------- | ------------ |
| `Backfill`        | boolean | Optional     |
| `ClientId`        | string  | Optional     |
| `ClientSecret`    | string  | Optional     |
| `DebugExpiration` | string  | Optional     |
| `Description`     | string  | Optional     |
| `EgressFilter`    | string  | Optional     |
| `Enabled`         | boolean | Optional     |
| `Endpoint`        | string  | **Required** |
| `ExecutionPeriod` | string  | **Required** |
| `Id`              | string  | **Required** |
| `Name`            | string  | Optional     |
| `NamespaceId`     | string  | Optional     |
| `Password`        | string  | Optional     |
| `StreamPrefix`    | string  | Optional     |
| `TypePrefix`      | string  | Optional     |
| `UserName`        | string  | Optional     |

#### Backfill

`Backfill`

- is optional
- type: `boolean`

##### Backfill type

`boolean`

#### ClientId

`ClientId`

- is optional
- type: `string`

##### ClientId type

`string`, nullable

#### ClientSecret

`ClientSecret`

- is optional
- type: `string`

##### ClientSecret type

`string`, nullable

#### DebugExpiration

`DebugExpiration`

- is optional
- type: `string`

##### DebugExpiration type

`string`, nullable

- format: `date-time` – date and time (according to [RFC 3339, section 5.6](http://tools.ietf.org/html/rfc3339))

#### Description

`Description`

- is optional
- type: `string`

##### Description type

`string`, nullable

#### EgressFilter

`EgressFilter`

- is optional
- type: `string`

##### EgressFilter type

`string`, nullable

#### Enabled

`Enabled`

- is optional
- type: `boolean`

##### Enabled type

`boolean`

#### Endpoint

`Endpoint`

- is **required**
- type: `string`

##### Endpoint type

`string`

- minimum length: 1 characters

#### ExecutionPeriod

`ExecutionPeriod`

- is **required**
- type: `string`

##### ExecutionPeriod type

`string`

- minimum length: 1 characters

#### Id

`Id`

- is **required**
- type: `string`

##### Id type

`string`

- minimum length: 1 characters

#### Name

`Name`

- is optional
- type: `string`

##### Name type

`string`, nullable

#### NamespaceId

`NamespaceId`

- is optional
- type: `string`

##### NamespaceId type

`string`, nullable

#### Password

`Password`

- is optional
- type: `string`

##### Password type

`string`, nullable

#### StreamPrefix

`StreamPrefix`

- is optional
- type: `string`

##### StreamPrefix type

`string`, nullable

#### TypePrefix

`TypePrefix`

- is optional
- type: `string`

##### TypePrefix type

`string`, nullable

#### UserName

`UserName`

- is optional
- type: `string`

##### UserName type

`string`, nullable
