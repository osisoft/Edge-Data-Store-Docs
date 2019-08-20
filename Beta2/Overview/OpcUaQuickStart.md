---
uid: opcUaQuickStart
---

# Edge OPC UA quick start

This topic is a quick tour of setting up the Edge OPC UA component. Beta 2 comes with a single OPC UA adapter installed. It is named OpcUa1. If a second OPC UA adapter is desired in Beta 2, please reference [Edge System Configuration](xref:edgeSystemConfiguration) on how to add a new component to Edge System. The example below covers configuring the default adapter. If another adapter has been installed, please substitute the name of the installed adapter in the below example for OpcUa1.

## Configure an OPC UA data source

1. Create a file in JSON format describing the location of the data source. Modify the following values to match your environment.

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

1. Enter the correct IP address and port for your OPC UA data source.
1. Save the file with the name OpcUa1Datasource.json.
1. Run the following curl script from the same directory where the file is located. You should run the script on the same computer where the Edge System is installed:

```bash
curl -i -d "@OpcUa1Datasource.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Datasource
```

When this command completes successfully (a 204 is returned by curl), your OPC UA data source has been created. If you get a 400 error, check your JSON file for errors. If you get a 404 or 500 error, check to make sure Edge System is running on your computer.

## Configure OPC UA data selection

Select the OPC UA data you want to store in Edge System by configuring OPC UA data selection. The following is a sample JSON for five OPC UA values.

1. Modify the values as appropriate for your environment.

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

1. Save the JSON content above in a text file and name it OpcUa1Dataselection.json. 
1. Run the following curl script so the system will be configured to collect Opc Ua data values.

```bash
curl -i -d "@OpcUa1Dataselection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
```

To see the streams that have been created in Edge Storage to store the data you are writing, you can run the following curl script:

```bash
curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/
```

To view the data in the streams being written, you can refer to the SDS part of this documentation.

To egress the data to OSIsoft Cloud Services or the PI System, see the egress documentation or quick starts.
