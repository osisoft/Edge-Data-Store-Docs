---
uid: EDSDataIngress
---

# Data ingress

Edge Data Store supports the following protocols to ingress data:

- [OPC UA EDS adapter](xref:opcUaOverview): Use standard OPC UA equipment and protocols to send data to EDS.

- [Modbus TCP EDS adapter](xref:modbusOverview): Use standard Modbus TCP equipment and protocols to send data to EDS.

- OMF Ingress: Use OSIsoft Message Format to send data from a custom application into EDS. OMF is a REST and JSON based data format designed for simplicity of custom application design. For more information, see [OSIsoft Message Format](xref:omfOverview).

- SDS Ingress: Use OSIsoft Sequential Data Store (SDS) REST to send data from a custom application into EDS. SDS offers the most options to send, store, and retrieve data from EDS. For more information about using REST API calls with SDS, see [Write data API](xref:sdsWritingDataApi).
