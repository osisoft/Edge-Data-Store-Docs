---
uid: edge_system_schema
---

# EdgeSystemConfiguration Schema

```

```

# Edge System Configuration Schema

## Properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [Storage](#storage)         | [`StorageConfiguration`](xref:storage_schema) | Optional | Yes      | StorageConfiguration |
| [System](#system) | [`SystemConfiguration`](xref:system_schema) | Optional | Yes      | SystemConfiguration |
| [{ComponentName}](#system) | [`{ComponentConfiguration}`](#system) | Optional | Yes      | {ComponentConfiguration} |

## Storage

- is optional
- type: [`StorageConfiguration`](xref:storage_schema)

## System

- is optional
- type: [`SystemConfiguration`](xref:system_schema)

## {ComponentName}
- The name of the component is configured at configuration time as determined by [System](#system)[.]()[Components](xref:system_schema#components)
- is optional
- type: depends on component.  One of: [`ModbusConfiguration`](xref:modbus_schema), [`OpcUaConfiguration`](xref:opcua_schema)

