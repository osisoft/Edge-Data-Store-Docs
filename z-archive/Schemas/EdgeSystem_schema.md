---
uid: edge_system_schema
---

# Sample Edge Data Store configuration

The Edge Data Store configuration schema specifies how to formally describe the system parameters (logging, components, health endpoints, port). 

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

# Edge Data Store configuration properties

| Property                                        | Type      | Required | Nullable | Defined by                            |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------------- |
| Storage         | StorageConfiguration | Optional | Yes      | StorageConfiguration |
| System | SystemConfiguration | Optional | Yes      | SystemConfiguration |
| {ComponentName} | `{ComponentConfiguration}` | Optional | Yes      | {ComponentConfiguration} |

