---
uid: opcUaDataSelectionWindows
---

# Generating a template OPC UA data selection configuration file on Windows

On startup, the OPC UA connectivity browses the entire OPC UA server address space and exports the available OPC UA variables into a .json file for data selection. Data is collected automatically based upon user demands.  OPC UA data from OPC UA variables is read through subscriptions (unsolicited reads).

A default OPC UA data source template file will be created if there is no OPC UA data selection configuration, but a valid OPC UA data source exists.

There are two necessary prerequisites for this template data selection to be generated:

1. Add an [OPC UA component](xref:edgeSystemConfiguration) with a unique ComponentId. In Beta 2 the system is installed with a single OPC UA component, so unless a second one is desired, this step can be skipped, otherwise restart the Edge System if you are using Beta 2 before proceeding to the next step.
2. Configure a valid [OPC UA Data Source](xref:opcUaOverview)

Once these steps are taken a template OPC UA data selection will be generated in the following directory. For the purpose of this example it is assumed the ComponentId of the OPC UA component is the default OpcUa1:

```cmd
c:\ProgramData\OSIsoft\EdgeSystem\Configuration\OpcUa1_DataSelection.json
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

In a text editor edit the file and change any Selected : false, lines to Selected : true to transfer the OPC UA data to be stored in the Edge System. After that is done, in the same directory where you edited the generated file, run the following curl command:

```bash
curl -i -d "@OpcUa1_DataSelection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
```

To see the streams that have been created in Edge Storage to store the data you are writing you can run the following curl script:

```bash
curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/
```

To view the data in the streams being written  you can refer to the SDS part of this documentation.

To egress the data to OSIsoft Cloud Services or the PI System, see the egress documentation or quick starts.
