---
uid: commandLine
---

# Command line configuration of Edge Data Store

You can configure and administer Edge Data Store on Linux and Windows by using the edgecmd command line utility. This document will be referred to as edgecmd, even though it is named edgecmd.exe on Windows and edgecmd on Linux.

Location on Windows:

```cmd
C:\Program Files\OSIsoft\EdgeDataStore\edgecmd.exe
```

**Note:** You should specify the full path when using it on Windows.

Location on Linux:

```bash
 /opt/OSIsoft/EdgeDataStore/edgecmd
```

**Note:** On Linux, you can access it without using the full path. 

Most options that you can configure using REST, you can also configure using the edgecmd utility and command line arguments. Generally, the configuration and administrative REST interfaces are exposed through the command line. Access to reading and writing data to the Edge Data Store Storage Component, OMF Ingress, and SDS Read/Write capabilities are only available using the REST API.

Example: Viewing system configuration using edgecmd:

```bash
edgecmd Configuration System
{
  "Logging": {
    "logLevel": "Information",
    "logFileSizeLimitBytes": 34636833,
    "logFileCountLimit": 31
  },
  "HealthEndpoints": [],
  "Port": {
    "port": 5590
  },
  "Components": [
    {
      "componentId": "OpcUa1",
      "componentType": "OpcUa"
    },
    {
      "componentId": "Modbus1",
      "componentType": "Modbus"
    },
    {
      "componentId": "Storage",
      "componentType": "EDS.Component"
    }
  ]
}
```

## Get help

The Edgecmd application provides a 'Help' utility. For general instructions on how to use the Edgecmd application, type:

```bash
edgecmd Help
```

You can also use the utility to get help for any registered component in Edge Data Store. If you add a specific component ID to the end of the previous command, you receive help output for every configuration facet that the component supports, along with examples of commands that you can run to configure the component.

Example: Viewing help for the 'System' component:

```bash
edgecmd Help System

---------------------------------------------------------------------------------------------------------
Component System command-line options => 'Logging'
---------------------------------------------------------------------------------------------------------
LogLevel                    [Required] Desired log level settings. Options: Verbose, Information, Warning, Error, Fatal.
LogFileSizeLimitBytes       [Required] Maximum size in bytes of log files that the service will create for this component. Must be no less than 1000.
LogFileCountLimit           [Required] Maximum number of log files that the service will create for this component. Must be a positive integer.

Example: ./edgecmd Configuration System Logging LogLevel=Warning
Example: ./edgecmd Configuration System Logging LogFileSizeLimitBytes=32768
Example: ./edgecmd Configuration System Logging LogFileCountLimit=5


---------------------------------------------------------------------------------------------------------
Component System command-line options => 'HealthEndpoints'
---------------------------------------------------------------------------------------------------------
Id                           [Optional] Id of existing configuration to be edited of removed.
Endpoint                     [Required] URL of OMF destination
UserName                     [Required group 1]  User name used for authentication to PI Web API OMF endpoint.
Password                     [Required group 1]  Password used for authentication to PI Web API OMF endpoint.
ClientId                     [Required group 2]  Client ID used for authentication to OSIsoft Cloud Services.
ClientSecret                 [Required group 2]  Client Secret used for authentication to OSIsoft Cloud Services.
Buffering                    [Optional] Set the buffering type for messages to this endpoint. Options are 'memory', 'disk' or 'none'. Defaults to 'none'.
MaxBufferSizeMB              [Optional] If an integer >0, this is the limit on the maximum megabytes of data to buffer for messages to this endpoint. Useful for limiting memory or disk usage growth in the event of disconnection to the endpoint. If the buffer is full, old messages will be discarded for new messages. Defaults to 0.
ValidateEndpointCertificate  [Optional] If true, endpoint certificate will be validated (recommended). If false, any endpoint certificate will be accepted. OSIsoft strongly recommends using disabled endpoint certificate validation for testing purposes only.

Note: Only one Required group must be specified. Group 1 for PI Web API or Group 2 for OCS.
Example: ./edgecmd Configuration System HealthEndpoints Endpoint=endpointURL UserName=UserName Password=Password


---------------------------------------------------------------------------------------------------------
Component System command-line options => 'Port'
---------------------------------------------------------------------------------------------------------
Port                        [Required] The tcp port to bind this application host to (Range [1024,65535])

Example: ./edgecmd Configuration System Port Port=5590


---------------------------------------------------------------------------------------------------------
Component System command-line options => 'Components'
---------------------------------------------------------------------------------------------------------
ComponentId                        [Required] ID of the hosted component.
ComponentType                      [Required] Type of the hosted component.

Example: ./edgecmd Configuration System Components ComponentId=Modus1 ComponentType=Modbus
```

For help regarding a specific facet within a component, add the facet name after the component ID.

Example: Help for the 'Port' facet within the 'System' component:

```bash
edgecmd Help System Port

---------------------------------------------------------------------------------------------------------
Component System command-line options => 'Port'
---------------------------------------------------------------------------------------------------------
Port                        [Required] The tcp port to bind this application host to (Range [1024,65535])

Example: ./edgecmd Configuration System Port Port=5590
```

## Edge Data Store components
### Add components
With the following command, you can view which components are currently configured on Edge Data Store:

```bash
edgecmd Configuration System Components
```

To register a new component, use the following command:

```bash
edgecmd Configuration System Components componentId=<componentId> componentType=<componentType>
```

Valid component type's are "Modbus" and "OpcUa". If you are trying to register a Modbus EDS adapter, use "Modbus" and if you are trying to register an OPC UA adapter, use "OpcUa". 

Example: Modbus adapter component registration:

```bash
edgecmd Configuration System Components componentId=Modbus1 componentType=Modbus
```

### Configure components

The EDS Modbus adapter and OPC UA adapter each have three configurable facets: data source, data selection, and logging. You can configure these with edgecmd by specifying a component ID and facet name. 

Example: Configuration of the data source facet of a Modbus adapter:

```bash
edgecmd Configuration Modbus1 DataSource IpAddress=117.23.45.110 port=502 ConnectTimeout=15000 StreamIdPrefix="DataSource1"
```

For detailed information on how to configure each adapter, see the [Modbus](xref:modbus_schema) and [OPC UA](xref:opcua_schema) schemas.

### Delete components

You can delete components from the Edge Data Store by using the following command:

```bash
edgecmd Configuration System Components id=<componentId> delete
```

**Note:** You can't delete the "Storage" component because it is required for Edge Data Store to operate.


## Retrieve existing Edge Data Store configurations

You can use the edgecmd utility to view the configuration for each part of Edge Data Store.

To view the entire configuration for every Edge Data Store component, run the following command:

```bash
edgecmd Configuration
```

To retrieve component specific configuration:

```bash
edgecmd Configuration componentId
```

To retrieve facet specific configuration of an Edge Data Store component:

```bash
edgecmd Configuration componentId facetName
```

For facets that contain multiple entries, you can retrieve the configuration for a specific entry by its Id:

```bash
edgecmd Configuration componentId facetName id=IndexToRetrieve
```

### Examples
- View the configuration of the 'System' component
```bash
edgecmd Configuration System
{
  "Logging": {
    "logLevel": "Information",
    "logFileSizeLimitBytes": 34636833,
    "logFileCountLimit": 31
  },
  "HealthEndpoints": [],
  "Port": {
    "port": 5590
  },
  "Components": [
    {
      "componentId": "Storage",
      "componentType": "EDS.Component"
    }
  ]
}
```

- View the configuration for the 'Logging' facet within the 'Storage' component
```bash
edgecmd Configuration Storage Logging
{
  "logLevel": "Information",
  "logFileSizeLimitBytes": 34636833,
  "logFileCountLimit": 31
}
```

- View the configuration of a specific entry in the 'PeriodicEgressEndpoint' facet within the 'Storage' component
```bash
edgecmd Configuration Storage PeriodicEgressEndpoints id=Endpoint_1
{
  "id": "Endpoint_1",
  "executionPeriod": "2.00:00:00",
  "name": null,
  "description": null,
  "enabled": true,
  "endpoint": "http://localhost:5590",
  "clientId": null,
  "clientSecret": null,
  "userName": "user_54",
  "password": "***************",
  "validateEndpointCertificate": true,
  "tokenEndpoint": null,
  "debugExpiration": null,
  "namespaceId": "default",
  "backfill": false,
  "egressFilter": null,
  "streamPrefix": null,
  "typePrefix": null
}
```

## Configure Edge Data Store

To create a configuration, you must enter the component and facet where the configuration payload should go, followed by key=value pairs to specify which values are to be changed. 

Example: Change all values in the 'Logging' facet:

```bash
edgecmd Configuration Storage Logging LogLevel=Warning LogFileSizeLimitBytes=32768 LogFileCountLimit=5
```

You can use this to configure any number of valid key=value pairs in a facet.

Example: Change a single value in the 'Logging' facet:

```bash
edgecmd Configuration Storage Logging LogFileCountLimit=5
```

You can also use it to add an entry to a collection configuration, for example, the 'Health Endpoints' facet in the 'System' component:

```bash
edgecmd Configuration System HealthEndpoints Id=endpoint_1 Endpoint=endpointURL UserName=UserName Password=Password
```
**Note:** If an entry with the specified id already exists, it will be updated based on the new key=value pairs

### Configure with JSON Files
You can also configure Edge Data Store by a JSON file input into the edgecmd application. File imports will completely replace the existing configurations that you are attempting to change. Therefore, it cannot be used to change individual values in a facet without modifying others.

To import a bulk configuration:
```bash
edgecmd Configuration file=PathToJsonFile
```

To import a facet specific configuration file for a component:
```
edgecmd Configuration componentId facetName file=PathToJsonFile
```

To import a file with configuration for individual facets, you can use a bulk file import operation. The file must contain just payload for the given component ID. 

Example command:

```bash
edgecmd Configuration file="~/Bulk_Storage_Runtime.json"
```

The file 'Bulk_Storage_Runtime.json' contains:
```JSON
{
	"Storage": {
		"Runtime": {
			"StreamStorageLimitMb": 66,
			"StreamStorageTargetMb": 33,
			"IngressDebugExpiration": "2020-07-08T01:00:00",
			"CheckpointRateInSec": 6,
			"TransactionLogLimitMB": 350,
			"EnableTransactionLog": true
		}
	}
}
```
The command will only affect the 'Runtime' facet in the 'Storage' component, it will not change any other components or facets. However, if a file containing the following was imported, the 'StreamStorageLimitMb' and 'StreamStorageTargetMb' values would be modified, resetting the remaining values in the facet (IngressDebugExpiration, CheckpointRateInSec, TransactionLogLimitMB, and EnableTransactionLog) to their default values:
```JSON
{
	"Storage": {
		"Runtime": {
			"StreamStorageLimitMb": 66,
			"StreamStorageTargetMb": 33,
		}
	}
}
```



## Delete configuration data

You can use the edgecmd application to delete configuration data from Edge Data Store.
To delete a configuration entry from a collection configuration (for example, 'HealthEndpoints' facet within the 'System' component), you must specify the component ID, facet, and ID of the entry to remove followed by the 'delete' keyword.
Example:
```bash
edgecmd Configuration System HealthEndpoints Id=endpoint_1 delete
```

To delete an entire configuration file, you must specify the component ID and facet followed by the 'delete' keyword.
Example:
```bash
edgecmd Configuration System HealthEndpoints delete
```



