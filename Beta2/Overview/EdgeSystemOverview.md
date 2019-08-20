---
uid: edgeSystemOverview
---

# Edge Data Store (EDS) overview

Edge Data Store is a cross-platform component based application framework that is designed to host connectivity components (such as Modbus TCP and OPC UA), and other components such as Sequential Data Store (SDS). In the future, the same framework will be used to host other EDS connectivities.

## Configuring Edge Data Store

Edge Data Store hosts other components. While the initial release of Edge Data Store includes Modbus TCP connectivity, OPC UA connectivity, and SDS components, they are only active if EDS is configured to use them. EDS itself has a relatively small configuration surface area - the list of components and the HTTP Port used for REST calls.

## Installation of Edge Data Store

You can install Edge Data Store on both Linux and Windows. For more information, see [Edge Data Store Installation Overview](xref:installationOverview).

## Data ingress to Edge Data Store

Edge Data Store can store (ingress) data in a number of ways. There are two built-in EDS connectivities - [Modbus TCP](xref:modbusQuickStart) and [OPC UA](xref:opcUaQuickStart). In addition, data can be ingressed using OSIsoft Message Format [(OMF)](xref:omfQuickStart) and the Sequential Data Store [SDS](xref:sdsWritingData) REST APIs.

The Modbus TCP and OPC UA connectivities require additional configuration of data source and data selection before they will collect data in Edge Data Store. For OMF data ingress, once Edge Data Store is installed, you can start OMF ingress with no further configuration steps.

The allowed port numbers are in the range of 1024-65535. Before you change the default, ensure that no other service or application on the computer running Edge Data Store is using that port - only one application or service can use a port. You must restart Edge Data Store if you change the port number through the REST API or the command line.

Edge Data Store is composed of components and is designed to allow the addition at a later date of additional EDS connectivities. Edge Data Store Beta 2 comes pre-configured with one Modbus TCP and one OPC UA connectivity. This behavior will change in the final release.

## Local data read and write access

Following is the minimum System_Components.json file for the System. SDS is required for this initial release for Edge Data Store to run. With later releases of Edge Data Store, the storage component may not be required.  

All data in the Edge Data Store storage can be accessed using the Sequential Data Store [SDS](xref:sdsQuickStart) REST API.

## Data egress from Edge Data Store

The default System_Components.json for Beta 2 is the following. It includes three components - SDS, a single Modbus TCP connectivity (Modbus1), a single OPC UA connectivity (OpcUa1), and an SDS (EDS.Component).

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

You can add additional Modbus TCP and OPC UA components if you want, but only a single SDS component is supported. In Beta 2, you must restart the system if you add or delete a component using the REST API or the command line.

Edge Data Store can send data on to both PI Data Archive (using [PI Web API](xref:piEgressQuickStart)) and OSIsoft Cloud Services ([OCS](xref:ocsEgressQuickStart)).

Additional configuration is necessary to send data to both OCS and PI Web API after Edge Data Store is installed.
