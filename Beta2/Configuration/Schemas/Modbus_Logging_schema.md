---
uid: modbus_Logging_schema
---

# ModbusLoggerConfiguration Schema

```

```

| Abstract            | Extensible | Status       | Identifiable | Custom Properties | Additional Properties | Defined In                                               |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Modbus_Logging_schema.json](Modbus_Logging_schema.json) |

# ModbusLoggerConfiguration Properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [LogFileCountLimit](#logfilecountlimit)         | `integer` | Optional | Yes      | EdgeLoggerConfiguration (this schema) |
| [LogFileSizeLimitBytes](#logfilesizelimitbytes) | `integer` | Optional | Yes      | EdgeLoggerConfiguration (this schema) |
| [LogLevel](#loglevel)                           | reference | Optional | No       | EdgeLoggerConfiguration (this schema) |

## LogFileCountLimit

`LogFileCountLimit`

- is optional
- type: `integer`
- defined in this schema

### LogFileCountLimit Type

`integer`, nullable

## LogFileSizeLimitBytes

`LogFileSizeLimitBytes`

- is optional
- type: `integer`
- defined in this schema

### LogFileSizeLimitBytes Type

`integer`, nullable

## LogLevel

`LogLevel`

- is optional
- type: reference
- defined in this schema

### LogLevel Type

- []() – `#/definitions/EdgeLogLevel`

**All** of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property                | Type    | Required |
| ----------------------- | ------- | -------- |
| `LogFileCountLimit`     | integer | Optional |
| `LogFileSizeLimitBytes` | integer | Optional |
| `LogLevel`              |         | Optional |

#### LogFileCountLimit

`LogFileCountLimit`

- is optional
- type: `integer`

##### LogFileCountLimit Type

`integer`, nullable

#### LogFileSizeLimitBytes

`LogFileSizeLimitBytes`

- is optional
- type: `integer`

##### LogFileSizeLimitBytes Type

`integer`, nullable

#### LogLevel

`LogLevel`

- is optional
- type: reference

##### LogLevel Type

- []() – `#/definitions/EdgeLogLevel`
