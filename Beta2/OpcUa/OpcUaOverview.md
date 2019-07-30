---
uid: opcUaOverview
---

# OPC UA Connectivity

## Overview
The OPC UA connectivity transfers time-series data from OPC UA devices into the Edge System.

On startup, the OPC UA connectivity browses the entire OPC UA server address space and exports the available OPC UA variables into a .json file for data selection. Data is collected automatically based upon user demands.  OPC UA data from OPC UA variables is read through subscriptions (unsolicited reads).

OPC UA is a standard, which ensures open connectivity, interoperability, security, and reliability of industrial automation devices and systems. OPC UA is recognized as one of the key communication and data modeling technologies of Industry 4.0, due to the fact that it works with many software platforms and that it is completely scalable and flexible.

To utilize the OPC UA connectivity component of the Edge System, the System Configuration must be configured to include a component by providing a unique componentId and a componentType of "OpcUa" for it to be loaded by the Edge System; In addition, the OPC UA data source and data selection must be configured for the component to collect the data. The data source specifies where to poll the data from, and the data selection specifies what measurements to collect data for.

## Configuration of OPC UA component of the Edge System

The default Edge System comes preconfigured with an OPC UA component. Each component can only be configured to collect data from a single OPC UA server. If an OPC UA component is not configured during the System Configuration, or it is desired to collect data from more than one OPC UA server, additional OPC UA component(s) can be added.

The following procedure is for adding a new OPC UA component to the Edge System Configuration. Adding any new connectivity component to the System Configuration requires the Edge System restart for the changes to take effect in current version.

1. Using any text editor, create a file that contains a new component in JSON form
    - See OPC UA Component Example section below for content structure
1. Save the file as "Opcua2Component.config.json".
1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/System/Components/`
    - Example using cURL:

```bash
curl -v -d "@Opcua2Component.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/System/Components/"
```
4. Restart the Edge System.

### OPC UA component Example

Below is an example of OPC UA component with a componentId "OpcUa2".

```json
[
    {
        "componentId": "OpcUa2",
        "componentType": "OPCUA"
    }
]
```

## Configuration of OPC UA Data Source

The OPC UA data source configuration specifies where it will be receiving data from.

### Procedure for Configuring OPC UA Data Source

> **Note:** You cannot modify OPC UA data source configurations manually. You must use the REST endpoints to add/edit the configuration.

The following procedure is for configuring OPC UA data source.

1. Using any text editor, create a file that contains a OPC UA data source in JSON form
    - See OPC UA Data Source Example section below for content structure
    - See Parameters for OPC UA Data Source section below for a table of all available parameters
1. Save the file as "DataSource.config.json".
1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<componentId>/DataSource/`
    - Example using cURL:

```bash
curl -v -d "@DataSource.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/<componentId>/DataSource"
```

### Parameters for OPC UA Data Source

The following parameters are available for configuring a OPC UA data source.

| Parameter | Required | Type |	Description |
|-----------|----------|------|-------------|
| **EndpointURL** | Required | string | The endpoint URL of the OPC UA server. The following is an example of the URL format: opc.tcp://OPCServerHost:Port/OpcUa/SimulationServer<br><br>**Note:** If the EndpointURL is changed on a configured OPC UA connectivity that has DataCollection.config.csv file exported, the DataCollection.config.csv file will need to be relocated from the configuration directory to trigger a new browse (export).|
| **UseSecureConnection**|Optional | bool | When set to true, the OPC UA connectivity connects to a secure endpoint using OPC UA certificate exchange operation. The default is true. When set to false, the OPC UA connectivity connects to an unsecured endpoint of the server and certificate exchange operation is not required.<br><br>**Note:** OSIsoft recommends setting this option to false for testing purposes only.|
| **UserName** | Optional | string | User name for accessing the OPC UA server. Default is null |
| **Password** | Optional | string | Password for accessing the OPC UA server. Default is null.<br><br>**Note:** OSIsoft highly recommends using REST to configure the data source when the password must be specified.|
| **RootNodeIds** | Optional | string |List of comma-separated NodeIds of those objects from which the OPC UA connectivity browses the OPC UA server address space. This option allows selecting only subsets of the OPC UA address by explicitly listing one or more NodeIds which are used to start the initial browse. For example: ns=5;s=85/0:Simulation, ns=3;s=DataItems<br><br>Default value is null, which means the whole address space will be browsed.|
| **IncomingTimestamp**	| Optional | string | Specifies whether the incoming timestamp is taken from the source, from the OPC UA server, or should be created by the OPC UA connectivity instance.<br><br>**Source** - Default and recommended setting. The timestamp is taken from the source timestamp field. The source is what provides data for the item to the OPC UA server, such as a field device.<br><br>**Server** - In case the OPC UA item has an invalid source timestamp field, the Server timestamp can be used.<br><br>**Connector** - The OPC UA connectivity generates a timestamp for the item upon receiving it from the OPC UA server.|
| **StreamIdPrefix** | Optional | string | Specifies what prefix is used for Stream IDs. Naming convention is StreamIdPrefix.NodeId. Default is null.<br>**Note:** An empty string means no prefix will be added to the Stream IDs.|

### OPC UA Data Source Example

Below is an example of valid OPC UA Data Source configuration.

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

## Configuration of OPC UA Data Selection

The OPC UA data selection configuration specifies the data points for which the OPC UA connectivity component will collect data from the data source.

### Procedure for Configuring OPC UA Data Selection

> **Note:** You cannot modify OPC UA data selection configurations manually. You must use the REST endpoints to add/edit the configuration. See [REST Urls](#rest-urls).

The following procedure is for configuring OPC UA data selection.

1. Using any text editor, create a file that contains a OPC UA data selection in JSON form
    - See OPC UA Data Selection Example section below for content structure
    - See Parameters for OPC UA Data Selection section below for a table of all available parameters
1. Save the file as "DataSelection.config.json"
1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<componentId>/DataSelection/`
    - Example using cURL:

```bash
curl -v -d "@DataSelection.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/<componentId>/DataSelection"
```

### Parameters for OPC UA Data Selection

Configuration parameters for OPC UA data selection
| Parameter     | Required | Type | Description
|---------------|----------|------|-------------|
| **Selected**  | Required | string | Indicates if the item is selected for data collection.|
| **Name**      | Required | string | The name of the OPC UA variable. |
| **NodeId**    | Required | string | The NodeId of the variable. |
| **StreamId**  | Required | string | Allows for changing ID of items to a custom StreamId from a default naming convention. |

### OPC UA Data Selection Example

Below is an example of valid OPC UA Data Selection configuration.

```json
[
 {
    "Selected": true,
    "Name": "Random1",
    "NodeId": "ns=5;s=Random1",
    "StreamId": "CustomStreamName"
  },
  {
    "Selected": false,
    "Name": "Sawtooth1",
    "NodeId": "ns=5;s=Sawtooth1",
    "StreamId": null
  },
  {
    "Selected": true,
    "Name": "Sinusoid1",
    "NodeId": "ns=5;s=Sinusoid1",
    "StreamId": null
  }
]
```
