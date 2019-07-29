---
uid: opcUa_DataSelection_schema
---

# Sample Opc Ua Data Selection Configuration

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

```

# OPC UA data collection item schema

| Abstract            | Extensible | Status       | Identifiable | Custom Properties | Additional Properties | Defined in                                                         |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | ------------------------------------------------------------------ |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [OpcUa_DataSelection_schema.json](OpcUa_DataSelection_schema.json) |

# DataCollectionItem properties

| Property              | Type      | Required | Nullable | Defined by                       |
| --------------------- | --------- | -------- | -------- | -------------------------------- |
| [Name](#name)         | `string`  | Optional | Yes      | DataCollectionItem (this schema) |
| [NodeId](#nodeid)     | `string`  | Optional | Yes      | DataCollectionItem (this schema) |
| [Selected](#selected) | `boolean` | Optional | No       | DataCollectionItem (this schema) |
| [StreamId](#streamid) | `string`  | Optional | Yes      | DataCollectionItem (this schema) |

## Name

`Name`

- is optional
- type: `string`
- defined in this schema

### Name type

`string`, nullable

## NodeId

`NodeId`

- is optional
- type: `string`
- defined in this schema

### NodeId Type

`string`, nullable

## Selected

`Selected`

- is optional
- type: `boolean`
- defined in this schema

### Selected Type

`boolean`

## StreamId

`StreamId`

- is optional
- type: `string`
- defined in this schema

### StreamId Type

`string`, nullable

**All** of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property   | Type    | Required |
| ---------- | ------- | -------- |
| `Name`     | string  | Optional |
| `NodeId`   | string  | Optional |
| `Selected` | boolean | Optional |
| `StreamId` | string  | Optional |

#### Name

`Name`

- is optional
- type: `string`

##### Name Type

`string`, nullable

#### NodeId

`NodeId`

- is optional
- type: `string`

##### NodeId Type

`string`, nullable

#### Selected

`Selected`

- is optional
- type: `boolean`

##### Selected Type

`boolean`

#### StreamId

`StreamId`

- is optional
- type: `string`

##### StreamId Type

`string`, nullable
