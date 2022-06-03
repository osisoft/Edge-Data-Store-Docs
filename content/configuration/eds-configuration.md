---
uid: EdgeDataStoreConfiguration
---

# Edge Data Store configuration

Edge Data Store requires configuration, which can be performed either for each individual component or for the system as a whole. Use the following procedures to configure Edge Data Store as a whole system with either a minimum or a maximum configuration.

## Configure minimum Edge Data Store

The following JSON file represents minimal configuration of an Edge Data Store. There are no Modbus TCP EDS adapter or OPC UA EDS adapter components, and the Storage component configurations are set to the default. If you configure a system with this JSON file, any existing Modbus TCP EDS adapter or OPC UA EDS adapter components will be disabled and removed. No storage data will be deleted or modified, and OMF and SDS data access will not be impacted.

1. Save or copy the example JSON in a file named _EdgeMinimumConfiguration.json_ in any directory on a device with Edge Data Store installed.

1. Run the following curl command from the directory where the file is located:

  ```bash
  curl -d "@EdgeMinimumConfiguration.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration
  ```

  The following will be set as the configuration of a running Edge Data Store. The configuration takes effect immediately after the command completes.

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

This example results in a minimal configuration of Edge Data Store. It only supports OMF and SDS operations using REST. No egress is configured, so no data will be sent to either OCS or PI Web API.

## Configure maximum Edge Data Store

The following JSON file represents maximum configuration of an Edge Data Store. There are Modbus TCP EDS adapter components and OPC UA EDS adapter components, and egress is configured to send to both PI Web API and OCS from both the default (operational data) and diagnostics (diagnostic data) namespace.

1. Using any text editor, create a JSON file using the following example. Fill in any credentials or IP addresses with appropriate values for your environment.
2. Save the edited JSON in a file named _EdgeMaximumConfiguration.json_ in any directory.
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
