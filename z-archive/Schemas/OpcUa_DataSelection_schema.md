---
uid: opcUa_DataSelection_schema
---

# Sample OPC UA data selection configuration

The OPC UA data selection configuration schema specifies how to formally describe the data selection parameters for OPC UA.

```json
[{
        "Selected": true,
        "Name": "Cold Side Inlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideInletTemperature",
        "StreamId": null
    },
    {
        "Selected": true,
        "Name": "Hot Side Inlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideInletTemperature",
        "StreamId": null
    },
    {
        "Selected": true,
        "Name": "Hot Side Outlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideOutletTemperature",
        "StreamId": null
    },
    {
        "Selected": true,
        "Name": "Cold Side Inlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideInletTemperature",
        "StreamId": null
    },
    {
        "Selected": true,
        "Name": "Hot Side Outlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideOutletTemperature",
        "StreamId": null
    }
]
```

# OPC UA data selection configuration properties

| Property              | Type      | Required | Nullable | Defined by                       |
| --------------------- | --------- | -------- | -------- | -------------------------------- |
| Name         | `string`  | Optional | Yes      | DataCollectionItem (this schema) |
| NodeId     | `string`  | Optional | Yes      | DataCollectionItem (this schema) |
| Selected | `boolean` | Optional | No       | DataCollectionItem (this schema) |
| StreamId | `string`  | Optional | Yes      | DataCollectionItem (this schema) |



**Note:** All of the following _requirements_ need to be fulfilled.

## Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

## Requirement 2

`object` with following properties:

| Property   | Type    | Required |
| ---------- | ------- | -------- |
| `Name`     | string  | Optional |
| `NodeId`   | string  | Optional |
| `Selected` | boolean | Optional |
| `StreamId` | string  | Optional |
