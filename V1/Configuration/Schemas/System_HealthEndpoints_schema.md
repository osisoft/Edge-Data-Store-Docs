---
uid: system_HealthEndpoints_schema
---

# OMF health endpoint configuration schema

```json
[{
        "endpoint": "https://<pi web api server>/piwebapi/omf/",
        "UserName": "<username>",
        "Password": "<password>",
        "buffering": 0,
        "maxBufferSizeMB": 0
    },
    {
        "Endpoint": "https://<OCS OMF endpoint>",
        "ClientId": "<clientid>",
        "ClientSecret": "<clientsecret>",
        "buffering": 0,
        "maxBufferSizeMB": 0
    }
]
```

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                                               |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [System_HealthEndpoints_schema.json](System_HealthEndpoints_schema.json) |

# OmfHealthEndpointConfiguration properties

| Property                                                    | Type      | Required | Nullable | Defined by                                   |
| ----------------------------------------------------------- | --------- | -------- | -------- | -------------------------------------------- |
| [Buffering](#buffering)                                     | reference | Optional | No       | OmfHealthEndpointConfiguration (this schema) |
| [ClientId](#clientid)                                       | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [ClientSecret](#clientsecret)                               | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [Endpoint](#endpoint)                                       | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [Id](#id)                                                   | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [MaxBufferSizeMB](#maxbuffersizemb)                         | `integer` | Optional | No       | OmfHealthEndpointConfiguration (this schema) |
| [Password](#password)                                       | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [UserName](#username)                                       | `string`  | Optional | Yes      | OmfHealthEndpointConfiguration (this schema) |
| [ValidateEndpointCertificate](#validateendpointcertificate) | `boolean` | Optional | No       | OmfHealthEndpointConfiguration (this schema) |

## Buffering

`Buffering`

- is optional
- type: reference
- defined in this schema

### Buffering type

- []() – `#/definitions/BufferType`

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

## Endpoint

`Endpoint`

- is optional
- type: `string`
- defined in this schema

### Endpoint type

`string`, nullable

## Id

`Id`

- is optional
- type: `string`
- defined in this schema

### Id type

`string`, nullable

## MaxBufferSizeMB

`MaxBufferSizeMB`

- is optional
- type: `integer`
- defined in this schema

### MaxBufferSizeMB type

`integer`

## Password

`Password`

- is optional
- type: `string`
- defined in this schema

### Password type

`string`, nullable

## UserName

`UserName`

- is optional
- type: `string`
- defined in this schema

### UserName type

`string`, nullable

## ValidateEndpointCertificate

`ValidateEndpointCertificate`

- is optional
- type: `boolean`
- defined in this schema

### ValidateEndpointCertificate type

`boolean`

**All** of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property                      | Type    | Required |
| ----------------------------- | ------- | -------- |
| `Buffering`                   |         | Optional |
| `ClientId`                    | string  | Optional |
| `ClientSecret`                | string  | Optional |
| `Endpoint`                    | string  | Optional |
| `Id`                          | string  | Optional |
| `MaxBufferSizeMB`             | integer | Optional |
| `Password`                    | string  | Optional |
| `UserName`                    | string  | Optional |
| `ValidateEndpointCertificate` | boolean | Optional |

#### Buffering

`Buffering`

- is optional
- type: reference

##### Buffering type

- []() – `#/definitions/BufferType`

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

#### Endpoint

`Endpoint`

- is optional
- type: `string`

##### Endpoint type

`string`, nullable

#### Id

`Id`

- is optional
- type: `string`

##### Id type

`string`, nullable

#### MaxBufferSizeMB

`MaxBufferSizeMB`

- is optional
- type: `integer`

##### MaxBufferSizeMB type

`integer`

#### Password

`Password`

- is optional
- type: `string`

##### Password type

`string`, nullable

#### UserName

`UserName`

- is optional
- type: `string`

##### UserName type

`string`, nullable

#### ValidateEndpointCertificate

`ValidateEndpointCertificate`

- is optional
- type: `boolean`

##### ValidateEndpointCertificate type

`boolean`
