---
uid: opcUaQuickStart
---

# OPC UA EDS adapter quick start

The OPC UA EDS adapter is a component of Edge Data Store that defines connections to and receives data from OPC UA capable devices. The OPC UA EDS adapter can connect to multiple devices by defining one instance of the adapter for each device. The EDS installation includes the OPC UA EDS adapter and the option to add a single OPC UA EDS adapter instance. Add additional instances after installation using the system components configuration. For more information about installation, see [Install Edge Data Store](xref:InstallEdgeDataStore). To get started collecting data with an instance of the OPC UA EDS adapter, you need to configure the data source, which specifies the device connection, and the data selection, which specifies the data to collect.

The following diagram depicts the data flow for a single instance of OPC UA EDS adapter instance:

![OPC UA EDS](https://osisoft.github.io/Edge-Data-Store-Docs/content/images/OPCUAConfiguration.jpg "OPC UA Configuration")

The adapter instance polls the OPC UA device and then collects data from the device. The adapter then sends the data to the storage component where it is held until it can be egressed to permanent storage in PI Server or OSIsoft Cloud Services. The adapter instance can be configured from the device where EDS is installed, and EDS collects health information about the adapter that can be egressed.

## Configure an OPC UA data source

To configure a data source to connect an OPC UA device to an OPC UA EDS adapter instance:

1. Using a text editor, copy the example below to create a file in JSON format with the location of the OPC UA data source.  

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

1. Modify the values in the example to match your environment, including the IP address and port for the OPC UA data source.

1. Save the file to the device with EDS installed using a file name based on the adapter instance name. For example, to use the adapter instance created during installation, which is `OpcUa1`, name the file `OpcUa1Datasource.json`.

1. Run the following curl script from the directory where the file is located, updating the file name and the destination in the script if needed.

```bash
curl -d "@OpcUa1Datasource.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Datasource
```

When the command completes successfully (a 204 message is returned by curl), the OPC UA data source has been created. If you receive a 400 error, check the data source JSON file for errors. If you receive a 404 or 500 error, check that Edge Data Store is running on the device.

## Configure OPC UA data selection

When you create the data source file, the OPC UA adapter auto generates the data selection file, which lists all available streams in the designated data source. To configure the data selection file:

1. Save the data selection file to the local device and name it based on the adapter instance name. For example, to use the adapter instance created during installation, which is `OpcUa1`, name the file `OpcUa1Dataselection.json`.

1. Open the file in a text editor. It should look similar to the following example:

   ```json
   [{
           "Selected": false,
           "Name": "Cold Side Inlet Temperature",
           "NodeId": "ns=2;s=Line1.HeatExchanger1001.ColdSideInletTemperature",
           "StreamId": null
       },
       {
           "Selected": false,
           "Name": "Hot Side Inlet Temperature",
           "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideInletTemperature",
           "StreamId": null
       },
       {
           "Selected": false,
           "Name": "Hot Side Outlet Temperature",
           "NodeId": "ns=2;s=Line1.HeatExchanger1001.HotSideOutletTemperature",
           "StreamId": null
       },
       {
           "Selected": false,
           "Name": "Cold Side Inlet Temperature",
           "NodeId": "ns=2;s=Line1.HeatExchanger1002.ColdSideInletTemperature",
           "StreamId": null
       },
       {
           "Selected": false,
           "Name": "Hot Side Outlet Temperature",
           "NodeId": "ns=2;s=Line1.HeatExchanger1002.HotSideOutletTemperature",
           "StreamId": null
       }
   ]
   ```

2. To ingress a stream to Edge Data Store, change the value of the **Selected** key from `false` to `true`. All streams in the auto generated data selection file are initially set to `false`.

3. Save the the file.

4. Run the following curl script from the directory where the file is located, updating the file name and destination in the script if needed:

   ```bash
   curl -d "@OpcUa1Dataselection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
   ```
