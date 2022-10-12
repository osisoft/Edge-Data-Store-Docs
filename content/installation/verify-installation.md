---
uid: VerifyInstallation
---

# Verify installation

Depending on the device capabilities, it may take some time before the Edge Data Store is fully initialized and running for the first time. Allow time for start up before verifying that Edge Data Store is correctly installed.

To verify the Edge Data Store installation, follow these steps.

1. Open a terminal window and run the following command, replacing `<port_number>` with the port number specified during installation:

  ```bash
  curl http://localhost:<port_number>/api/v1/configuration
  ```

1. If you receive an error, wait a few seconds and try the script again. If the installation was successful, a JSON copy of the default system configuration is returned:

  ```json
{
    "Storage": {
        "EgressEndpoints": [],
        "Schedules": [],
        "DataSelectors": [],
        "EgressConfigurations": [],
        "Runtime": {
            "streamStorageLimitMb": 2,
            "streamStorageTargetMb": 1,
            "ingressDebugExpiration": "0001-01-01T00:00:00",
            "checkpointRateInSec": 30,
            "transactionLogLimitMB": 250,
            "enableMetrics": false
        },
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        }
    },
    "System": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "HealthEndpoints": [],
        "Components": [
            {
                "componentId": "Storage",
                "componentType": "Storage"
            }
        ],
        "Buffering": {
            "bufferLocation": "C:/ProgramData/OSIsoft/EdgeDataStore/Buffers",
            "maxBufferSizeMB": 1024,
            "enablePersistentBuffering": true
        },
        "General": {
            "enableDiagnostics": true,
            "metadataLevel": "Medium",
            "healthPrefix": null
        }
    }
}
  ```
