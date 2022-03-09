---
uid: PIAdapterForOPCUAConfigurationExamples
---

# Configuration examples

The following tables provide examples for all configurations available for PI Adapter for OPC UA.

**Note:** The examples in this topic are using the default port number `5590`. If you selected a different port number, replace it with that value.

## System components configuration with two OPC UA adapter instances

```json
[
    {
        "componentId": "OpcUa1",
        "componentType": "OpcUa"
    },
    {
        "componentId": "OpcUa2",
        "componentType": "OpcUa"
    },
    {
        "componentId": "OmfEgress",
        "componentType": "OmfEgress"
    }
]
```

## OPC UA adapter configuration

```json
{
    "OpcUa1": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "DataSource": {
            "endpointUrl": "opc.tcp://OPCUAServerEndpoint/OPCUA/Server",
            "useSecureConnection": false,
            "userName": null,
            "password": null,
            "incomingTimestamp": "Source",
            "streamIdPrefix": "OPC_Prefix_",
            "defaultStreamIdPattern": "{NamespaceIndex}.{Identifier}",
            "dataCollectionMode": "CurrentWithBackfill"
        },
        "DataSelection": [
            {
                "selected": true,
                "name": "Sawtooth",
                "nodeId": "ns=3;s=Sawtooth",
                "streamId": "SawtoothStream",
                "dataFilterId": null
            }
        ]
    },
    "System": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "HealthEndpoints": [
        ],
    "Diagnostics": {
            "enableDiagnostics": true
    },
        "Components": [
            {
                "componentId": "Egress",
                "componentType": "OmfEgress"
            },
            {
                "componentId": "OpcUa1",
                "componentType": "OpcUa"
            }
        ],
    "Buffering": {
            "bufferLocation": "C:/ProgramData/OSIsoft/Adapters/OpcUa/Buffers",
            "maxBufferSizeMB": -1,
            "enableBuffering": true
        }
     },
    "OmfEgress": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "DataEndpoints": [
            {
                "id": "WebAPI EndPoint",
                "endpoint": "https://PIWEBAPIServer/piwebapi/omf",
                "userName": "USERNAME",
                "password": "PASSWORD"
            },
            {
                "id": "OCS Endpoint",
                "endpoint": "https://OCSEndpoint/omf",
                "clientId": "CLIENTID",
                "clientSecret": "CLIENTSECRET"
            }
        ]
    }
}
```

## Data source configuration

The following are representations of minimal and complete data source configurations of OPC UA adapter.

### Minimal data source configuration

```json
{
    "endpointUrl": "opc.tcp://<IP-Address>:<Port>/<TestOPCUAServer>"
}
```

### Complete data source configuration

```json
{
    "endpointUrl": "opc.tcp://<IP-Address>:<Port>/<TestOPCUAServer>",
    "useSecureConnection": true,
    "userName": null,
    "password": null,
    "incomingTimestamp": "Source",
    "streamIdPrefix": null,
    "defaultStreamIdPattern": "{NamespaceIndex}.{Identifier}"
}
```

## Client settings configuration

```json
{
    "maxBrowseReferencesToReturn": 0,
    "browseBlockSize": 10,
    "readBlockSize": 1000,
    "reconnectDelay": "0:00:30",
    "recreateSubscriptionDelay": "0:00:05",
    "sessionRequestTimeout": "0:02:00",
    "connectionTimeout": "0:00:30",
    "sessionAllowInsecureCredentials": false,
    "sessionMaxOperationsPerRequest": 1000,
    "browseTimeout": "0:01:00",
    "readTimeout": "0:00:30",
    "maxMonitoredItemsPerCall": 1000,
    "maxNotificationsPerPublish": 0,
    "publishingInterval": "0:00:01",
    "createMonitoredItemsTimeout": "0:00:30",
    "samplingInterval": "0:00:00.5",
    "monitoredItemQueueSize": 2,
    "maxInternalQueueSize": 500000
}
```

## Data selection configuration

The following are representations of minimal and complete data selection configurations of OPC UA adapter.

### Minimal data selection configuration

```json
[
 {
    "nodeId": "ns=5;s=Random1"
  },
  {
    "nodeId": "ns=5;s=Sawtooth1"
  },
  {
    "nodeId": "ns=5;s=Sinusoid1"
  }
]
```

### Complete data selection configuration

```json
[
 {
    "selected": true,
    "name": "CustomStreamName",
    "nodeId": "ns=5;s=Random1",
    "streamId": "CustomStreamName",
    "dataFilterId": "DuplicateData"
  },
  {
    "selected": false,
    "name": null,
    "nodeId": "ns=5;s=Sawtooth1",
    "streamId": null,
    "dataFilterId": "DuplicateData"
  },
  {
    "selected": true,
    "name": "5.Sinusoid1",
    "nodeId": "ns=5;s=Sinusoid1",
    "streamId": null,
    "dataFilterId": null
  }
]
```
