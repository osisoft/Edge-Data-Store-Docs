---
uid: EdgeDataStoreConfiguration
---

# Edge Data Store configuration

Edge Data Store requires configuration, which can be performed either for each individual component or for the system as a whole. Use the following procedures to configure Edge Data Store as a whole system with either a minimum or a maximum configuration.

## Configure minimum Edge Data Store

The following JSON file represents the minimal configuration of an Edge Data Store. There are no Modbus TCP EDS adapter or OPC UA EDS adapter components and the Storage component configurations are set to the default. If you configure a system with this JSON file, any existing Modbus TCP EDS adapter or OPC UA EDS adapter components are disabled and removed. No storage data is deleted or modified and OMF and SDS data access is not impacted.

1. Save or copy the example JSON in a file named `EdgeMinimumConfiguration.json` in any directory on a device with Edge Data Store installed.

1. Run the following curl command from the directory where the file is located:

  ```bash
  curl -d "@EdgeMinimumConfiguration.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration
  ```

  The following will be set as the configuration of a running Edge Data Store. The configuration takes effect immediately after the command completes.

  ```json
    {
        "Storage": {
            "EgressEndpoints": [],
            "Schedules": [],
            "DataSelectors": [],
            "EgressConfigurations": [],
            "Egresses": [],
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

This example results in a minimal configuration of Edge Data Store. It only supports OMF and SDS operations using REST. No egress is configured, so no data is sent to either AVEVA Data Hub or PI Web API.

## Configure maximum Edge Data Store

The following JSON file represents maximum configuration of an Edge Data Store. There are Modbus TCP EDS adapter components and OPC UA EDS adapter components, and egress is configured to send to both PI Web API and AVEVA Data Hub from both the default (operational data) and diagnostics (diagnostic data) namespace.

1. Using any text editor, create a JSON file using the following example. Fill in any credentials or IP addresses with appropriate values for your environment.
   
2. Save the edited JSON in a file named `EdgeMaximumConfiguration.json` in any directory.
   
3. Run the following curl command from the same directory where the file is located:

  ```bash
  curl -d "@EdgeMaximumConfiguration.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration
  ```

  The following will be set as the configuration for the running Edge Data Store. The configuration takes effect immediately after the command completes.

  ```json
  {
    "Modbus1": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "DataSource": {
            "devices": [
                {
                    "id": "Device",
                    "ipAddress": "<Modbus IP address>",
                    "port": 502
                }
            ],
            "simultaneousRequests": 1,
            "maxResponseDataLength": 250,
            "connectTimeout": "0:00:15",
            "reconnectInterval": "0:00:05",
            "requestTimeout": "0:00:09",
            "delayBetweenRequests": "0:00:00",
            "streamIdPrefix": null,
            "defaultStreamIdPattern": "{DeviceId}.{UnitId}.{RegisterType}.{RegisterOffset}"
        },
        "DataSelection": [
            {
                "deviceId": "Device",
                "scheduleId": "Schedule_500",
                "unitId": 1,
                "registerType": "Holding16",
                "registerOffset": 1,
                "dataTypeCode": 20,
                "bitMap": "16151413",
                "conversionFactor": 2,
                "conversionOffset": 3.4,
                "selected": true,
                "name": null,
                "streamId": null,
                "dataFilterId": null
            },
            {
                "deviceId": "Device",
                "scheduleId": "Schedule_500",
                "unitId": 1,
                "registerType": "Holding16",
                "registerOffset": 2,
                "dataTypeCode": 20,
                "bitMap": "16151413",
                "conversionFactor": 2,
                "conversionOffset": 3.4,
                "selected": true,
                "name": null,
                "streamId": null,
                "dataFilterId": null
            },
            {
                "deviceId": "Device",
                "scheduleId": "Schedule_500",
                "unitId": 1,
                "registerType": "Holding16",
                "registerOffset": 3,
                "dataTypeCode": 20,
                "bitMap": "16151413",
                "conversionFactor": 2,
                "conversionOffset": 3.4,
                "selected": true,
                "name": null,
                "streamId": null,
                "dataFilterId": null
            },
            {
                "deviceId": "Device",
                "scheduleId": "Schedule_500",
                "unitId": 1,
                "registerType": "Holding16",
                "registerOffset": 4,
                "dataTypeCode": 20,
                "bitMap": "16151413",
                "conversionFactor": 2,
                "conversionOffset": 3.4,
                "selected": true,
                "name": null,
                "streamId": null,
                "dataFilterId": null
            },
            {
                "deviceId": "Device",
                "scheduleId": "Schedule_500",
                "unitId": 1,
                "registerType": "Holding16",
                "registerOffset": 5,
                "dataTypeCode": 20,
                "bitMap": "16151413",
                "conversionFactor": 2,
                "conversionOffset": 3.4,
                "selected": true,
                "name": null,
                "streamId": null,
                "dataFilterId": null
            }
        ],
        "DataFilters": [
            {
                "id": "DuplicateData",
                "absoluteDeadband": 0,
                "percentChange": null,
                "expirationPeriod": "1:00:00"
            }
        ],
        "Schedules": [
            {
                "id": "Schedule_500",
                "period": "0:00:00.5",
                "offset": "0:00:00"
            }
        ]
    },
    "Storage": {
        "EgressEndpoints": [
            {
                "id": "Endpoint-AVEVA Data Hub",
                "endpoint": "<AVEVA Data Hub OMF URL for your tenant and namespace>",
                "userName": null,
                "password": null,
                "clientId": "<AVEVA Data Hub ClientId>",
                "clientSecret": "<AVEVA Data Hub ClientSecret>",
                "tokenEndpoint": null,
                "validateEndpointCertificate": true
            },
            {
                "id": "Endpoint-PWA",
                "endpoint": "https://<your PI Web API server>/piwebapi/omf/",
                "userName": "<username>",
                "password": "<password>",
                "clientId": null,
                "clientSecret": null,
                "tokenEndpoint": null,
                "validateEndpointCertificate": true
            }
        ],
        "Schedules": [
            {
                "id": "Schedule1",
                "period": "0:00:50",
                "startTime": null
            }
        ],
        "DataSelectors": [
            {
                "id": "DataSelector1",
                "streamFilter": "TypeId:TestType*",
                "absoluteDeadband": 5,
                "percentChange": null,
                "expirationPeriod": null
            }
        ],
        "EgressConfigurations": [
            {
                "id": "AVEVA Data Hub",
                "name": null,
                "description": null,
                "enabled": true,
                "endpointId": "Endpoint-AVEVA Data Hub",
                "scheduleId": "Schedule1",
                "dataSelectorIds": null,
                "namespaceId": "default",
                "backfill": false,
                "debugExpiration": null,
                "streamPrefix": "ChangeMe",
                "typePrefix": "ChangeMe"
            },
            {
                "id": "PWA",
                "name": null,
                "description": null,
                "enabled": true,
                "endpointId": "Endpoint-PWA",
                "scheduleId": "Schedule1",
                "dataSelectorIds": [
                    "DataSelector1"
                ],
                "namespaceId": "default",
                "backfill": false,
                "debugExpiration": null,
                "streamPrefix": "ChangeMe",
                "typePrefix": "ChangeMe"
            },
            {
                "id": "AVEVA Data HubDiag",
                "name": null,
                "description": null,
                "enabled": true,
                "endpointId": "Endpoint-AVEVA Data Hub",
                "scheduleId": "Schedule1",
                "dataSelectorIds": [
                    "DataSelector1"
                ],
                "namespaceId": "diagnostics",
                "backfill": false,
                "debugExpiration": null,
                "streamPrefix": "ChangeMe",
                "typePrefix": "ChangeMe"
            },
            {
                "id": "PWADiag",
                "name": null,
                "description": null,
                "enabled": true,
                "endpointId": "Endpoint-PWA",
                "scheduleId": "Schedule1",
                "dataSelectorIds": null,
                "namespaceId": "diagnostics",
                "backfill": false,
                "debugExpiration": null,
                "streamPrefix": "ChangeMe",
                "typePrefix": "ChangeMe"
            }
        ],
        "Egresses": [],
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
    "OpcUa1": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "DataSource": {
            "endpointUrl": "opc.tcp://<OPC UA server IP and port>/OSIsoftTestServer",
            "useSecureConnection": false,
            "userName": null,
            "password": null,
            "incomingTimestamp": "Source",
            "dataCollectionMode": "CurrentWithBackfill",
            "streamIdPrefix": "OpcUa",
            "defaultStreamIdPattern": "{NamespaceIndex}.{Identifier}"
        },
        "DataSelection": [
            {
                "nodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideInletTemperature",
                "selected": true,
                "name": "Cold Side Inlet Temperature",
                "streamId": "2.Line1.HeatExchanger1001.ColdSideInletTemperature",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideOutletTemperature",
                "selected": false,
                "name": "Cold Side Outlet Temperature",
                "streamId": "2.Line1.HeatExchanger1001.ColdSideOutletTemperature",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideInletTemperature",
                "selected": true,
                "name": "Hot Side Inlet Temperature",
                "streamId": "2.Line1.HeatExchanger1001.HotSideInletTemperature",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideOutletTemperature",
                "selected": true,
                "name": "Hot Side Outlet Temperature",
                "streamId": "2.Line1.HeatExchanger1001.HotSideOutletTemperature",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideInletTemperature",
                "selected": true,
                "name": "Cold Side Inlet Temperature",
                "streamId": "2.Line1.HeatExchanger1002.ColdSideInletTemperature",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideOutletTemperature",
                "selected": false,
                "name": "Cold Side Outlet Temperature",
                "streamId": "2.Line1.HeatExchanger1002.ColdSideOutletTemperature",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideInletTemperature",
                "selected": false,
                "name": "Hot Side Inlet Temperature",
                "streamId": "2.Line1.HeatExchanger1002.HotSideInletTemperature",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideOutletTemperature",
                "selected": true,
                "name": "Hot Side Outlet Temperature",
                "streamId": "2.Line1.HeatExchanger1002.HotSideOutletTemperature",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.SF_Pump_001.Power",
                "selected": false,
                "name": "Power",
                "streamId": "2.Line1.SF_Pump_001.Power",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.SF_Pump_001.Efficiency",
                "selected": false,
                "name": "Efficiency",
                "streamId": "2.Line1.SF_Pump_001.Efficiency",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.SF_Pump_001.Flowrate",
                "selected": false,
                "name": "Flowrate",
                "streamId": "2.Line1.SF_Pump_001.Flowrate",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.SF_Pump_002.Power",
                "selected": false,
                "name": "Power",
                "streamId": "2.Line1.SF_Pump_002.Power",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.SF_Pump_002.Efficiency",
                "selected": false,
                "name": "Efficiency",
                "streamId": "2.Line1.SF_Pump_002.Efficiency",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.SF_Pump_002.Flowrate",
                "selected": false,
                "name": "Flowrate",
                "streamId": "2.Line1.SF_Pump_002.Flowrate",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.Tank1.Level",
                "selected": false,
                "name": "Level",
                "streamId": "2.Line1.Tank1.Level",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.Tank1.Mass",
                "selected": false,
                "name": "Mass",
                "streamId": "2.Line1.Tank1.Mass",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.Tank1.Volume",
                "selected": false,
                "name": "Volume",
                "streamId": "2.Line1.Tank1.Volume",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.Tank2.Level",
                "selected": false,
                "name": "Level",
                "streamId": "2.Line1.Tank2.Level",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.Tank2.Mass",
                "selected": false,
                "name": "Mass",
                "streamId": "2.Line1.Tank2.Mass",
                "dataFilterId": null
            },
            {
                "nodeId": "ns=2;s=Line1.Tank2.Volume",
                "selected": false,
                "name": "Volume",
                "streamId": "2.Line1.Tank2.Volume",
                "dataFilterId": null
            }
        ],
        "DataFilters": [
            {
                "id": "DuplicateData",
                "absoluteDeadband": 0,
                "percentChange": null,
                "expirationPeriod": "1:00:00"
            }
        ],
        "IntervalsToRecover": [
            {
                "startTime": "2022-07-12T16:24:46.0546317Z",
                "endTime": null,
                "lastReadTime": null
            }
        ],
        "ClientSettings": {
            "maxBrowseReferencesToReturn": 0,
            "browseBlockSize": 10,
            "reconnectDelay": "0:00:30",
            "recreateSubscriptionDelay": "0:00:10",
            "readBlockSize": 1000,
            "sessionRequestTimeout": "0:02:00",
            "connectionTimeout": "0:00:30",
            "readTimeout": "0:00:30",
            "sessionAllowInsecureCredentials": false,
            "sessionMaxOperationsPerRequest": 1000,
            "browseTimeout": "0:01:00",
            "maxMonitoredItemsPerCall": 1000,
            "maxNotificationsPerPublish": 0,
            "publishingInterval": "0:00:01",
            "createMonitoredItemsTimeout": "0:00:30",
            "monitoredItemDataChangeTrigger": "StatusValue",
            "samplingInterval": "0:00:00.5",
            "monitoredItemQueueSize": 2,
            "maxInternalQueueSize": 500000,
            "historyReadBlockSize": 10,
            "historyReadTimeout": "0:01:00"
        },
        "Discoveries": [],
        "HistoryRecoveries": []
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
                "componentId": "OpcUa1",
                "componentType": "OpcUa"
            },
            {
                "componentId": "Modbus1",
                "componentType": "Modbus"
            },
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
