---
uid: OPCUADataSourceConfiguration
---

# Data source configuration

For each instance of the OPC UA EDS adapter defined in system configuration, you must configure the data source from which it will receive data.

## Configure OPC UA data source

**Note:** You cannot manually configure OPC UA data source configurations. You must use the REST endpoints to add or edit the configuration.

To configure the OPC UA data source:

1. Using any text editor, create a file that contains an OPC UA data source in JSON format.

    - For content structure, see [OPC UA data source examples](#opc-ua-data-source-examples).

2. Modify the parameters in the example to match your environment. For a table of all available parameters, see [Parameters for OPC UA data source](#parameters-for-opc-ua-data-source).

3. Save the file to the device with EDS installed using a file name based on the adapter instance name. For example, to use the adapter instance created during installation, which is OpcUa1, name the file `OpcUa1Datasource.json`.

4. Use any tool capable of making HTTP requests to execute a `POST` command with the contents of that file to the following endpoint: `http://localhost:<port_number>/api/v1/configuration/<EDS_adapterId>/DataSource/`.

    The following example shows the HTTPS request using curl or EdgeCmd, which you must run from the same directory where the file is located, and uses the adapter instance created during installation, which is OpcUa1:

    ### [curl](#tab/tabid-1)

    ```bash
    curl -d "@OpcUa1DataSource.config.json" -H "Content-Type: application/json" "http://localhost:5590/api/v1/configuration/OpcUa1/DataSource"  
    ```
        
    ### [EdgeCmd](#tab/tabid-2)
    
    Tab content-2-1.
    ***

**Note:** After completing data source configuration, you need to configure data selection next. You can either generate a default data selection file or create the data selection file manually. For more information, see [Data selection configuration](xref:OPCUADataSelectionConfiguration).

## Export OPC UA dynamic variables

The OPC UA EDS adapter is able to export available OPC UA dynamic variables by browsing the OPC UA hierarchies or sub-hierarchies as part of the data source configuration process.

1. To limit browsing, specify a comma-separated collection of nodeIds in data source configuration file using the **RootNodeIds** parameter.

   **Note:** The nodeIds are treated as roots from which the adapter starts the browse operation.

   The adapter triggers an export operation after a successful connection to the OPC UA server when the data selection file does not exist in configuration directory.
  
2. Copy the exported data selection JSON file from the directory or retrieve it using a REST API call.

3. (Optional) To avoid a potentially long and resource-intensive browse operation, create the data selection file manually. Configure it before you configure the data source or push both in one configuration call together.

## Parameters for OPC UA data source

The following parameters are available for configuring an OPC UA data source:

| Parameter | Required | Type | Description |
|-----------|----------|------|-------------|
| **endpointURL** | Required | `string` | The endpoint URL of the OPC UA server in opc.tcp format. The following is an example of the URL format: `opc.tcp://OPCServerHost:Port/OpcUa/SimulationServer`<br><br>**Note:** If you change the EndpointURL on a configured adapter that has _ComponentID_DataSelection.json_ file exported, you need to remove the _ComponentID_DataSelection.json_ file from the configuration directory to trigger a new browse (export). <br><br>Allowed value: well-formed opc.tcp address|
| **useSecureConnection**|Optional | `boolean` | When set to true, the adapter connects to a secure endpoint using OPC UA certificate exchange operation. The default is true. When set to false, the adapter connects to an unsecured endpoint of the server and certificate exchange operation is not required.<br><br>**Note:** OSIsoft recommends setting this option to false for testing purposes only. <br><br> Allowed value: `true` or `false`<br>Default value: `true`|
| **userName** | Optional | `string` | User name for accessing the OPC UA server. <br><br>Allowed value: any string <br> Default value: `null`|
| **password** | Optional | `string` | Password for accessing the OPC UA server.<br><br>**Note:** OSIsoft recommends using REST to configure the data source when the password must be specified because REST will encrypt the password. If you do not use REST, the plain text password is stored on-disk. <br><br>Allowed value: any string <br> Default value: `null`|
| **incomingTimestamp** | Optional | `string` | Specifies whether the incoming timestamp is taken from the source, from the OPC UA server, or should be created by the adapter instance. <br> **Source** - Default and recommended setting. The timestamp is taken from the source timestamp field. The source is what provides data for the item to the OPC UA server, such as a field device.<br> **Server** - In case the OPC UA item has an invalid source timestamp field, the Server timestamp can be used.<br> **Adapter** - The adapter generates a timestamp for the item upon receiving it from the OPC UA server. <br><br>Allowed value: `Source`, `Server`, or `Adapter` <br> Default value: `Source`|
| **streamIdPrefix** | Optional | `string` | Specifies what prefix is used for Stream IDs. The naming convention is `{StreamIdPrefix}{StreamId}`. An empty string means no prefix will be added to the Stream IDs and names. A `null` value defaults to _ComponentID_ followed by a period.<br><br>Example: `OpcUa1.{NamespaceIndex}.{Identifier}`<br><br>**Note:** Every time you change the StreamIdPrefix of a configured adapter, for example when you delete and add a data source, you need to restart the adapter for the changes to take place. New streams are created on adapter restart and pre-existing streams are no longer updated. <br><br>Allowed value: any string <br> Default value: `null`|
| **defaultStreamIdPattern** | Optional | `string` | Specifies the default stream Id pattern to use. Possible parameters: `{NamespaceIndex}`<sup>1</sup>, `{Identifier}`. <br><br>Allowed value: any string<br>Default value: `{NamespaceIndex}.{Identifier}` |
| **dataCollectionMode** | Optional | `string` | Specifies the data collection mode the adapter is in. The following data collection modes are available:<br> **HistoryOnly** <sup>2</sup> - The adapter component does not get started and history recovery on-demand is enabled. For more information, see <xref:OnDemandHistoryRecoveryConfiguration>.<br>**CurrentOnly** - The adapter component operates normally and on-demand history recovery is disabled.<br>**CurrentWithBackfill** <sup>2</sup> - The adapter component operates normally, but disconnections are recorded based on device status. History recovery backfills data once device status is `good`. On-demand history recovery is disabled. For more information, see <xref:AutomaticHistoryRecovery>.<br>Changing the mode requires a restart of the adapter component.

<sup>1</sup> NamespaceIndex refers to the number specified in the `ns` keyword in the **RootNodeIds** parameter.

<sup>2</sup> Historical values are collected only for OPC UA items that have the AccessLevel attribute set to `HistoryRead`.

## OPC UA data source examples

The following are examples of valid OPC UA data source configurations:

### Minimal data source configuration

```json
{
    "endpointUrl": "opc.tcp://<IP-Address>:<Port>/<TestOPCUAServer>"
}
```

### Complete data source configuration

```json
{
    "endpointUrl": "opc.tcp://<IP-Address>:<Port>/<TestOPCUAServer>",
    "useSecureConnection": true,
    "userName": null,
    "password": null,
    "incomingTimestamp": "Source",
    "streamIdPrefix": null,
    "defaultStreamIdPattern": "{NamespaceIndex}.{Identifier}",
    "dataCollectionMode": "CurrentWithBackfill"
}
```

## REST URLs

| Relative URL | HTTP verb | Action |
| ------------ | --------- | ------ |
| api/v1/configuration/\<ComponentId\>/DataSource | `GET` | Retrieves the data source configuration. |
| api/v1/configuration/\<ComponentId\>/DataSource | `POST` | Creates the data source configuration. The adapter starts collecting data after the following conditions are met:<br/><br/>&bull; The data source configuration `POST` request is received.<br/>&bull; A data selection configuration is active. |
| api/v1/configuration/\<ComponentId\>/DataSource | `PUT` | Configures or updates the data source configuration. Overwrites any active data source configuration. If no configuration is active, the adapter starts collecting data after the following conditions are met:<br/><br/>&bull; The data source configuration `PUT` request is received.<br/>&bull; A data selection configuration is active. |
| api/v1/configuration/\<ComponentId\>/DataSource | `DELETE` | Deletes the data source configuration. After the request is received, the adapter stops collecting data. |

**Note:** Replace \<ComponentId\> with the Id of your OPC UA component, for example _OpcUa1_.
