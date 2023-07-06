---
uid: OPCUADataSelectionConfiguration
---

# Data selection configuration

After configuring the data source, create a data selection configuration file to specify the data for the OPC UA EDS adapter instance to collect from the data source.

A new data selection configuration can be done by performing a discovery as oulined in the adapter documentation topic: [Discovery](xref:configuration/discovery).

## Parameters for OPC UA data selection

The following parameters can be used to configure OPC UA data selection.

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
