---
uid: opcUaDataSelection
---

# Generate default OPC UA data selection configuration file

When you add a data source, the OPC UA EDS adapter browses the entire OPC UA server address space and exports the available OPC UA variables into a JSON file for data selection. Data is collected automatically based upon user demands. OPC UA data from OPC UA variables is read through subscriptions (unsolicited reads).

A default OPC UA data selection file will be created if there is no OPC UA data selection configuration, but a valid OPC UA data source exists.

 **Note:** Generating the default data selection file can tax system resources. To avoid possibly expensive browse operations, OSIsoft recommends that you manually create a data selection file instead of generating the default data selection file. For more information, see [Data selection configuration](xref:OPCUADataSelectionConfiguration).

To generate the default data selection file:

1. Add an [OPC UA EDS adapter](xref:EdgeDataStoreConfiguration) with a unique ComponentId.

  During the installation of Edge Data Store, enabling the OPC UA EDS adapter results in addition of a unique component that also satisfies this condition.
  
1. Configure a valid [OPC UA data source](xref:opcUaOverview).

  Once you complete these steps, a default OPC UA data selection configuration file will be generated in the configuration directory for the corresponding platform.
  
  The following are example locations of the file created. In this example, it is assumed that the ComponentId of the OPC UA component is the default OpcUa1:

  ```bash
  Windows: %programdata%\OSIsoft\EdgeDataStore\Configuration\OpcUa1_DataSelection.json
   
  Linux: /usr/share/OSIsoft/EdgeDataStore/Configuration/OpcUa1_DataSelection.json
  ```

1. Copy the file to a different directory.

  The contents of the file will look something like:

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

1. In a text editor, edit the file and change the value of any Selected key from `false` to `true` in order to transfer the OPC UA data to be stored in Edge Data Store.

1. In the same directory where you edited the file, run the following curl command:

  ```bash
  curl -i -d "@OpcUa1_DataSelection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/OpcUa1/Dataselection
  ```
