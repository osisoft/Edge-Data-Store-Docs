---
uid: sdsOverview
---

# OSIsoft Sequential Data Store (SDS)

The Edge Data Store includes the Sequential Data Store (SDS) REST APIs for [reading](xref:sdsReadingData) and [writing](xref:sdsWritingData) data stored locally on the device where the Edge Data Store is running. SDS is the same technology that is used in OCS for storing data, so the usage of the REST APIs is very similar to OCS for reading and writing data.

All data from all sources on the Edge Data Store (Modbus, OPC UA, OMF, SDS) can be read using the SDS REST APIs locally on the device in the default tenant and the default namespace. In addition the default tenant has a diagnostics namespace where diagnostic data are written by the Edge Data Store and installed components that can be read to monitor the health of a running system using the SDS REST APIs.
