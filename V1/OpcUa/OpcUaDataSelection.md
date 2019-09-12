---
uid: opcUaDataSelection
---
# Generating a template OPC UA data selection configuration file

When a data source is added, the OPC UA EDS adapter browses the entire OPC UA server address space and exports the available OPC UA variables into a .json file for data selection. Data is collected automatically based upon user demands.  OPC UA data from OPC UA variables is read through subscriptions (unsolicited reads).

A default OPC UA data source template file will be created if there is no OPC UA data selection configuration, but a valid OPC UA data source exists.

There are two necessary prerequisites for this template data selection to be generated:

1. Add an [OPC UA EDS adapter](xref:EdgeDataStoreConfiguration) with a unique ComponentId. During install of the Edge Data Store, enabling the OPC UA adapter results in addition of a unique component that also satisfies this condition.
2. Configure a valid [OPC UA Data Source](xref:opcUaOverview)

Once these steps are taken a template OPC UA data selection will be generated in the **Configuration** directory for the corresponding platform, see [Linux and Windows platform differences](xref:linuxWindows). The following are example locations of the file created - in this example it is assumed the ComponentId of the OPC UA component is the default OpcUa1:

```bash
Windows: %programdata%\OSIsoft\EdgeDataStore\Configuration\OpcUa1_DataSelection.json

Linux: /usr/share/OSIsoft/EdgeDataStore/Configuration/OpcUa1_DataSelection.json
```

Copy the file to a different directory to edit it. The contents of the file will look something like:

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

In a text editor, edit the file and change the value of any **Selected** key from false to true in order to transfer the OPC UA data to be stored in the Edge Data Store. After that is done, in the same directory where you edited the generated file, run the following curl command:

```bash
curl -i -d "@OpcUa1_DataSelection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
```

To see the streams that have been created in Edge Storage to store the data you are writing you can run the following curl script:

```bash
curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/
```

To view the data in the streams being written  you can refer to the SDS part of this documentation.

To egress the data to OSIsoft Cloud Services or the PI System, see the egress documentation or quick starts.
