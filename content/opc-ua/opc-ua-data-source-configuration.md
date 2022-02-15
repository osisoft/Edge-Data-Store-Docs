---
uid: OPCUADataSourceConfiguration
---

# Data source configuration

For each instance of the OPC UA EDS adapter defined in system configuration, you must configure the data source from which it will receive data.

## Configure OPC UA data source

**Note:** OPC UA data source configurations cannot be modified manually. You must use the REST endpoints to add or edit the configuration.

Complete the following steps to configure the OPC UA data source:

1. Using any text editor, create a file that contains an OPC UA data source in JSON form.

    - For content structure, see [OPC UA data source example](#opc-ua-data-source-example).

1. Modify the parameters in the example to match your environment. For a table of all available parameters, see [Parameters for OPC UA data source](#parameters-for-opc-ua-data-source).

1. Save the file to the device with EDS installed using a file name based on the adapter instance name. For example, to use the adapter instance created during installation, which is OpcUa1, name the file `OpcUa1Datasource.json`.

1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:<port_number>/api/v1/configuration/<EDS_adapterId>/DataSource/`. 

The following example shows the HTTPS request using curl, which must be run from the same directory where the file is located, and uses the adapter instance created during installation, which is OpcUa1:

```bash
curl -d "@OpcUa1DataSource.config.json" -H "Content-Type: application/json" "http://localhost:5590/api/v1/configuration/OpcUa1/DataSource"
```

**Note:** After completing data source configuration, the next step is to configure data selection. You can either generate a default data selection file or create the data selection file manually. For more information, see [Data selection configuration](xref:OPCUADataSelectionConfiguration).

## Export OPC UA dynamic variables

The OPC UA EDS adapter is able to export available OPC UA dynamic variables by browsing the OPC UA hierarchies or sub-hierarchies as part of the data source configuration process. 

1. To limit browsing, specify a comma-separated collection of nodeIds in data source configuration file using the **RootNodeIds** parameter.
   
   **Note:** The nodeIds are treated as roots from which the adapter starts the browse operation.
   
   The adapter triggers an export operation after a successful connection to the OPC UA server when the data selection file does not exist in configuration directory.
  
1. Copy the exported data selection JSON file from the directory or retrieve it using a REST API call.

1. (Optional) To avoid a potentially long and resource-intensive browse operation, create the data selection file manually. Configure it before you configure the data source or push both in one configuration call together.

## Parameters for OPC UA data source

The following parameters can be used to configure an OPC UA data source:

| Parameter     | Required | Type | Nullable | Description |
|---------------|----------|------|----------|-------------|
| **EndpointURL** | Required | `string` | Yes | The endpoint URL of the OPC UA server. The following is an example of the URL format: opc.tcp://OPCServerHost:Port/OpcUa/SimulationServer<br><br>**Note:** If you change the EndpointURL on a configured OPC UA EDS adapter instance that has _ComponentID_DataSelection.json_ file exported, remove the file from the configuration directory to trigger a new browse (export).|
| **UseSecureConnection**|Optional | `Boolean` | No | When set to true, the OPC UA EDS adapter connects to a secure endpoint using OPC UA certificate exchange operation. The default is true. When set to false, the OPC UA EDS adapter connects to an unsecured endpoint of the server and certificate exchange operation is not required.<br><br>**Note:** OSIsoft recommends setting this option to false for testing purposes only. For more information on how to configure security, see [Adapter security](xref:OPCUAAdapterSecurityConfiguration).|
| **UserName** | Optional | `string` | Yes | User name for accessing the OPC UA server. |
| **Password** | Optional | `string` | Yes | Password for accessing the OPC UA server.<br><br>**Note:** OSIsoft recommends using REST to configure the data source when the password must be specified.|
| **RootNodeIds** | Optional | `string` | Yes |List of comma-separated NodeIds of those objects from which the OPC UA EDS adapter browses the OPC UA server address space. This option allows selecting only subsets of the OPC UA address by explicitly listing one or more NodeIds which are used to start the initial browse. For example: ns=5;s=85/0:Simulation, ns=3;s=DataItems. If not specified, the whole address space will be browsed.|
| **IncomingTimestamp** | Optional | `string` | No | Specifies whether the incoming timestamp is taken from the source, from the OPC UA server, or created by the OPC UA EDS adapter. Valid values are **Source**, **Server**, and **Adapter**. **Source** - Default and recommended setting. The timestamp is taken from the source timestamp field. The source is what provides data for the item to the OPC UA server, such as a field device. **Server** - In case the OPC UA item has an invalid source timestamp field, the Server timestamp can be used. **Adapter** - The OPC UA EDS adapter generates a timestamp for the item upon receiving it from the OPC UA server.|
| **StreamIdPrefix** | Optional | `string` | Yes | Specifies the prefix used for Stream IDs. Naming convention is StreamIdPrefixNodeId. **Note:** An empty string means no prefix is added to the Stream IDs. Null value means ComponentID followed by dot character will be added to the stream IDs (for example, OpcUa1.NodeId).|
| **ApplyPrefixToStreamId** | Optional | `Boolean` | No | Parameter applied to all data items collected from the data source that have custom stream ID configured. If configured, the adapter will apply the StreamIdPrefix parameter to all the streams with custom ID configured. The property does not affect any streams with default ID configured.|

## OPC UA data source example

The following is an example of valid OPC UA data source configuration:

```json
{
    "EndpointUrl": "opc.tcp://IP-Address/TestOPCUAServer",
    "UseSecureConnection": true,
    "UserName": null,
    "Password": null,
    "RootNodeIds": null,
    "IncomingTimestamp": "Source",
    "StreamIdPrefix": null
}
```
