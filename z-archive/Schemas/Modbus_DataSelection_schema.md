---
uid: modbus_DataSelection_schema
---

# Sample Modbus TCP data selection configuration

```json
[{
        "Selected": "true",
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 1,
        "DataTypeCode": 20,
        "BitMap": "16151413",
        "ConversionFactor": 2,
        "ConversionOffset": 3.4,
        "ScanRate": 500
    },
    {
        "Selected": "true",
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 2,
        "DataTypeCode": 20,
        "BitMap": "16151413",
        "ConversionFactor": 2,
        "ConversionOffset": 3.4,
        "ScanRate": 500
    },
    {
        "Selected": "true",
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 3,
        "DataTypeCode": 20,
        "BitMap": "16151413",
        "ConversionFactor": 2,
        "ConversionOffset": 3.4,
        "ScanRate": 500
    },
    {
        "Selected": "true",
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 4,
        "DataTypeCode": 20,
        "BitMap": "16151413",
        "ConversionFactor": 2,
        "ConversionOffset": 3.4,
        "ScanRate": 500
    },
    {
        "Selected": "true",
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 5,
        "DataTypeCode": 20,
        "BitMap": "16151413",
        "ConversionFactor": 2,
        "ConversionOffset": 3.4,
        "ScanRate": 500
    }
]
```

# Modbus TCP data selection configuration properties

| Property                              | Type      | Required | Nullable | Defined by                               |
| ------------------------------------- | --------- | -------- | -------- | ---------------------------------------- |
| BitMap                    | `string`  | Optional | Yes      | DataSelectionConfiguration (this schema) |
| ConversionFactor | `number`  | Optional | Yes      | DataSelectionConfiguration (this schema) |
| ConversionOffset | `number`  | Optional | Yes      | DataSelectionConfiguration (this schema) |
| DataTypeCode       | `integer` | Optional | No       | DataSelectionConfiguration (this schema) |
| Name                         | `string`  | Optional | Yes      | DataSelectionConfiguration (this schema) |
| RegisterOffset    | `integer` | Optional | No       | DataSelectionConfiguration (this schema) |
| RegisterType        | reference <br> `#/definitions/ModbusRegisterType`| Optional | No       | DataSelectionConfiguration (this schema) |
| ScanRate                | `integer` | Optional | No       | DataSelectionConfiguration (this schema) |
| Selected                | `boolean` | Optional | No       | DataSelectionConfiguration (this schema) |
| StreamId                | `string`  | Optional | Yes      | DataSelectionConfiguration (this schema) |
| UnitId                    | `integer` | Optional | No       | DataSelectionConfiguration (this schema) |



**Note:** All of the following _requirements_ need to be fulfilled.

## Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

## Requirement 2

`object` with following properties:

| Property           | Type    | Required |
| ------------------ | ------- | -------- |
| `BitMap`           | string  | Optional |
| `ConversionFactor` | number  | Optional |
| `ConversionOffset` | number  | Optional |
| `DataTypeCode`     | integer | Optional |
| `Name`             | string  | Optional |
| `RegisterOffset`   | integer | Optional |
| `RegisterType`     |         | Optional |
| `ScanRate`         | integer | Optional |
| `Selected`         | boolean | Optional |
| `StreamId`         | string  | Optional |
| `UnitId`           | integer | Optional |
