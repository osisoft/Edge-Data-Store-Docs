---
uid: VerifyInstallation
---

# Verify installation

You can verify that Edge Data Store is correctly installed.

- Run the following script from the terminal window.

    ```bash
    curl http://localhost:5590/api/v1/configuration
    ```

    Depending upon the processor, memory, and storage, it may take the system a few seconds to start up.

    If the installation was successful, a JSON copy of the default system configuration will be returned:

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

    If you receive an error, wait a few seconds and try it again. On a device with limited processor, memory, and slow storage, it may take some time before the Edge Data Store is fully initialized and running for the first time.
