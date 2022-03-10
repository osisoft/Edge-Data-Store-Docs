---
uid: OPCUADataSelectionConfiguration
---

# Data selection configuration

After configuring the data source, create a data selection configuration file to specify the data for the OPC UA EDS adapter instance to collect from the data source.

When you add a data source, the OPC UA EDS adapter browses the OPC UA server address space and exports the available OPC UA variables into a JSON file for data selection. If RootNodeIds are specified in the data source configuration, only those nodeIds are browsed. Data is collected automatically based upon user demands. OPC UA data from OPC UA variables is read through subscriptions (unsolicited reads).

You can either have the data selection configuration file generated for you or you can create it manually yourself.

## Configure OPC UA data selection using a generated file

A default OPC UA data selection file will be created if there is no OPC UA data selection configuration, but a valid OPC UA data source exists.

**Note:** To avoid resource-intensive browse operations, OSIsoft recommends that you manually create a data selection file instead of generating the default data selection file.

To generate the default data selection file and use it to configure data selection, follow these steps:

1. Add an OPC UA EDS adapter instance with a unique `ComponentId` either manually or during the EDS installation. For details, see [Edge Data Store configuration](xref:EdgeDataStoreConfiguration).
  
1. Configure a valid OPC UA data source. For details, see [Data source configuration](xref:OPCUADataSourceConfiguration).

  Once you complete these steps, a default OPC UA data selection configuration file is generated in the configuration directory with   the file name based on the ComponentId.
  
  The following are example locations of the file created using the adapter instance created during installation, which is OpcUa1:

  ```bash
  Windows: %programdata%\OSIsoft\EdgeDataStore\Configuration\OpcUa1_DataSelection.json
   
  Linux: /usr/share/OSIsoft/EdgeDataStore/Configuration/OpcUa1_DataSelection.json
  ```

1. Copy the file to a different directory and open it using any text editor.

  It will look similar to the following example:

  ```json
  [
   {
     "Selected": false,
     "Name": "Cold Side Inlet Temperature",
     "NodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideInletTemperature",
     "StreamId": null
    },
    {
     "Selected": false,
     "Name": "Cold Side Outlet Temperature",
     "NodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideOutletTemperature",
     "StreamId": null
    }
  ]
  ```

1. To ingress a stream to Edge Data Store, change the value of the **Selected** key from `false` to `true`. All streams in the auto generated data selection file are initially set to `false`.

1. Save the file.

1. Run the following curl script from the directory where the file is located, updating the file name and destination in the script if needed:

  ```bash
  curl -d "@OpcUa1_DataSelection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
  ```

## Configure OPC UA data selection by manually creating the file 

**Note:** OPC UA data selection configurations cannot be modified manually. Use the REST endpoints to add or edit the configuration.

To configure the OPC UA data selection, follow these steps:

1. Using any text editor, create a file that contains an OPC UA data selection in JSON form.

    - For content structure, see [OPC UA data selection examples](#opc-ua-data-selection-examples).

1. Update the parameters as needed. For a table of all available parameters, see [Parameters for OPC UA data selection](#parameters-for-opc-ua-data-selection).

1. Save the file to the device with Edge Data Store installed with the name `DataSelection.config.json`.

1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:<port_number>/api/v1/configuration/<EDS adapterId>/DataSelection/`

The following example shows the HTTPS request using curl, which must be run from the same directory where the file is located, and uses the adapter instance created during installation, which is OpcUa1:

```bash
curl -d "@DataSelection.config.json" -H "Content-Type: application/json" "http://localhost:5590/api/v1/configuration/OpcUa1/DataSelection"
```

## Parameters for OPC UA data selection

The following parameters are available for configuring an OPC UA data selection:

| Parameter     | Required | Type | Description |
|---------------|----------|------|-------------|
| **selected** | Optional | `boolean` | Use this field to select or clear a measurement. To select an item, set to true. To remove an item, leave the field empty or set to false. <br><br>Allowed value: `true` or `false` <br>Default value: `true`|
| **name**      | Optional | `string` | Name of the data item collected from the data source. <br><br>Default value: `null` <br>results in **StreamId** value being used also as a **Name** |
| **nodeId**    | Required | `string` | The NodeId of the variable.<br><br>Examples<br>`"ns=5;AString"`<br>`"ns=2;i=203"`<br>`"ns=<NamespaceIndex>;<IdentifierType>=<Identifer>"` |
| **streamID** | Optional | `string` | The custom stream ID used to create the streams. If not specified, the adapter will generate a default stream ID based on the measurement configuration. The StreamId serves as the unique identifier of a data selection item. A properly configured custom stream ID follows these rules:<br><br>Is not case-sensitive.<br>Can contain spaces.<br>Cannot start with two underscores ("__").<br>Can contain a maximum of 2000 characters.<br>Cannot use the following characters: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % < > &#124;<br>Cannot start or end with a period.<br>Cannot contain consecutive periods.<br>Cannot consist of only periods.<br><br>For more information on how the adapter encodes special characters in the **StreamId**, see [Egress endpoints](xref:EgressEndpointsConfiguration#special-characters-encoding). |
| **dataFilterId** | Optional | `string` | Enables data filtering for this data selection item if the ID of a data filter is specified.<br>**Note:** If the specified **DataFilterId** does not exist, unfiltered data is sent until that **DataFilterId** is created. |

## OPC UA data selection examples

The following are examples of valid OPC UA data selection configurations:

### Minimal data selection configuration

```json
[
 {
    "nodeId": "ns=5;s=Random1"
  },
  {
    "nodeId": "ns=5;s=Sawtooth1"
  },
  {
    "nodeId": "ns=5;s=Sinusoid1"
  }
]
```

 ### Complete data selection configuration

```json
[
 {
    "selected": true,
    "name": "CustomStreamName",
    "nodeId": "ns=5;s=Random1",
    "streamId": "CustomStreamName",
    "dataFilterId": "DuplicateData"
  },
  {
    "selected": false,
    "name": null,
    "nodeId": "ns=5;s=Sawtooth1",
    "streamId": null,
    "dataFilterId": "DuplicateData"
  },
  {
    "selected": true,
    "name": "5.Sinusoid1",
    "nodeId": "ns=5;s=Sinusoid1",
    "streamId": null,
    "dataFilterId": null
  }
]
```

## REST URLs

| Relative URL | HTTP verb | Action |
| ------------ | --------- | ------ |
| api/v1/configuration/\<ComponentId\>/DataSelection  | `GET` | Retrieves the data selection configuration, including all data selection items. |
| api/v1/configuration/\<ComponentId\>/DataSelection  | `PUT` | Configures or updates the data selection configuration. The adapter starts collecting data for each data selection item when the following conditions are met:<br/><br/>&bull; The data selection configuration `PUT` request is received.<br/>&bull; A data source configuration is active. |
| api/v1/configuration/\<ComponentId\>/DataSelection | `DELETE` | Deletes the active data selection configuration. The adapter stops collecting data. |
| api/v1/configuration/\<ComponentId\>/DataSelection | `PATCH` | Allows partial updates of configured data selection items.<br/><br/>**Note:** The request must be an array containing one or more data selection items. Each item in the array must include its **StreamId**. |
| api/v1/configuration/\<ComponentId\>/DataSelection/\<StreamId\> | `PUT` | Updates or creates a new data selection item by **StreamId**. For new items, the adapter starts collecting data after the request is received. |
| api/v1/configuration/\<ComponentId\>/DataSelection/\<StreamId\> | `DELETE` | Deletes a data selection item from the configuration by **StreamId**. The adapter stops collecting data for the deleted item. |

**Note:** Replace \<ComponentId\> with the Id of your OPC UA component, for example _OpcUa1_.
