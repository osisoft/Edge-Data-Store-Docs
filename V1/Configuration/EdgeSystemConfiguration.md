---
uid: edgeSystemConfiguration
---

# Edge Data Store configuration

Edge Data Store uses JSON configuration files in a protected directory on Windows and Linux to store configuration that is read on startup. While the files are accessible to view, it is recommended that you use REST for any changes you make to the files. As part of making Edge Data Store as secure as possible, any passwords or secrets that are configured will be stored in encrypted form (with cryptographic key material stored separately in a secure location.) If the files are edited directly, the system may not work as expected. For Beta 2 it is recommended that REST be used as the primary way of configuring the Edge Data Store. In the final release command line configuration will also be supported.

**Note:** It is possible to edit any single component or facet of the system using REST, but it is also possible to configure the system as a whole with a single REST call.

## Configuring the Edge Data Store

The Edge Data Store hosts other components. While the initial release of the Edge Data Store includes Modbus, Opc Ua, and Storage components, they are only active if the system is configured to use them. The System itself has a relatively small configuration surface area - the list of components and the HTTP Port used for REST calls.

### Configuring Edge Data Store port

System_Port.json specifies the port on which the System is listening for REST API calls. The same port is used for configuration and for writing data to OMF and SDS. The default configuration port is 5590. The default System_Port.json file installed is:

```json
{
  "Port": 5590
}
```

Allowable ports are in the range of 1024-65535. Before you change the default, ensure that no other service or application on the computer running the EdgeSystem is using that port - only one application or service can use a port. The Edge Data Store must be restarted if the port number changes through the REST API. To change the Edge Data Store port you can save the JSON containing the new port number in the JSON fomrat above to a file named EdgePort.json and run the following script:

```bash
curl -i -d "@EdgePort.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/system/port
```

After the REST command completes, the Edge Data Store will need to be restarted for the change to take effect.

### Configuring Edge Data Store components

The minimum System_Components.json file for the System is below. The Storage component is required for this initial release for Edge Data Store to run. With later releases of the Edge Data Store, the storage component may not be required.

```json
[
  {
    "ComponentId": "Storage",
    "ComponentType": "EDS.Component"
  }
]
```

The default System_Components.json for Beta 2 is given below. It includes three components - Storage, a single Modbus adapter (Modbus1), a single Opc Ua Adapter (OpcUa1), and a Storage component (EDS.Component).

 ```json
[
  {
    "ComponentId": "OpcUa1",
    "ComponentType": "OpcUa"
  },
  {
    "ComponentId": "Modbus1",
    "ComponentType": "Modbus"
  },
  {
    "ComponentId": "Storage",
    "ComponentType": "EDS.Component"
  }
]
 ```

 Additional Modbus and Opc Ua components can be added if desired, but only a single Storage component is supported. In Beta 2 the system must be restarted if a component is added or deleted using the REST API or the command line.

 To add a new component, in this example a second Modbus adapter, create the following JSON. Please note a unique ComponentId is necessary for each component in the system. For this example we will use the ComponentId Modbus2 since it is the second Modbus adapter:

 ```json
  {
    "ComponentId": "Modbus2",
    "ComponentType": "Modbus"
  }
 ```

 Save the JSON in a file named AddComponent.json. From the same directory where the file exists run the following curl script:

```bash
curl -i -d "@AddComponent.json" -H "Content-Type: application/json" -X POST http://localhost:5590/api/v1/configuration/system/components
```

After the curl command completes successfully, for Beta 2 the Edge Data Store will need to be restarted before the new component can be configured or used. This behavior will change in the final relase, and components will be able to be added without an Edge Data Store restart.

## Configuring entire Edge Data Store

### Minimum Edge Data Store Configuration

The following JSON file represents minimal configuration of an Edge Data Store. There are no Modbus or Opc Ua components, and the Storage component configurations are set to the default. If a system were configured with this JSON file, any existing Modbus or Opc Ua components would be disabled and removed. No storage data would be deleted or modified, and OMF and SDS data access would not be impacted.

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

Saveor copy the JSON in a file named EdgeMinimumConfiguration.json in any directory on a device with Edge Data Store installed. When the following curl command is run, this will be set as the configuration of a running Edge Data Store (run the command from the directory where the file is located):

```bash
curl -i -d "@EdgeMinimumConfiguration.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration
```

The configuration takes effect immediately after the command completes.

The above example will result in a minimal configuration of Edge Data Store. It will only support [OMF](xref:omfQuickStart) and [SDS](xref:sdsQuickStart) operations using REST. No egress is configured, so no data will be forwarded to either [OCS](xref:ocsEgressQuickStart) or [PI Web API](xref:piEgressQuickStart).

### Maximum Edge Data Store Configuration

The following JSON file represents maximal configuration of an Edge Data Store. There are Modbus and Opc Ua components, and egress is configured to send to both PI Web API and OCS. If a system were configured with this JSON file. In this example both operational data (namespace = default) and diagnostic data for the system and the adapters (namespace = diagnostics).

```json
{
    "Modbus1": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "DataSource": {
            "IpAddress": "<Modbus IP address>",
            "Port": 502,
            "ConnectTimeout": 15000,
            "ReconnectInterval": 5000,
            "RequestTimeout": 9000,
            "DelayBetweenRequests": 0,
            "MaxResponseDataLength": 250
        },
        "DataSelection": [{
                "Selected": "true",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 1,
                "DataTypeCode": 20,
                "BitMap": "16151413",
                "ConversionFactor": 2,
                "ConversionOffset": 3.4,
                "ScanRate": 500
            },
            {
                "Selected": "true",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 2,
                "DataTypeCode": 20,
                "BitMap": "16151413",
                "ConversionFactor": 2,
                "ConversionOffset": 3.4,
                "ScanRate": 500
            },
            {
                "Selected": "true",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 3,
                "DataTypeCode": 20,
                "BitMap": "16151413",
                "ConversionFactor": 2,
                "ConversionOffset": 3.4,
                "ScanRate": 500
            },
            {
                "Selected": "true",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 4,
                "DataTypeCode": 20,
                "BitMap": "16151413",
                "ConversionFactor": 2,
                "ConversionOffset": 3.4,
                "ScanRate": 500
            },
            {
                "Selected": "true",
                "UnitId": 1,
                "RegisterType": 3,
                "RegisterOffset": 5,
                "DataTypeCode": 20,
                "BitMap": "16151413",
                "ConversionFactor": 2,
                "ConversionOffset": 3.4,
                "ScanRate": 500
            }
        ]
    },
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
        "PeriodicEgressEndpoints": [{
                "Id": "OCS",
                "ExecutionPeriod": "00:00:50",
                "Name": null,
                "NamespaceId": "default",
                "Description": null,
                "Enabled": true,
                "Backfill": false,
                "EgressFilter": "",
                "StreamPrefix": "ChangeMe",
                "TypePrefix": "ChangeMe",
                "Endpoint": "<OCS OMF URL for your tenant and namespace>",
                "ClientId": "<OCS ClientId>",
                "ClientSecret": "<OCS ClientSecret>",
                "UserName": null,
                "Password": null,
                "DebugExpiration": null
            },
            {
                "Id": "PWA",
                "ExecutionPeriod": "00:00:50",
                "Name": null,
                "NamespaceId": "default",
                "Description": null,
                "Enabled": true,
                "Backfill": false,
                "EgressFilter": "",
                "StreamPrefix": "ChangeMe",
                "TypePrefix": "ChangeMe",
                "Endpoint": "https://<your PI Web API server>/piwebapi/omf/",
                "ClientId": null,
                "ClientSecret": null,
                "UserName": "<username>",
                "Password": "<password>",
                "DebugExpiration": null
            },
            {
                "Id": "OCSDiag",
                "ExecutionPeriod": "00:00:50",
                "Name": null,
                "NamespaceId": "diagnostics",
                "Description": null,
                "Enabled": true,
                "Backfill": false,
                "EgressFilter": "",
                "StreamPrefix": "ChangeMe",
                "TypePrefix": "ChangeMe",
                "Endpoint": "<OCS OMF URL for your tenant and namespace>",
                "ClientId": "<OCS ClientId>",
                "ClientSecret": "<OCS ClientSecret>",
                "UserName": null,
                "Password": null,
                "DebugExpiration": null
            },
            {
                "Id": "PWADiag",
                "ExecutionPeriod": "00:00:50",
                "Name": null,
                "NamespaceId": "diagnostics",
                 "Description": null,
                "Enabled": true,
                "Backfill": false,
                "EgressFilter": "",
                "StreamPrefix": "ChangeMe",
                "TypePrefix": "ChangeMe",
                "Endpoint": "https://<your PI Web API server>/piwebapi/omf/",
                "ClientId": null,
                "ClientSecret": null,
                "UserName": "<username>",
                "Password": "<password>",
                "DebugExpiration": null
            }
        ]
    },
    "OpcUa1": {
        "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
        },
        "DataSource": {
            "EndpointUrl": "opc.tcp://<OPC UA server IP and port>/OSIsoftTestServer",
            "UseSecureConnection": false,
            "UserName": null,
            "Password": null,
            "RootNodeIds": null,
            "IncomingTimestamp": "Source",
            "StreamIdPrefix": "OpcUa"
        },
        "DataSelection": [{
                "Selected": true,
                "Name": "Cold Side Inlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideInletTemperature",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Cold Side Outlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideOutletTemperature",
                "StreamId": null
            },
            {
                "Selected": true,
                "Name": "Hot Side Inlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideInletTemperature",
                "StreamId": null
            },
            {
                "Selected": true,
                "Name": "Hot Side Outlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideOutletTemperature",
                "StreamId": null
            },
            {
                "Selected": true,
                "Name": "Cold Side Inlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideInletTemperature",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Cold Side Outlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideOutletTemperature",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Hot Side Inlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideInletTemperature",
                "StreamId": null
            },
            {
                "Selected": true,
                "Name": "Hot Side Outlet Temperature",
                "NodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideOutletTemperature",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Power",
                "NodeId": "ns=2;s=Line1.SF_Pump_001.Power",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Efficiency",
                "NodeId": "ns=2;s=Line1.SF_Pump_001.Efficiency",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Flowrate",
                "NodeId": "ns=2;s=Line1.SF_Pump_001.Flowrate",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Power",
                "NodeId": "ns=2;s=Line1.SF_Pump_002.Power",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Efficiency",
                "NodeId": "ns=2;s=Line1.SF_Pump_002.Efficiency",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Flowrate",
                "NodeId": "ns=2;s=Line1.SF_Pump_002.Flowrate",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Level",
                "NodeId": "ns=2;s=Line1.Tank1.Level",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Mass",
                "NodeId": "ns=2;s=Line1.Tank1.Mass",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Volume",
                "NodeId": "ns=2;s=Line1.Tank1.Volume",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Level",
                "NodeId": "ns=2;s=Line1.Tank2.Level",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Mass",
                "NodeId": "ns=2;s=Line1.Tank2.Mass",
                "StreamId": null
            },
            {
                "Selected": false,
                "Name": "Volume",
                "NodeId": "ns=2;s=Line1.Tank2.Volume",
                "StreamId": null
            }
        ]
    },
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
}
```

**Please be sure to fill in any credentials or IP addresses with with appropriate values for your environment**

Save the edited version of the JSON above in a file named EdgeMaximumConfiguration.json in any directory. When the following curl command is run, this will be set as the configuration of a running Edge Data Store (the command should be run from the same directory where the file is located):

```bash
curl -i -d "@EdgeMaximumConfiguration.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration
```

The configuration takes effect immediately after the command completes unless Components were added. If Components were added in Beta 2, a restart of Edge Data Store might be necessary before the changes take effect.

Full JSON definition of configuration parameters:
[Edge Data Store Configuration](xref:edge_system_schema)
