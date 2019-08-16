---
uid: omfQuickStart
---

# Data Store OMF quick start

This quick start gives an overview on how to get data into the Edge Storage component using the OSisoft Message Format (OMF), and how to  retrieve the data using the Sequential Data Store (SDS) API. Both OMF data ingress and SDS data retrieval are accomplished using REST APIs. Prerequisites for this quick start are that Edge Data Store is installed and is accessible through a REST API using the default installed port (5590). This quick start uses curl, a commonly available library and command line tool on both Windows and Linux, and command line commands. You can use the same operations with any programming language or tool that supports making REST calls. In addition, you can accomplish data retrieval steps (GET commands) using a browser if one is available on the device.

## Create an OMF Type

For OMF data ingress, you have to create an OMF type that describes the format of the data to be stored in a container. In the following example, the data to be written is a timestamp and a numeric value, so the OMF JSON describing the type is:

```json
[{
    "id": "MyCustomType",
    "classification": "dynamic",
    "type": "object",
    "properties": {
        "Timestamp": {
            "type": "string",
            "format": "date-time",
            "isindex": true
        },
        "Value": {
            "type": "number",
            "format": "float32"
        }
    }
}]
```

The value is indexed by a timestamp and the numeric value that will be stored is a 32-bit floating point value. In order to create the OMF type in the data store

1. Save the JSON as a file with the name OmfCreateType.json.
2. Run the following curl script:

```bash
curl -i -d "@OmfCreateType.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: type" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
```

When this command completes successfully, an SDS type with the same name will have been created on the server. You can create any number of containers from the type, as long as they use a timestamp as an index and a 32-bit floating point value. You only need to do type creation the first time you send using a custom application. It does not cause an error if you resend the same definition at a later time.

## Create an OMF container

For writing OMF data. you have to create a container. As with an OMF Type, you only need to do this once before sending data events. Resending the same definition repeatedly does not cause an error.

```json
[{
    "id": "MyCustomContainer",
    "typeid": "MyCustomType"
}]
```

This container references the type that was created in the last step, and an error will occur if the type does not exist when the container is created. In order to create the OMF container in the data store

1. Save the JSON as a file with the name OmfCreateContainer.json.
2. Run the following curl script:

```bash
curl -i -d "@OmfCreateContainer.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: container" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
```

When this command completes successfully, an SDS stream will have been created to store data defined by the type.

## Write data events to the OMF container

After type and container creation, you can write data using OMF like in the following example:

```json
[{
    "containerid": "MyCustomContainer",
    "values": [{
            "Timestamp": "2019-07-16T15:18:24.9870136Z",
            "Value": 12345.6789
        },
        {
            "Timestamp": "2019-07-16T15:18:25.9870136Z",
            "Value": 12346.6789
        }
    ]
}]
```

This example includes two data events that will be stored in the SDS Stream that was created in the previous steps. As a best practice, for the best performance, batch OMF values when writing them . In order to write the data in the data store

1. Save the JSON as a file with the name OmfCreateDataEvents.json.
2. Run the following curl script:

```bash
curl -i -d "@SDSWriteData.json" -H "Content-Type: application/json"  -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data
```

When this command completes successfully, two values will have been written to the SDS stream.

## Read last data written using SDS

In order to read the data back from the server that has been written, you can use the SDS REST API. The following is an example curl script that reads back the last value entered:

```bash
curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data/Last
```

When run, this GET command returns the last value written:

```json
{"Time":"2017-11-23T18:00:00Z","Measurement":60.0}
```

## Read a range of data events written using SDS

In order to read the data back from the server that has been written, you can use the SDS REST API. The following is an example curl script that reads back a time range of values that have been written:

```bash
curl "http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/Simple/Data?startIndex=2017-07-08T13:00:00Z&count=100"
```

This command will return up to 100 values after the startIndex specified:

```json
[{"Time":"2017-11-23T17:00:00Z","Measurement":50.0},{"Time":"2017-11-23T18:00:00Z","Measurement":60.0}]
```

Both values that were entered were returned - up to 100 values after the specified timestamp will be returned.

For more information on SDS APIs, see [SDS](xref:sdsQuickStart).
