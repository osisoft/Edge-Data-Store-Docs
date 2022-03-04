---
uid: sdsOverview
---

# SDS reference

The Sequential Data Store (SDS) is a cloud-based streaming data storage that is optimized for storing sequential data, typlically time-series. It can store any data that is indexed by an ordered sequence. Use SDS to store, retrieve, and analyze data. An SdsType, also called a type, defines the shape of a single measured event or object. A type gives structure to the data. For example, if you are measuring three things, such as longitute, latitude, and speed, from a device at the same time, then those three properties need to be included in the type. An SdsStream, also called a stream, is a collection of ordered events, where each event is an instance of the type. 

You create and write data to streams using a simple REST (REpresentational State Transfer) API (Application Programming Interface). The streams can be used to store simple or complex data types to suit your application needs. You can define simple or complex indexes to arrange and relate your data. An assortment of methods with customizable behaviors are available to read data and easily obtain needed information.

Edge Data Store includes the Sequential Data Store (SDS) REST APIs to read and write data stored locally on the Edge Data Store device. SDS is the same technology used in OCS for storing data, so the usage of the REST APIs is very similar to OCS for reading and writing data.

All data from all sources on the Edge Data Store can be read using the SDS REST APIs on the local device, in the default tenant and the default namespace. In addition, the default tenant has a diagnostics namespace where diagnostic data are written by the Edge Data Store and installed components that can be read to monitor the health of a running system using the SDS REST APIs.

SDS is an advanced storage engine that is also used in OSIsoft Cloud Services (OCS). While it works very well for storing OMF compatible data in EDS, it can also be used for advanced scenarios where data stored in SDS cannot be converted to OMF. To convert streams in EDS for egress using OMF, streams in EDS must have only a single time-based index.
