---
uid: storage_schema
---

# StorageConfiguration schema

```json
  "Storage": {
        "Runtime": {
            "streamStorageLimitMb": 2,
            "streamStorageTargetMb": 1,
            "ingressDebugExpiration": "0001-01-01T00:00:00"
        },
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "PeriodicEgressEndpoints": []
    }
```

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                               |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Modbus_Logging_schema.json](Modbus_Logging_schema.json) |

## Properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| [Runtime](#runtime)         | [`StorageRuntimeConfiguration`](xref:storage_Runtime_schema) | Optional | Yes      | StorageRuntimeConfiguration |
| [Logging](#logging) | [`StorageLoggingConfiguration`](xref:Storage_Logging_schema) | Optional | Yes      | StorageLoggingConfiguration |
| [PeriodicEgressEndpoints](#periodicegressendpoints) | [`[PeriodicEgressEndpointsConfiguration]`](xref:storage_PeriodicEgressEndpoints_schema) | Optional | Yes      | PeriodicEgressEndpointsConfiguration |

## Runtime

- is optional
- type: [`StorageRuntimeConfiguration`](xref:storage_Runtime_schema)

## Logging

- is optional
- type: [`StorageLoggingConfiguration`](xref:Storage_Logging_schema)

## PeriodicEgressEndpoints

- is optional
- type: [`[PeriodicEgressEndpointsConfiguration]`](xref:storage_PeriodicEgressEndpoints_schema)
