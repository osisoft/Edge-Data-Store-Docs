---
uid: system_Logging_schema
---

# System logging configuration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| LogFileCountLimit         | `integer` | Optional | Yes      | EdgeLoggerConfiguration (this schema) |
| LogFileSizeLimitBytes | `integer` | Optional | Yes      | EdgeLoggerConfiguration (this schema) |
| LogLevel                          | reference <br> `#/definitions/EdgeLogLevel` | Optional | No       | EdgeLoggerConfiguration (this schema) |


**Note:** All of the following _requirements_ need to be fulfilled.

## Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

## Requirement 2

`object` with following properties:

| Property                | Type    | Required |
| ----------------------- | ------- | -------- |
| `LogFileCountLimit`     | integer | Optional |
| `LogFileSizeLimitBytes` | integer | Optional |
| `LogLevel`              | reference <br> `#/definitions/EdgeLogLevel`| Optional |
