---
uid: EDSDataIngress
---

# Data ingress configuration

Edge Data Store provides Edge Connectivity, which supports both the Modbus TCP EDS adapter and the OPC UA EDS adapter. In either case, all data ingress from collection devices into Edge Data Store occurs through REST routes that are incorporated from Sequential Data Store and an included OSIsoft Message Format (OMF) endpoint. Ingressed data is retained in EDS based on system logging and stream storage configuration settings until it is sent to permanent data storage.

**Note:** For Linux data ingress scenarios that include a large number of streams, consider increasing the operating system's maximum number of open file descriptors per process. For more information, see [Linux and Windows platform differences](xref:linuxWindows).
