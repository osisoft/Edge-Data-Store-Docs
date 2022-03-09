---
uid: PIAdapterForModbusTCPConfigurationExamples
---

# Configuration examples

The following tables provide examples for all configurations available for PI Adapter for Modbus TCP.

**Note:** The examples in this topic are using the default port number `5590`. If you selected a different port number, replace it with that value.

## System components configuration with two Modbus TCP adapter instances

```json
[
    {
        "ComponentId": "Modbus1",
        "ComponentType": "Modbus"
    },
    {
        "ComponentId": "Modbus2",
        "ComponentType": "Modbus"
    },
    {
        "ComponentId": "OmfEgress",
        "ComponentType": "OmfEgress"
    }
]
```

## Modbus adapter configuration

```json
{
    "Modbus1": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "DataSource": {
            "Devices":
            [
                {
                    "Id": "Device1",
                    "IpAddress": "127.0.0.1",
                    "Port": 502
                },
                {
                    "Id": "Device2",
                    "IpAddress": "127.0.0.2",
                    "Port": 502
                },
                {
                    "Id": "Device3",
                    "IpAddress": "127.0.0.3",
                    "Port": 502
                }
            ],
            "StreamIdPrefix": "my.prefix",
            "DefaultStreamIdPattern": "{DeviceId}.{UnitId}.{RegisterType}.{RegisterOffset}",
            "ConnectTimeout": "00:00:05",
            "ReconnectInterval": "00:00:01",
            "RequestTimeout": "00:00:10",
            "DelayBetweenRequests": "00:00:00.5",
            "MaxResponseDataLength": 125,
            "SimultaneousRequests": 1
        },
        "DataSelection": [
            {
                "DeviceId" : "Device1",
                "Selected": true,
                "Name": "MyDataItem",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 123,
                "DataTypeCode": 20,
                "ScheduleId": "Schedule1",
                "StreamId": "stream.1",
                "BitMap": "020301",
                "ConversionFactor": 12.3,
                "ConversionOffset": 14.5,
                "DataFilterId" : "DataFilter1"
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
                "componentId": "Modbus1",
                "componentType": "Modbus1"
            }
        ],
    "Buffering": {
            "BufferLocation": "C:/ProgramData/OSIsoft/Adapters/Modbus/Buffers",
            "MaxBufferSizeMB": -1,
            "EnableBuffering": true
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

The following are representations of minimal and complete data source configurations of Modbus TCP adapter.

### Minimal data source configuration

```json
{
    "Devices":
    [
        {
            "Id": "Device1",
            "IpAddress": "127.0.0.1"
        }
    ]
}
```

### Complete data source configuration

```json
{
    "Devices":
    [
        {
            "Id": "Device1",
            "IpAddress": "127.0.0.1",
            "Port": 502
        },
        {
            "Id": "Device2",
            "IpAddress": "127.0.0.2",
            "Port": 502
        },
        {
            "Id": "Device3",
            "IpAddress": "127.0.0.3",
            "Port": 502
        }
    ],
    "StreamIdPrefix": "my.prefix",
    "DefaultStreamIdPattern": "{DeviceId}.{UnitId}.{RegisterType}.{RegisterOffset}",
    "ConnectTimeout": "00:00:05",
    "ReconnectInterval": "00:00:01",
    "RequestTimeout": "00:00:10",
    "DelayBetweenRequests": "00:00:00.5",
    "MaxResponseDataLength": 125,
    "SimultaneousRequests": 1
}
```

## Data selection configuration

The following are representations of minimal and complete data selection configurations of Modbus TCP adapter.

### Minimal data selection configuration

```json
[
    {
        "DeviceId" : "Device1",
        "Selected" : true,
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 122,
        "DataTypeCode": 20,
        "ScheduleId": "Schedule1"
    }
]
```

### Complete data selection configuration

```json
[
    {
        "DeviceId" : "Device1",
        "Selected": true,
        "Name": "MyDataItem",
        "UnitId": 1,
        "RegisterType": 3,
        "RegisterOffset": 123,
        "DataTypeCode": 20,
        "ScheduleId": "Schedule1",
        "StreamId": "stream.1",
        "BitMap": "020301",
        "ConversionFactor": 12.3,
        "ConversionOffset": 14.5,
        "DataFilterId" : "DataFilter1"
    }
]
```
