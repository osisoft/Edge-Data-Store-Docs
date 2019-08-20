---
uid: edgeSystemOverview
---

# Edge Data Store overview

Edge Data Store is a cross-platform component based application framework that is designed to host connectivity components (adapters such as Modbus TCP and OPC UA), and other components such as Storage. In the future the same framework will be used to host other adapters.

## Installation of the Edge Data Store

The Edge Data Store can be installed on both Linux and Windows: [Edge Data Store Installation Overview](xref:installationOverview).

## Data Ingress to the Edge Data Store

The Edge Data Store can store (ingress) data in a number of ways. There are two built-in adapters - [Modbus](xref:modbusQuickStart) and [OPC UA](xref:opcUaQuickStart). In addition data can be ingressed using OSIsoft Message Format [(OMF)](xref:omfQuickStart) and the Sequential Data Store [SDS](xref:sdsWritingData) REST APIs.

The Modbus and OPC UA adapters require additional configuration of data source and data selection before they will collect data in the Edge Data Store. For OMF data ingress, once the Edge Data Store is installed OMF ingress can be started with no further configuration steps.

The Edge Data Store is composed of components and is designed to allow the addition at a later date of additional adapters. Edge Data Store Beta 2 comes pre-configured with one Modbus and one OPC UA adapter. This behavior will change in the final release.

## Local Data Read and Write Access

All data in the Edge Data Store storage can be accessed using the Sequential Data Store [SDS](xref:sdsQuickStart) REST API.

## Data Egress from the Edge Data Store

The Edge Data Store can send data on to both the PI Data Archive (using [PI Web API](xref:piEgressQuickStart)) and OSIsoft Cloud Services ([OCS](xref:ocsEgressQuickStart)).

Additional configuration is necessary to send data to both OCS and PI Web API after the Edge Data Store is installed.
