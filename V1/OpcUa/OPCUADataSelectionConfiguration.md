---
uid: OPCUADataSelectionConfiguration
---

# Data selection configuration

In addition to the data source configuration, you need to provide a data selection configuration to specify the data you want the OPC UA EDS adapter to collect from the data sources.

When you add a data source, the OPC UA EDS adapter browses the entire OPC UA server address space and exports the available OPC UA variables into a JSON file for data selection. Data is collected automatically based upon user demands. OPC UA data from OPC UA variables is read through subscriptions (unsolicited reads).

You can either have the data selection configuration file generated for you or you can create it manually yourself.

## Generate default OPC UA data selection configuration file

A default OPC UA data selection file will be created if there is no OPC UA data selection configuration, but a valid OPC UA data source exists.

**Note:** To avoid resource-intensive browse operations, OSIsoft recommends that you manually create a data selection file instead of generating the default data selection file.

Complete the following steps for this default data selection file to be generated:

1. Add an OPC UA EDS adapter with a unique ComponentId. For details, see [Edge Data Store configuration](xref:EdgeDataStoreConfiguration).

  During the installation of Edge Data Store, enabling the OPC UA EDS adapter results in addition of a unique component that also satisfies this condition.
  
2. Configure a valid OPC UA data source. For details, see [Data source configuration](xref:OPCUADataSourceConfiguration).

  Once you complete these steps, a default OPC UA data selection configuration file will be generated in the configuration directory for the corresponding platform.
  
  The following are example locations of the file created. In this example, it is assumed that the ComponentId of the OPC UA component is the default OpcUa1:

  ```bash
  Windows: %programdata%\OSIsoft\EdgeDataStore\Configuration\OpcUa1_DataSelection.json
   
  Linux: /usr/share/OSIsoft/EdgeDataStore/Configuration/OpcUa1_DataSelection.json
  ```

3. Copy the file to a different directory.

  The contents of the file will look similar to the following:

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

4. In a text editor, edit the file and change the value of any Selected key from false to true in order to transfer the OPC UA data to be stored in Edge Data Store. 
5. In the same directory where you edited the file, run the following curl command:

  ```bash
  curl -i -d "@OpcUa1_DataSelection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
  ```

## Configure OPC UA data selection

**Note:** You cannot modify OPC UA data selection configurations manually. You must use the REST endpoints to add or edit the configuration.

Complete the following to configure the OPC UA data selection:

1. Using any text editor, create a file that contains an OPC UA data selection in JSON form.
    - For content structure, see [OPC UA data selection example](#opc-ua-data-selection-example).
2. Update the parameters as needed. For a table of all available parameters, see [Parameters for OPC UA data selection](#parameters-for-opc-ua-data-selection).
3. Save the file as _DataSelection.config.json_.
4. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSelection/`

The following example shows the HTTPS request using curl (run this command from the same directory where the file is located):

**Note:** During installation, you can add a single OPC UA EDS adapter named OpcUA1. The following example uses this component name.

```bash
curl -v -d "@DataSelection.config.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/DataSelection
```

## Parameters for OPC UA data selection

The following parameters can be used to configure OPC UA data selection:

| Parameter     | Required | Type | Nullable | Description |
|---------------|----------|------|----------|-------------|
| **Selected** | Optional | `Boolean` | No | Use this field to select or clear a measurement. To select an item, set to true. To remove an item, leave the field empty or set to false.  If not configured, the default value is false.|
| **Name**      | Optional | `string` | Yes |The optional friendly name of the data item collected from the data source. If not configured, the default value will be the stream id. |
| **NodeId**    | Required | `string` | Yes | The NodeId of the variable. |
| **StreamID** | Optional | `string` | Yes | The custom stream ID used to create the streams. If not specified, the OPC UA EDS adapter will generate a default stream ID based on the measurement configuration. A properly configured custom stream ID follows these rules:<br><br>Is not case-sensitive.<br>Can contain spaces.<br>Cannot start with two underscores ("__").<br>Can contain a maximum of 100 characters.<br>Cannot use the following characters: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % < > &#124;<br>Cannot start or end with a period.<br>Cannot contain consecutive periods.<br>Cannot consist of only periods.

## OPC UA data selection example

The following is an example of valid OPC UA data selection configuration:

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

