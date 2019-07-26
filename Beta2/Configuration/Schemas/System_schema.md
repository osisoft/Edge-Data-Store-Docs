---
uid: system_schema
---

# SystemConfiguration Schema

```

```

| Abstract            | Extensible | Status       | Identifiable | Custom Properties | Additional Properties | Defined In                                               |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Modbus_Logging_schema.json](Modbus_Logging_schema.json) |

## Properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [Logging](#logging)         | [`SystemLoggingConfiguration`](xref:system_Logging_schema) | Optional | Yes      | EdgeLoggerConfiguration |
| [Components](#components) | [`[SystemComponentsConfiguration]`](xref:system_Components_schema) | Optional | Yes      | ComponentsConfiguration |
| [HealthEndpoints](#healthEndpoints) | [`[SystemHealthEndpointsConfiguration]`](xref:system_HealthEndpoints_schema) | Optional | Yes      | HealthEndpointsConfiguration |
| [Port](#port) | [`SystemPortConfiguration`](xref:portschema) | Optional | Yes      | PortConfiguration |

## Logging

- is optional
- type: [`SystemLoggingConfiguration`](xref:system_Logging_schema)

## Components

- is optional
- type: [`[SystemComponentsConfiguration]`](xref:system_Components_schema)

## HealthEndpoints

- is optional
- type: [`[SystemHealthEndpointsConfiguration]`](xref:system_HealthEndpoints_schema)

## Port

- is optional
- type: [`SystemPortConfiguration`](xref:portschema)

