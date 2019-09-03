---
uid: EdgeDataStoreOverview
---

# Edge Data Store overview

The Edge Data Store is an embedded data server that runs on Linux and Windows. It is designed for small devices and can be installed and run on 64-bit Intel/AMD compatible and 32-bit ARM v7/v8 compatible chips. It offers REST programming, configuration, and administrative interfaces, and a command line tool that can be used for configuring and administering EDS.

EDS is not a replacement for any existing OSIsoft technology, but is rather a supplement to existing products. In this release EDS does not offer any built-in visualization or analytic support, but by using the REST programming capabilities built into EDS it is possible to write analytics or visualization programs on either Linux, Windows, or both in a variety of programming languages.

## Edge Data Store architecture

![EDS architecture](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSArchitecture.jpg "EDS architecture")

## Edge Data Store data flow

![EDS data flow](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOverview1.jpg "EDS data flow")

## Edge Data Store components

![EDS components](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOverview2.jpg "EDS components")

## Installation of the Edge Data Store

The Edge Data Store can be installed on both Linux and Windows: [Edge Data Store Installation Overview](xref:installationOverview).

## Data Ingress to the Edge Data Store

The Edge Data Store can store (ingress) data in a number of ways. There are two built-in adapters - [EDS Modbus TCP](xref:modbusQuickStart) and [EDS OPC UA](xref:opcUaQuickStart). In addition data can be ingressed using OSIsoft Message Format [(OMF)](xref:omfQuickStart) and the Sequential Data Store [SDS](xref:sdsWritingData) REST APIs.

![EDS OMF Ingress](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOMFIngress.jpg "EDS OMF Ingress")

During installation of the Edge Data Store, options are presented to install either an EDS Modbus TCP adapter, or an EDS OPC UA adapter, or both. The EDS Modbus and EDS OPC UA adapters require additional configuration of data source and data selection before they will collect data in the Edge Data Store. For OMF data ingress, once the Edge Data Store is installed OMF ingress can be started with no further configuration steps.

The Edge Data Store is composed of components and is designed to allow the addition at a later date of additional EDS adapters if desired.

## Local Data Read and Write Access

All data in the Edge Data Store storage can be accessed using the Sequential Data Store [SDS](xref:sdsQuickStart) REST API. This data can be used for local applications that perform analytics or visualization. 

### Example EDS visualization application

![EDS Visualization](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSVisualization.jpg "EDS Visualization")

### Example EDS analytics application

![EDS Analytics](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSAnalytics.jpg "EDS Analytics")

## Data Egress from the Edge Data Store

The Edge Data Store can send data on to both the PI Data Archive (using [PI Web API](xref:piEgressQuickStart)) and OSIsoft Cloud Services ([OCS](xref:ocsEgressQuickStart)).

Additional configuration is necessary to send data to both OCS and PI Web API after the Edge Data Store is installed.
