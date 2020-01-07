---
uid: omfQuickStart
---

# OMF quick start


This topic provides quick start instructions for getting data into the Edge Storage component using the OSisoft Message Format (OMF), and then retrieving that data using the Sequential Data Store (SDS) API. Both OMF data ingress and SDS data retrieval are accomplished using REST APIs. This topic assumes the Edge Data Store has been installed, and is accessible through a REST API using the default installed port (5590). 

The examples here use curl, a commonly available tool on both Windows and Linux, and command line commands. You can use the same operations with any programming language or tool that supports making REST calls. You can also accomplish data retrieval steps (GET commands) using a browser, if available on your device.

## Create an OMF type

The first step in OMF data ingress is to create an OMF type that describes the format of the data to be stored in a container. In this example, the data to be written is a timestamp and a numeric value.

1. Create an OMF JSON file describing the type as follows:


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

   The value is indexed by a timestamp, and the numeric value that will be stored is a 32-bit floating point value.

2. In order to create the OMF type in Edge Storage, store the JSON file with the name OmfCreateType.json on the local device.
3. Run the following curl script:


   ```bash
   curl -i -d "@OmfCreateType.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: type" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

When this command completes successfully, an SDS type with the same name will have been created on the server. Any number of containers can be created from the type, as long as they use a timestamp as an index and have a 32-bit floating point value. You only need to send the Type definition the first time you send data, but it does not cause an error if you resend the same definition at a later time.

## Create an OMF container

The next step in writing OMF data is to create a container. As with an OMF type, this only needs to be done once before sending data events, and resending the same definition repeatedly does not cause an error.

1. Create an OMF JSON file as follows:

   ```json
   [{
       "id": "MyCustomContainer",
       "typeid": "MyCustomType"
   }]
   ```

This container references the OMF type that was created earlier, and an error will occur if the type does not exist when the container is created. 

2. To create the OMF container in the Edge Storage, store the JSON file with the name OmfCreateContainer.json on the local device.
3. To create the SDS stream to store data defined by the type, run the following curl script:


   ```bash
   curl -i -d "@OmfCreateContainer.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: container" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

## Write data events to the OMF container

1. Create an OMF JSON file as in the following example:

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

The preceding example includes two data events that will be stored in the SDS Stream created in the previous steps. For the best performance, batch OMF values when writing them. 

2. To write the data in the Edge Storage, store the JSON file with the name OmfCreateDataEvents.json on the local device.
3. To write values to the SDS stream, run the following curl script:

   ```bash
   curl -i -d "@OmfCreateDataEvents.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: data" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

In this example, two values are written to the SDS stream.

## Read Last Data written using SDS

Use the SDS REST API to read back the data written to the server. Run the following example curl script to read the last value entered:

   ```bash
   curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/MyCustomContainer/Data/Last
   ```

The following GET command returns the last value written:

   ```json
   {"Time":"2017-11-23T18:00:00Z","Measurement":60.0}
   ```

## Read a range of data events written using SDS


Use the SDS REST API to read back the data written to the server. The following example curl script reads back a time range of values:


   ```bash
   curl "http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/MyCustomContainer/Data?startIndex=2017-07-08T13:00:00Z&count=100"
   ```

The following command returns up to 100 values after the startIndex specified:

   ```json
   [{"Time":"2017-11-23T17:00:00Z","Measurement":50.0},{"Time":"2017-11-23T18:00:00Z","Measurement":60.0}]
   ```

Both values that were entered are returned. This command returns up to 100 values after the specified timestamp.

For more information on SDS APIs see the [SDS](xref:sdsQuickStart) section of this documentation.