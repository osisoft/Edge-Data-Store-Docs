---
uid: VerifyInstallation
---

# Verify installation

Depending on the device capabilities, it may take some time before the Edge Data Store is fully initialized and running for the first time. After allowing time for start up, use the following steps to verify that Edge Data Store is correctly installed. 

1. Open a terminal window and run the following command, replacing _<port_number>_ with the port number specified during installation:

    ```bash
    curl http://localhost:<port_number>/api/v1/configuration
    ```

2. If you receive an error, wait a few seconds and try the script again. If the installation was successful, a JSON copy of the default system configuration is returned:

    ```json
        {
        "Storage": {
            "PeriodicEgressEndpoints": [],
            "Runtime": {
            "streamStorageLimitMb": 2,
            "streamStorageTargetMb": 1,
            "ingressDebugExpiration": "0001-01-01T00:00:00",
            "checkpointRateInSec": 30,
            "transactionLogLimitMB": 250,
            "enableTransactionLog": true
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
            "Port": {
            "port": 5590
            },
            "Components": [
            {
                "componentId": "Storage",
                "componentType": "EDS.Component"
            }
            ]
        }
        }
    ```
