---
uid: edgeSystemConfiguration
---

# Edge System configuration
You use JSON files stored in a protected directory on Linux or Windows to configure Edge System. While the files are accessible to view, it is recommended that you use REST for any changes you make to the files. As part of making Edge System as secure as possible, any passwords or secrets that are configured will be stored in encrypted form (with cryptographic key material stored separately in a secure location.) If the files are edited directly, the system may not work as expected. Configuration of the system can also be accomplished using the command line if desired, but since REST is the primary means of interacting with Edge Storage functionality, REST is the recommended technique for configuring the system.

**Note:** It is possible to edit any single component or facet of the system using REST, but it is also possible to configure the system as a whole with a single REST call.

## System configuration
The following JSON file represents minimal configuration of an Edge System. There are no Modbus or Opc Ua components, and the Storage component configurations are set to the default. If a system were configured with this JSON file, any existing Modbus or Opc Ua components would be disabled and removed. No storage data would be deleted or modified, and OMF and SDS data access would not be impacted.

```json
{
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
    },
    "System": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "Components": [
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
}
```

When the following curl command is run, this will be set as the configuration of a running Edge System:

```bash
curl -i -d "@EdgeMinimumConfiguration.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration
```

The configuration takes effect immediately after the command completes.

Full JSON definition of configuration parameters:
[Edge System Configuration](xref:edge_system_schema)

