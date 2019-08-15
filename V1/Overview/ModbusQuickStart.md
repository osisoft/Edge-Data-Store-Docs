---
uid: modbusQuickStart
---

# Modbus TCP connectivity quick start

This quick start gives an overview on how to set up the Modbus TCP connectivity. Edge Data Store comes with a single Modbus TCP connectivity installed. It is named Modbus1. If you want a second Modbus TCP connectivity, refer to [Edge Data Store Configuration](xref:edgeSystemConfiguration) on how to add a new component to Edge Data Store. The following example changes if you configure a second connectivity. Replace Modbus1 with the name of the component you have added.

## Configure a Modbus TCP data source

1. Create a file in JSON format describing the location of the Modbus data source. The timeouts are in milliseconds.

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

2. Enter the correct IP address and port for the Modbus TCP data source.
3. Save the file with the name Modbus1DataSource.json. 
4. Run the following curl script from the same directory where the file is located. 
**Note:** You should run the script on the same computer where the Edge Data Store is installed:

```bash
curl -i -d "@Modbus1Datasource.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/Modbus1/Datasource
```

When this command completes successfully (a 204 is returned by curl), your Modbus TCP data source has been created. If you get a 400 error, check your JSON file for errors. If you get a 404 or 500 error, check to make sure Edge Data Store is running on your computer.

## Configure Modbus data selection

1. Select the Modbus TCP data you want to store in Edge Data Store by configuring Modbus data selection. The following is a sample JSON for five Modbus TCP values.

2. Modify the values as appropriate for your Modbus TCP environment.

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

3. Save the JSON content above in a text file and name it Modbus1Dataselection.json. 

**Note:** When you run the following curl script, the system will be configured to collect Modbus TCP data values.

```bash
curl -i -d "@Modbus1Dataselection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/Modbus1/Dataselection
```

To see the streams that have been created in Edge Storage to store the data you are writing, run the following curl script:

```bash
curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/
```

To view the data in the streams being written by Modbus TCP, see [Sequential Data Store](xref:sdsOverview). 

To egress data to OSIsoft Cloud Services or the PI System, see [Egress](xref:egress) or [PI Egress Quick Start](xref:piEgressQuickStart).
