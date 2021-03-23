---
uid: system_schema
---

# Sample system configuration

```json
   "System": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "Components": [{
                "componentId": "OpcUa1",
                "componentType": "OpcUa"
            },
            {
                "componentId": "Modbus1",
                "componentType": "Modbus"
            },
            {
                "componentId": "Storage",
                "componentType": "EDS.Component"
            }
        ],
        "HealthEndpoints": [],
        "Port": {
            "port": 5590
        }
    }
```

# System configuration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| Logging        | `SystemLoggingConfiguration` | Optional | Yes      | EdgeLoggerConfiguration |
| Components | `[SystemComponentsConfiguration]` | Optional | Yes      | ComponentsConfiguration |
| HealthEndpoints | `[SystemHealthEndpointsConfiguration]` | Optional | Yes      | HealthEndpointsConfiguration |
| Port | `SystemPortConfiguration` | Optional | Yes      | PortConfiguration |
