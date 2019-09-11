---
uid: commandLine
---

# Command line configuration of Edge Data Store

Configuration and administration of the Edge Data Store on Linux and Windows can also be accomplished using the edgecmd command line tool. On Windows it is located in the directory:

```cmd
C:\Program Files\OSIsoft\EdgeDataStore\edgecmd.exe
```

You should specify the full path when using it on Windows.

On Linux the utility is installed in:

```bash
 /opt/OSIsoft/EdgeDataStore/edgecmd
```

On Linux it can be accessed without using the full path. For the sake of simplicity the utility for the rest of this topic will be referred to as edgecmd, even though it is named edgecmd.exe on Windows and edgecmd on Linux.

Most configurations options that can be done using REST can also be done using the edgecmd utility and command line arguments. Generally the configuration and administrative REST interfaces are exposed via the command line. Access to reading and writing data to the Edge Data Store Storage Component - OMF Ingress and SDS Read/Write capabilities are only available using the REST API.

A simple example of viewing system configuration using edgecmd:

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

## Getting Help

The Edgecmd application provides a 'Help' utility. For general instructions on how to use the Edgecmd application, type:

```bash
edgecmd Help
```

The utility can also be used to get help for any registered component in the Edge Data Store. Adding a specific component ID to the end of the previous command will provide help output for every configuration facet that the component supports, along with examples of commands that can be run to configure the component.

An example of viewing help for the 'System' component:

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

An example to get help regarding the 'Port' facet within the 'System' component:

```bash
edgecmd Help System Port

---------------------------------------------------------------------------------------------------------
Component System command-line options => 'Port'
---------------------------------------------------------------------------------------------------------
Port                        [Required] The tcp port to bind this application host to (Range [1024,65535])

Example: ./edgecmd Configuration System Port Port=5590
```

## Edge Data Store Components
### Adding Components
The following command can be used to view which components are currently configured on the Edge Data Store:

```bash
edgecmd Configuration System Components
```

To register a new component, use the following command:
```bash
edgecmd Configuration System Components componentId=<componentId> componentType=<componentType>
```

Valid component type's are "Modbus" and "OpcUa". Use "Modbus" if trying to register a Modbus EDS adapter and "OpcUa" if trying to register an OPC UA adapter. 

Example of registering a new Modbus adapter component:

```bash
edgecmd Configuration System Components componentId=Modbus1 componentType=Modbus
```

### Configuring Components

The EDS Modbus adapter and OPC UA adapter each have 3 configurable facets: Data Source, Data Selection, and Logging. These can be configured with edgecmd by specifying a component ID and facet name. An example of configuring the data source facet of a Modbus adapter:

```bash
edgecmd Configuration Modbus1 DataSource IpAddress=117.23.45.110 port=502 ConnectTimeout=15000 StreamIdPrefix="DataSource1"
```

For detailed information on how to configure each adapter see the [Modbus](xref:modbus_schema) and [OPC UA](xref:opcua_schema) schemas.

### Deleting Components

Components can be deleted from the Edge Data Store using the following command:

```bash
edgecmd Configuration System Components id=<componentId> delete
```

- Note: The "Storage" component cannot be deleted, as it is required for the Edge Data Store to operate.


## Retrieve Existing Edge Data Store Configurations

The edgecmd utility can be used to view the configuration for each part of the Edge Data Store.

To view the entire configuration for every Edge Data Store component run the following command:

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

For facets that contain multiple entries, the configuration for a specific entry can be retrieved by its Id:

```bash
edgecmd Configuration componentId facetName id=IndexToRetrieve
```

### Examples
- Viewing the configuration of the 'System' component
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

- Viewing configuration for the 'Logging' facet within the 'Storage' component
```bash
edgecmd Configuration Storage Logging
{
  "logLevel": "Information",
  "logFileSizeLimitBytes": 34636833,
  "logFileCountLimit": 31
}
```

- Viewing the configuration of a specific entry in the 'PeriodicEgressEndpoint' facet within the 'Storage' component
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

## Configuring the Edge Data Store

To create a configuration a user must enter the component and facet where the configuration payload should go, followed by key=value pairs to specify which values are to be changed. Example, changing all values in the 'Logging' facet:
```bash
edgecmd Configuration Storage Logging LogLevel=Warning LogFileSizeLimitBytes=32768 LogFileCountLimit=5
```

This can be used to configure any number of valid key=value pairs in a facet. Example, changing a single value in the 'Logging' facet:
```bash
edgecmd Configuration Storage Logging LogFileCountLimit=5
```

It can also be used to add an entry to a collection configuration, for example, the 'Health Endpoints' facet in the 'System' component:
```bash
edgecmd Configuration System HealthEndpoints Id=endpoint_1 Endpoint=endpointURL UserName=UserName Password=Password
```
- Note: if an entry with the specified id already exists, it will be updated based on the new key=value pairs

### Configuring with JSON Files
The Edge Data Store can also be configured by inputting a JSON file into the edgecmd application. File imports will completely replace the existing configuration(s) that you are attempting to change. Therefore, it cannot be used to change individual values in a facet without modifying others.

To import a bulk configuration:
```bash
edgecmd Configuration file=PathToJsonFile
```

To import a facet specific configuration file for a component:
```
edgecmd Configuration componentId facetName file=PathToJsonFile
```

To import a file with configuration for individual facets, a bulk file import operation can be used, but the file must contain just payload for the given component ID. For example, running the following command:
```bash
edgecmd Configuration file="~/Bulk_Storage_Runtime.json"
```

where the file 'Bulk_Storage_Runtime.json' contains:
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
will only affect the 'Runtime' facet in the 'Storage' component, it will not change any other components or facets. However, if a file containing the following was imported, the 'StreamStorageLimitMb' and 'StreamStorageTargetMb' values would be modified, resetting the remaining values in the facet (IngressDebugExpiration, CheckpointRateInSec, TransactionLogLimitMB, and EnableTransactionLog) to their default values:
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



## Deleting Configuration Data

The edgecmd application can be used to delete configuration data from the Edge Data Store.
To delete a configuration entry from a collection configuration (for example, 'HealthEndpoints' facet within the 'System' component) the user must specify the component ID, facet, and ID of the entry to remove followed by the 'delete' keyword.
Example:
```bash
edgecmd Configuration System HealthEndpoints Id=endpoint_1 delete
```

To delete an entire configuration file, the user must specify the component ID and facet followed by the 'delete' keyword.
Example:
```bash
edgecmd Configuration System HealthEndpoints delete
```



