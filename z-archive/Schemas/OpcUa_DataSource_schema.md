---
uid: opcUa_DataSource_Schema
---


# Sample OPC UA data source configuration

The OPC UA data source configuration schema specifies how to formally describe the data source parameters for OPC UA.

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

# OPC UA data source configuration properties

| Property                                    | Type      | Required | Nullable | Defined by                            |
| ------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| EndpointUrl                | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| IncomingTimestamp     | reference | Optional | No       | DataSourceConfiguration (this schema) |
| Password                       | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| RootNodeIds                 | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| StreamIdPrefix          | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |
| UseSecureConnection | `boolean` | Optional | No       | DataSourceConfiguration (this schema) |
| UserName                      | `string`  | Optional | Yes      | DataSourceConfiguration (this schema) |


**Note:** All of the following _requirements_ need to be fulfilled.

## Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

## Requirement 2

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
