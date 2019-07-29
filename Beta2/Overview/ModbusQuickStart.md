---
uid: modbusQuickStart
---

# Edge Modbus Quick Start

This document is a quick tour of setting up the Edge Modbus component.

## Configuring a Modbus Data Source

The first step in configuring Edge Modbus is to create a file in JSON format describing the location of the Modbus data source. The timeouts are in milliseconds.

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

Enter the correct IP address and port for your Modbus data source and save the file with the name Modbus1DataSource.json. Then run the following curl script from the same directory where the file is located. The script should be run on the same computer where the Edge System is installed:

```bash
curl -i -d "@Modbus1Datasource.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/Modbus1/Datasource
```

When this command completes successfully (a 204 is returned by curl), your Modbus data source has been created. If you get a 400 error check your JSON file for errors, if you get a 404 or 500 error check to make sure the Edge System is running on your computer.

## Configuring Modbus Data Selection

The next step in setting up Modbus is to select the Modbus data you wish to store in the Edge System. This is done by configuring Modbus data selection. Sample JSON for 5 Modbus values is below - please modify the values as appropriate for your Modbus environment.

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

Save the JSON content above in a text file and name it Modbus1Dataselection.json. When you run the following curl script the system will be configured to collect Modbus data values.

```bash
curl -i -d "@Modbus1Dataselection.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/Modbus1/Dataselection
```

To see the streams that have been created in Edge Storage to store the data you are writing you can run the following curl script:

```bash
curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/
```

To view the data in the streams being written by Modbus you can refer to the SDS part of this documentation. 

To egress the data to OSIsoft Cloud Services or the PI System, see the egress documentation or quick starts.
