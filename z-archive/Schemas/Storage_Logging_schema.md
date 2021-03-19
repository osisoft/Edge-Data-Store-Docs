---
uid: Storage_Logging_schema
---

# Storage logging configuration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| LogFileCountLimit         | `integer` | Optional | Yes      | EdgeLoggerConfiguration (this schema) |
| LogFileSizeLimitBytes | `integer` | Optional | Yes      | EdgeLoggerConfiguration (this schema) |
| LogLevel                          | reference | Optional | No       | EdgeLoggerConfiguration (this schema) |


**Note:** All of the following _requirements_ need to be fulfilled.

## Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

## Requirement 2

`object` with following properties:

| Property                | Type    | Required |
| ----------------------- | ------- | -------- |
| `LogFileCountLimit`     | integer | Optional |
| `LogFileSizeLimitBytes` | integer | Optional |
| `LogLevel`              |         | Optional |
