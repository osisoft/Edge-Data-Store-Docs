---
uid: modbus_schema
---

# ModbusConfiguration Schema

```

```

| Abstract            | Extensible | Status       | Identifiable | Custom Properties | Additional Properties | Defined In                                               |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Modbus_Logging_schema.json](Modbus_Logging_schema.json) |

## Properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [Logging](#logging)         | [`ModbusLoggingConfiguration`](xref:modbus_Logging_schema) | Optional | Yes      | EdgeLoggerConfiguration |
| [DataSource](#datasource) | [`DataSourceConfiguration`](xref:modbus_DataSource_schema) | Optional | Yes      | ComponentsConfiguration |
| [DataSelection](#dataselection) | [`[ModbusDataSelectionConfiguration]`](xref:modbus_DataSelection_schema) | Optional | Yes      | DataSelectionConfiguration |

## Logging

- is optional
- type: [`SystemLoggingConfiguration`](xref:system_Logging_schema)

## DataSource

- is optional
- type: [`DataSourceConfiguration`](xref:modbus_DataSource_schema)

## DataSelection

- is optional
- type: [`[ModbusDataSelectionConfiguration]`](xref:modbus_DataSelection_schema)

