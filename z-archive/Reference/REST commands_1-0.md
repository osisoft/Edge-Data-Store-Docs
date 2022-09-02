---
uid: RestCommands
---

# REST commands

The following tables provide an overview of available REST commands that you can use with components of Edge Data Store.

**Note:** The difference between the POST and PUT methods is that POST enables you to create a
configuration, while PUT replaces a configuration. If you use POST on an existing
configuration, the request will fail.

## Administration

| Description | Method | Endpoint |
| ----------- | ------ | -------- |
|Delete and reset all event and configuration data related to the Edge Data Store component | POST | `http://localhost:5590/api/v1/administration/Storage/Reset`|
|Reset Edge Data Store | POST | `http://localhost:5590/api/v1/administration/System/Reset`|
|Stop an individual EDS adapter | POST | `http://localhost:5590/api/v1/administration/EDS adapterId/Stop`|
| Start an individual EDS adapter | POST | `http://localhost:5590/api/v1/administration/EDS adapterId/Start` |

## Configuration

| Description | Method | Endpoint |
| ----------- | ------ | -------- |
| Verify correct installation of Edge Data Store<br><br> Configure minimum Edge Data Store<br><br>Configure maximum Ede Data Store | PUT | `http://localhost:5590/api/v1/configuration`|

### System

| Description | Method | Endpoint |
| ----------- | ------ | -------- |
| Configure system components | PUT | `http://localhost:5590/api/v1/configuration/system/components` |
| Configure system port | PUT | `http://localhost:5590/api/v1/configuration/system/port`
| Configure system logging | PUT | `http://localhost:5590/api/v1/configuration/System/Logging`|
| Configure system health endpoints | PUT | `http://localhost:5590/api/v1/configuration/System/HealthEndpoints` |

### Storage

| Description | Method | Endpoint |
| ----------- | ------ | -------- |
| Configure data egress (to either AVEVA DATA HUB or PI Web API) | PUT | `http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/`|

### EDS adapters

**Note:** Substitute the ID number of the adapter that you are configuring, for example `OpcUa1` or `OpcUa2` or `Modbus3`, and so on.

#### OPC UA

| Description | Method | Endpoint |
| ----------- | ------ | -------- |
| Configure an OPC UA data source | PUT | `http://localhost:5590/api/v1/configuration/OpcUa1/Datasource`|
| Configure OPC UA data selection | PUT | `http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection`|
| Change OPC UA logging configuration | PUT | `http://localhost:5590/api/v1/configuration/OpcUa1/Logging` |


#### Modbus TCP

| Description | Method | Endpoint |
| ----------- | ------ | -------- |
| Configure a Modbus TCP data source | PUT | `http://localhost:5590/api/v1/configuration/Modbus1/Datasource`|
| Configure Modbus TCP data selection | PUT | `http://localhost:5590/api/v1/configuration/Modbus1/Datasource`|
| Change Modbus TCP logging configuration | PUT | `http://localhost:5590/api/v1/configuration/Modbus1/Logging` |

## Tenants

### Types

| Description | Method | Endpoint |
| ----------- | ------ | -------- |
| Create an SDS type | POST | `http://localhost:5590/api/v1/tenants/default/namespaces/default/types/Simple` |

### Streams

| Description | Method | Endpoint |
| ----------- | ------ | -------- |
| Create an SDS stream | POST | `http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple` |
| View streams that have been created in Storage | POST | `http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/`|
| Write data events to the SDS stream | POST | `http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data` |
| Read last data value written to server | POST | `http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data/Last`|
| Read a time range of values written to server.<br>**(Example)** | POST | `http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data?startIndex=2017-07-08T13:00:00Z&count=100`|
| Read last container data value written to the server (using SDS) | POST | `http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/MyCustomContainer/Data/Last`|
| Read a time range of container values written to server (using SDS) **(Example)** | POST | `http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/MyCustomContainer/Data?startIndex=2017-07-08T13:00:00Z&count=100`|


### OMF
| Description | Method | Endpoint |
| ----------- | ------ | -------- |
| Create an OMF type <br><br>Create an OMF container<br><br>Write data events to the OMF container  | POST | `http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/`|
| Create an OMF container | POST | `http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/`|
