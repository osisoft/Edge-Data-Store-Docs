---
uid: EdgeDataStoreOverview
---

# Overview

Edge Data Store is an embedded data server that runs on Linux and Windows. It is designed for small devices and you can install and run it on 64-bit Intel/AMD compatible and 32-bit ARM v7/v8 compatible chips. It offers REST programming, configuration, administrative interfaces, and a command line tool that can be used for configuring and administering EDS.

EDS is not a replacement for any existing OSIsoft technology, but rather a supplement to existing products. In this release, EDS does not offer any built-in visualization or analytic support. However, if you use the REST programming capabilities built into EDS, you can write analytics or visualization programs on either Linux, Windows, or both in a variety of programming languages.

## Edge Data Store architecture

![EDS architecture](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSArchitecture.jpg "EDS architecture")

## Edge Data Store data flow

![EDS data flow](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOverview1.jpg "EDS data flow")

## Edge Data Store components

![EDS components](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOverview2.jpg "EDS components")

## Edge Data Store installation

The Edge Data Store can be installed on both Linux and Windows: [Edge Data Store Installation Overview](xref:installationOverview).

## Data ingress to Edge Data Store

Edge Data Store can ingress data in a number of ways. There are two built-in adapters - [EDS Modbus TCP](xref:modbusQuickStart) and [EDS OPC UA](xref:opcUaQuickStart). Additionally, data can be ingressed using OSIsoft Message Format [(OMF)](xref:omfQuickStart) and the Sequential Data Store [SDS](xref:sdsWritingData) REST APIs.

![EDS OMF Ingress](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOMFIngress.jpg "EDS OMF Ingress")

During installation of Edge Data Store, options are presented to install either an EDS Modbus TCP adapter, or an EDS OPC UA adapter, or both. The EDS Modbus and EDS OPC UA adapters require additional configuration of data source and data selection before they can collect data in Edge Data Store. For OMF data ingress, once Edge Data Store is installed, you can start OMF ingress with no further configuration steps.

The Edge Data Store is composed of components and is designed to allow the addition at a later date of additional EDS adapters if desired.

## Local data read and write access

You can access all data in Edge Data Store by using the Sequential Data Store [SDS](xref:sdsQuickStart) REST API. You can use this data for local applications that perform analytics or visualization. 

### Example EDS visualization application

![EDS Visualization](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSVisualization.jpg "EDS Visualization")

### Example EDS analytics application

![EDS Analytics](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSAnalytics.jpg "EDS Analytics")

## Data egress from Edge Data Store

The Edge Data Store can send data to both PI Data Archive (using [PI Web API](xref:piEgressQuickStart)) and OSIsoft Cloud Services ([OCS](xref:ocsEgressQuickStart)).

Additional configuration is necessary to send data to both OCS and PI Web API after Edge Data Store is installed.
