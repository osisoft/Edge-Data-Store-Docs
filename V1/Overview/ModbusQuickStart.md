---
uid: modbusQuickStart
---

# Modbus TCP EDS adapter quick start

This topic provides quick start instructions for setting up the Modbus TCP EDS adapter. You can add a single Modbus TCP EDS adapter during Edge Data Store installation. If you want multiple Modbus TCP EDS adapters, see [Edge Data Store Configuration](xref:EdgeDataStoreConfiguration) for adding a new component to Edge Data Store. 

The examples here use curl, a commonly available tool on both Windows and Linux, and command line commands. You can use the same operations with any programming language or tool that supports making REST calls. You can also accomplish data retrieval steps (GET commands) using a browser, if available on your device.

The following diagram depicts the data flow of a single Modbus TCP EDS adapter:

![EDS Modbus TCP](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSModbusTCP.jpg "EDS Modbus TCP")

## Configure a Modbus TCP data source

1. Create a file in JSON format describing the location of the Modbus TCP data source. The adapter installed during installation is named Modbus1 in this example. Modify the following values to match your environment.

   ```json
   {
       "IpAddress": "<Modbus IP Address>",
       "Port": <Port - usually 502>,
       "ConnectTimeout": 15000,
       "ReconnectInterval": 5000,
       "RequestTimeout": 9000,
       "DelayBetweenRequests": 0,
       "MaxResponseDataLength": 250
   }
   ```

2. Enter the correct IP address and port for your Modbus data source.
3. Save the file with the name Modbus1DataSource.json. 
4. Run the following curl script from the same directory where the file is located. 

**Note:** You should run the script on the same computer where the Edge Data Store is installed.

   ```bash
   curl -i -d "@Modbus1Datasource.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/Modbus1/Datasource
   ```

When this script completes successfully (a 204 is returned by curl), your Modbus TCP data source has been created. If you get a 400 error, check the JSON file for errors. If you get a 404 or 500 error, check that Edge Data Store is running on your device.

## Configure Modbus TCP data selection

Select the Modbus TCP data you want to store in Edge Data Store by configuring Modbus data selection. The following is sample JSON for 5 Modbus values.

1. Modify the values as appropriate for your Modbus environment.

   ```json
   [{
           "Selected": "true",
           "UnitId": 1,
           "RegisterType": 3,
           "RegisterOffset": 1,
           "DataTypeCode": 20,
           "BitMap": "16151413",
           "ConversionFactor": 2,
           "ConversionOffset": 3.4,
           "ScanRate": 500
       },
       {
           "Selected": "true",
           "UnitId": 1,
           "RegisterType": 3,
           "RegisterOffset": 2,
           "DataTypeCode": 20,
           "BitMap": "16151413",
           "ConversionFactor": 2,
           "ConversionOffset": 3.4,
           "ScanRate": 500
       },
       {
           "Selected": "true",
           "UnitId": 1,
           "RegisterType": 3,
           "RegisterOffset": 3,
           "DataTypeCode": 20,
           "BitMap": "16151413",
           "ConversionFactor": 2,
           "ConversionOffset": 3.4,
           "ScanRate": 500
       },
       {
           "Selected": "true",
           "UnitId": 1,
           "RegisterType": 3,
           "RegisterOffset": 4,
           "DataTypeCode": 20,
           "BitMap": "16151413",
           "ConversionFactor": 2,
           "ConversionOffset": 3.4,
           "ScanRate": 500
       },
       {
           "Selected": "true",
           "UnitId": 1,
           "RegisterType": 3,
           "RegisterOffset": 5,
           "DataTypeCode": 20,
           "BitMap": "16151413",
           "ConversionFactor": 2,
           "ConversionOffset": 3.4,
           "ScanRate": 500
       }
   ]
   ```

2. Save the JSON content above in a text file and name it Modbus1Dataselection.json. 

**Note:** When you run the following curl script, the system will be configured to collect Modbus data values.

   ```bash
   curl -i -d "@Modbus1Dataselection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/Modbus1/Dataselection
   ```

* To see the streams that have been created in Edge Storage to store the data you are writing, run the following curl script:

   ```bash
   curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/
   ```

* To view the data in the streams being written by Modbus, refer to the SDS part of this documentation. 

* To egress the data to OSIsoft Cloud Services or the PI System, see the egress part of this documentation.