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

# Modbus TCP data selection configuration schema

The Modbus TCP data selection configuration schema specifies how to formally describe the data selection parameters for Modbus TCP.

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                                           |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Modbus_DataSelection_schema.json](Modbus_DataSelection_schema.json) | 

# Modbus TCP data selection configuration properties

| Property                              | Type      | Required | Nullable | Defined by                               |
| ------------------------------------- | --------- | -------- | -------- | ---------------------------------------- |
| [BitMap](#bitmap)                     | `string`  | Optional | Yes      | DataSelectionConfiguration (this schema) |
| [ConversionFactor](#conversionfactor) | `number`  | Optional | Yes      | DataSelectionConfiguration (this schema) |
| [ConversionOffset](#conversionoffset) | `number`  | Optional | Yes      | DataSelectionConfiguration (this schema) |
| [DataTypeCode](#datatypecode)         | `integer` | Optional | No       | DataSelectionConfiguration (this schema) |
| [Name](#name)                         | `string`  | Optional | Yes      | DataSelectionConfiguration (this schema) |
| [RegisterOffset](#registeroffset)     | `integer` | Optional | No       | DataSelectionConfiguration (this schema) |
| [RegisterType](#registertype)         | reference | Optional | No       | DataSelectionConfiguration (this schema) |
| [ScanRate](#scanrate)                 | `integer` | Optional | No       | DataSelectionConfiguration (this schema) |
| [Selected](#selected)                 | `boolean` | Optional | No       | DataSelectionConfiguration (this schema) |
| [StreamId](#streamid)                 | `string`  | Optional | Yes      | DataSelectionConfiguration (this schema) |
| [UnitId](#unitid)                     | `integer` | Optional | No       | DataSelectionConfiguration (this schema) |



**Note:** All of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

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
