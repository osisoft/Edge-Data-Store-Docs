---
uid: sdsOverview
---

# SDS reference

The Sequential Data Store (SDS) is a cloud-based streaming data storage that is optimized for storing sequential data, usually time-series, but can store anything that is indexed by an ordered sequence. Use SDS to store, retrieve, and analyze data. An SdsType (used interchangeably with type throughout documentation) defines the shape of a single measured event or object. A type gives structure to the data. For example, if you're measuring three things (longitute, latitude, speed) from a device at the same time, then those three properties need to be included in the type. An SdsStream (used interchangeably with stream throughout documentation) is a collection of ordered events, or a series of events, where each event is an instance of the type. You create and write data to streams using a simple REST (REpresentational State Transfer) API (Application Programming Interface). The streams can be used to store simple or complex data types to suit your application needs. You can define simple or complex indexes to arrange and relate your data. An assortment of methods with customizable behaviors are available to read data and easily obtain needed information.

Edge Data Store includes the Sequential Data Store (SDS) REST APIs to read and write data stored locally on the Edge Data Store device. SDS is the same technology used in OCS for storing data, so the usage of the REST APIs is very similar to OCS for reading and writing data.

All data from all sources on the Edge Data Store (Modbus TCP, OPC UA, OMF, SDS) can be read using the SDS REST APIs on the local device, in the default tenant and the default namespace. In addition, the default tenant has a diagnostics namespace where diagnostic data are written by the Edge Data Store and installed components that can be read to monitor the health of a running system using the SDS REST APIs.

The SDS instance running in EDS is an advanced storage engine that is also used in OCS. While it works very well for storing OMF compatible data in EDS, it can also be used for advanced scenarios where data stored in SDS cannot be converted to OMF. All data egress from EDS to both OCS and the PI System uses OMF, so for streams that will be egressed to the PI System or OCS, it is recommended that they have only a single time-based index. Multiple values are supported in a single stream, but for successful egress there is a limitation of a single time-based index only.
