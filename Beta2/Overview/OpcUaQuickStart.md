---
uid: opcUaQuickStart
---

# Edge Opc Ua Quick Start

This document is a quick tour of setting up the Edge Opc Ua component.

## Configuring an Opc Ua Data Source

The first step in configuring Edge Opc Ua is to create a file in JSON format describing the location of the data source. Please modify the values below to match your environment.

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

Enter the correct IP address and port for your Opc Ua data source and save the file with the name OpcUa1Datasource.json. Then run the following curl script from the same directory where the file is located. The script should be run on the same computer where the Edge System is installed:

```bash
curl -i -d "@OpcUa1Datasource.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Datasource
```

When this command completes successfully (a 204 is returned by curl), your Opc Ua data source has been created. If you get a 400 error check your JSON file for errors, if you get a 404 or 500 error check to make sure the Edge System is running on your computer.

## Configuring Opc Ua Data Selection

The next step in setting up Opc Ua is to select the Opc Ua data you wish to store in the Edge System. This is done by configuring Opc Ua data selection. Sample JSON for 5 Opc Ua values is below - please modify the values as appropriate for your environment.

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

Save the JSON content above in a text file and name it OpcUa1Dataselection.json. When you run the following curl script the system will be configured to collect Opc Ua data values.

```bash
curl -i -d "@OpcUa1Dataselection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
```

To see the streams that have been created in Edge Storage to store the data you are writing you can run the following curl script:

```bash
curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/
```

To view the data in the streams being written  you can refer to the SDS part of this documentation.

To egress the data to OSIsoft Cloud Services or the PI System, see the egress documentation or quick starts.
