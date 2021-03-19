---
uid: storage_schema
---

# Sample Storage configuration

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

# Storage configuration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| Runtime         | `StorageRuntimeConfiguration` | Optional | Yes      | StorageRuntimeConfiguration |
| Logging | `StorageLoggingConfiguration`| Optional | Yes      | StorageLoggingConfiguration |
| PeriodicEgressEndpoints | `[PeriodicEgressEndpointsConfiguration]` | Optional | Yes      | PeriodicEgressEndpointsConfiguration |
