---
uid: OPCUADataSelectionConfiguration1-0
---

# Data selection configuration

After configuring the data source, create a data selection configuration file to specify the data for the OPC UA EDS adapter instance to collect from the data source.

When you add a data source, the OPC UA EDS adapter browses the OPC UA server address space and exports the available OPC UA variables into a JSON file for data selection. If RootNodeIds are specified in the data source configuration, only those nodeIds are browsed. Data is collected automatically based upon user demands. OPC UA data from OPC UA variables is read through subscriptions (unsolicited reads).

You can either have the data selection configuration file generated for you or you can create it manually yourself.

## Configure OPC UA data selection using a generated file

A default OPC UA data selection file will be created if there is no OPC UA data selection configuration, but a valid OPC UA data source exists.

**Note:** To avoid resource-intensive browse operations, OSIsoft recommends that you manually create a data selection file instead of generating the default data selection file.

Complete the following steps to generate the default data selection file and use it to configure data selection:

1. Add an OPC UA EDS adapter instance with a unique ComponentId either manually or during the EDS installation. For details, see [Edge Data Store configuration](xref:EdgeDataStoreConfiguration1-0).
  
2. Configure a valid OPC UA data source. For details, see [Data source configuration](xref:OPCUADataSourceConfiguration1-0).

  Once you complete these steps, a default OPC UA data selection configuration file is generated in the configuration directory with   the file name based on the ComponentId.
  
  The following are example locations of the file created using the adapter instance created during installation, which is OpcUa1:

  ```bash
  Windows: %programdata%\OSIsoft\EdgeDataStore\Configuration\OpcUa1_DataSelection.json
   
  Linux: /usr/share/OSIsoft/EdgeDataStore/Configuration/OpcUa1_DataSelection.json
  ```

3. Copy the file to a different directory and open it using any text editor.

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

4. To ingress a stream to Edge Data Store, change the value of the **Selected** key from `false` to `true`. All streams in the auto generated data selection file are initially set to `false`.
5. Save the file.
6. Run the following curl script from the directory where the file is located, updating the file name and destination in the script if needed:

  ```bash
  curl -d "@OpcUa1_DataSelection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
  ```

## Configure OPC UA data selection by manually creating the file 

**Note:** OPC UA data selection configurations cannot be modified manually. Use the REST endpoints to add or edit the configuration.

Complete the following steps to configure the OPC UA data selection:

1. Using any text editor, create a file that contains an OPC UA data selection in JSON form.
    - For content structure, see [OPC UA data selection example](#opc-ua-data-selection-example).
2. Update the parameters as needed. For a table of all available parameters, see [Parameters for OPC UA data selection](#parameters-for-opc-ua-data-selection).
3. Save the file to the device with Edge Data Store installed with the name _DataSelection.config.json_.
4. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:<port_number>/api/v1/configuration/<EDS adapterId>/DataSelection/`

The following example shows the HTTPS request using curl, which must be run from the same directory where the file is located, and uses the adapter instance created during installation, which is OpcUa1:

```bash
curl -d "@DataSelection.config.json" -H "Content-Type: application/json" "http://localhost:5590/api/v1/configuration/OpcUa1/DataSelection"
```

## Parameters for OPC UA data selection

The following parameters can be used to configure OPC UA data selection:

| Parameter     | Required | Type | Nullable | Description |
|---------------|----------|------|----------|-------------|
| **Selected** | Optional | `Boolean` | No | Use this field to select a measurement to be collected. To select an item, set to true. To remove an item and not collect its data, leave the field empty or set to false. If not configured, the default value is false.|
| **Name**      | Required | `string` | Yes |The friendly name of the data item collected from the data source. The field is populated with the DisplayName value from the OPC UA server when the data selection configuration is populated by the adapter. |
| **NodeId**    | Required | `string` | Yes | The NodeId of the variable. |
| **StreamID** | Optional | `string` | Yes | The custom stream ID used to create the streams. If not specified, the OPC UA EDS adapter will generate a default stream ID based on the measurement configuration. A properly configured custom stream ID follows these rules:<br><br>Is not case-sensitive.<br>Can contain spaces.<br>Cannot start with two underscores ("__").<br>Can contain a maximum of 100 characters.<br>Cannot use the following characters: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % < > &#124;<br>Cannot start or end with a period.<br>Cannot contain consecutive periods.<br>Cannot consist of only periods.|

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

