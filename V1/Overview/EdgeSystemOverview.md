---
uid: edgeSystemOverview
---

# Edge Data Store overview

Edge Data Store is a cross-platform component based application framework that is designed to host connectivity components (such as Modbus TCP and OPC UA), and other components such as data store. In the future the same framework will be used to host other EDS connectivities.

## Installation of Edge Data Store

You can install Edge Data Store on both Linux and Windows: [Edge Data Store Installation Overview](xref:installationOverview).

## Data ingress to Edge Data Store

Edge Data Store can store (ingress) data in a number of ways. There are two built-in connectivities - [Modbus TCP](xref:modbusQuickStart) and [OPC UA](xref:opcUaQuickStart). In addition, data can be ingressed using OSIsoft Message Format [(OMF)](xref:omfQuickStart) and the Sequential Data Store [(SDS)](xref:sdsWritingData) REST APIs.

The Modbus TCP and OPC UA connectivities require additional configuration of data source and data selection before they will collect data in Edge Data Store. For OMF data ingress, once Edge Data Store is installed, you can start OMF ingress with no further configuration steps.

Edge Data Store is composed of components and is designed to allow the addition at a later date of additional EDS connectivities. Edge Data Store comes pre-configured with one Modbus TCP and one OPC UA adapter.

## Local data read and write access

You can access all data in data store using the Sequential Data Store [(SDS)](xref:sdsQuickStart) REST API.

## Data egress from Edge Data Store

Edge Data Store can send data on to both PI Data Archive (using [PI Web API](xref:piEgressQuickStart)) and OSIsoft Cloud Services [(OCS)](xref:ocsEgressQuickStart)).

Additional configuration is necessary to send data to both OCS and PI Web API after Edge Data Store is installed.
