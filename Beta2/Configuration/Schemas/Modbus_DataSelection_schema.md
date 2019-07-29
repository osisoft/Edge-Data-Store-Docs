---
uid: modbus_DataSelection_schema
---

# Sample Modbus Data Selection Configuration

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

# Modbus DataSelectionConfiguration schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                                           |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Modbus_DataSelection_schema.json](Modbus_DataSelection_schema.json) |

# DataSelectionConfiguration properties

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

## BitMap

`BitMap`

- is optional
- type: `string`
- defined in this schema

### BitMap type

`string`, nullable

## ConversionFactor

`ConversionFactor`

- is optional
- type: `number`
- defined in this schema

### ConversionFactor type

`number`, nullable

## ConversionOffset

`ConversionOffset`

- is optional
- type: `number`
- defined in this schema

### ConversionOffset type

`number`, nullable

## DataTypeCode

`DataTypeCode`

- is optional
- type: `integer`
- defined in this schema

### DataTypeCode type

`integer`

## Name

`Name`

- is optional
- type: `string`
- defined in this schema

### Name type

`string`, nullable

## RegisterOffset

`RegisterOffset`

- is optional
- type: `integer`
- defined in this schema

### RegisterOffset type

`integer`

## RegisterType

`RegisterType`

- is optional
- type: reference
- defined in this schema

### RegisterType type

- []() – `#/definitions/ModbusRegisterType`

## ScanRate

`ScanRate`

- is optional
- type: `integer`
- defined in this schema

### ScanRate type

`integer`

## Selected

`Selected`

- is optional
- type: `boolean`
- defined in this schema

### Selected type

`boolean`

## StreamId

`StreamId`

- is optional
- type: `string`
- defined in this schema

### StreamId type

`string`, nullable

## UnitId

`UnitId`

- is optional
- type: `integer`
- defined in this schema

### UnitId type

`integer`

**All** of the following _requirements_ need to be fulfilled.

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

#### BitMap

`BitMap`

- is optional
- type: `string`

##### BitMap type

`string`, nullable

#### ConversionFactor

`ConversionFactor`

- is optional
- type: `number`

##### ConversionFactor type

`number`, nullable

#### ConversionOffset

`ConversionOffset`

- is optional
- type: `number`

##### ConversionOffset type

`number`, nullable

#### DataTypeCode

`DataTypeCode`

- is optional
- type: `integer`

##### DataTypeCode type

`integer`

#### Name

`Name`

- is optional
- type: `string`

##### Name type

`string`, nullable

#### RegisterOffset

`RegisterOffset`

- is optional
- type: `integer`

##### RegisterOffset type

`integer`

#### RegisterType

`RegisterType`

- is optional
- type: reference

##### RegisterType type

- []() – `#/definitions/ModbusRegisterType`

#### ScanRate

`ScanRate`

- is optional
- type: `integer`

##### ScanRate type

`integer`

#### Selected

`Selected`

- is optional
- type: `boolean`

##### Selected type

`boolean`

#### StreamId

`StreamId`

- is optional
- type: `string`

##### StreamId type

`string`, nullable

#### UnitId

`UnitId`

- is optional
- type: `integer`

##### UnitId type

`integer`
