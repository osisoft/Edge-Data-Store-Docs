---
uid: modbus_DataSource_schema
---

# Sample Modbus TCP data source configuration

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

# DataSourceConfiguration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| ConnectTimeout               | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| DelayBetweenRequests | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| IpAddress                       | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| MaxResponseDataLength | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| Port                                  | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| ReconnectInterval        | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| RequestTimeout              | `integer` | Optional | No       | DataSourceConfiguration (this schema) |
| StreamIdPrefix              | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |


**Note:** All of the following _requirements_ need to be fulfilled.

## Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

## Requirement 2

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
