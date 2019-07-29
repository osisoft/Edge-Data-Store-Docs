---
uid: edgeSystemOverview
---

# Edge System Overview

The Edge System is a cross-platform component based application framework that is designed to host connectivity components (adapters such as Modbus and Opc Ua), and other components such as Storage. In the future the same framework will be used to host other adapters.

## Configuring the Edge System

The Edge System hosts other components. While the initial release of the Edge System includes Modbus, Opc Ua, and Storage components, they are only active if the system is configured to use them. The System itself has a relatively small configuration surface area - the list of components and the HTTP Port used for REST calls.

### System_Port.json

System_Port.json specifies the port on which the System is listening for REST API calls. The same port is used for configuration and for writing data to OMF and SDS. The default configuration port is 5590. The default System_Port.json file installed is:

```json
{
  "Port": 5590
}
```

Allowable ports are in the range of 1024-65535. Before you change the default, ensure that no other service or application on the computer running the EdgeSystem is using that port - only one application or service can use a port. The Edge System must be restarted if the port number changes through the REST API or the command line.

### System_Components.json

The minimum System_Components.json file for the System is below. The Storage component is required for this initial release for the System to run. With later releases of the Edge System, the storage component may not be required.

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
