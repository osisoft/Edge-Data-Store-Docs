---
uid: configurationSchemaList
---

# Configuration schemas

The Edge System is configured via a series of JSON files. The schemas for these files are provided in the installation directory and are documented below. 

## Edge System configuration schemas

Use the following schemas to configure Edge System:

- [EdgeLoggerConfiguration](.\System_Logging_schema.md)
- [PortConfiguration](.\System_Port_schema.md)
- [OmfHealthEndpointConfiguration](.\System_HealthEndpoints_schema.md)
- [EdgeSystemConfig](.\System_Components_schema.md)
  
## Connectivity Adapters configuration schemas

Use the following schemas to configure Connectivity Adapters:

### OPC UA

- [DataSourceConfiguration](.\OpcUa_DataSource_schema.md)
- [DataCollectionItem](.\OpcUa_DataSelection_schema.md)
- [EdgeLoggerConfiguration](.\OpcUa_Logging_schema.md)

### Modbus

- [DataSourceConfiguration](.\Modbus_DataSource_schema.md)
- [DataSelectionConfiguration](.\Modbus_DataSelection_schema.md)
- [EdgeLoggerConfiguration](.\Modbus_Logging_schema.md)

## Storage configuration schemas

Use the following schemas to configure the Storage component:

  - [EdgeLoggerConfiguration](.\Storage_Logging_schema.md)
  - [StorageRuntimeConfiguration](.\Storage_Runtime_schema.md)
  - [OEMConfiguration](.\Storage_OEM_schema.md)
  - [Periodic Egress Endpoints](.\Storage_PeriodicEgressEndpoints_schema.md)
