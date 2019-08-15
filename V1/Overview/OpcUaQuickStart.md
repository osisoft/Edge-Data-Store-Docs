---
uid: opcUaQuickStart
---

# OPC UA connectivity quick start

This quick start gives an overview on how to set up the OPC UA connectivity. Edge Data Store comes with a single OPC UA connectivity installed. It is named OpcUa1. If you want a second OPC UA connectivity, refer to [Edge Data Store Configuration](xref:edgeSystemConfiguration) on how to add a new component to Edge Data Store. The following example changes if you configure a second connectivity. Replace OpcUa1 with the name of the component you have added.

## Configure an OPC UA data source

1. Create a file in JSON format describing the location of the OPC UA data source. 
2. Modify the following values to match your environment.

```json
{
    "EndpointUrl": "opc.tcp://<ip address>:<port - often 62541>/<server path>",
    "UseSecureConnection": false,
    "UserName": null,
    "Password": null,
    "RootNodeIds": null,
    "IncomingTimestamp": "Source",
    "StreamIdPrefix": "OpcUa"
}
```

3. Enter the correct IP address and port for your OPC UA data source.
4. Save the file with the name OpcUa1Datasource.json.
5. Run the following curl script from the same directory where the file is located. **Note:** You should run the script on the same computer where Edge Data Store is installed:

```bash
curl -i -d "@OpcUa1Datasource.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Datasource
```

When this command completes successfully (a 204 is returned by curl), your OPC UA data source has been created. If you get a 400 error, check your JSON file for errors. If you get a 404 or 500 error, check to make sure Edge Data Store is running on your computer.

## Configure OPC UA data selection

1. Select the OPC UA data you want to store in Edge Data Store by configuring OPC UA data selection. The following is a sample JSON for five OPC UA values.

2. Modify the values as appropriate for your OPC UA environment.

```json
[{
        "Selected": true,
        "Name": "Cold Side Inlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideInletTemperature",
        "StreamId": null
    },
    {
        "Selected": true,
        "Name": "Hot Side Inlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideInletTemperature",
        "StreamId": null
    },
    {
        "Selected": true,
        "Name": "Hot Side Outlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideOutletTemperature",
        "StreamId": null
    },
    {
        "Selected": true,
        "Name": "Cold Side Inlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideInletTemperature",
        "StreamId": null
    },
    {
        "Selected": true,
        "Name": "Hot Side Outlet Temperature",
        "NodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideOutletTemperature",
        "StreamId": null
    }
]
```

3. Save the JSON content above in a text file and name it OpcUa1Dataselection.json. 
**Note:** When you run the following curl script, the system will be configured to collect OPC UA data values.

```bash
curl -i -d "@OpcUa1Dataselection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
```

To see the streams that have been created in data store to store the data you are writing, run the following curl script:

```bash
curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/
```

To view the data in the streams being written by OPC UA, see [Sequential Data Store](xref:sdsOverview).

 To egress the data to OSIsoft Cloud Services or the PI System, see [Egress](xref:egress) or [PI Egress Quick Start](xref:piEgressQuickStart).
