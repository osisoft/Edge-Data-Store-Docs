---
uid: omfQuickStart
---

# OMF ingress quick start

Create a custom application using OSIsoft Message Format to send data to Edge Data Store from sources that cannot use Modbus or OPC UA protocols. The following diagram depicts the data flow from an OMF data collection application into EDS:

![EDS OMF Ingress](../content/images/OMFIngressExample.jpg "OMF Ingress Example")

The OMF application collects data from a data source and sends it to the EDS endpoint. The EDS endpoint sends the data to the storage component where it is held until it can be egressed to permanent storage in PI Server or AVEVA Data Hub. The OMF application must run on the same device as EDS and no authentication is needed.

To get started using OMF messages to ingress data into EDS, create an OMF type and container and then write data events to the container using REST APIs. Use the Sequential Data Store (SDS) REST API to read the data back from EDS.

The `omfversion` header must match the version of the OMF spec used to construct the message. EDS supports versions 1.0, 1.1, and 1.2 of the OMF specification.

## Create an OMF type

The first step in OMF data ingress is to create an OMF type that describes the format of the data to be stored in a container. In this example, the data to be written is a timestamp and a numeric value.

To create an OMF type:

1. Create an OMF JSON file that defines the type as follows:

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

1. To create the OMF type in Edge Storage, store the JSON file with the name `OmfCreateType.json` on the local device.

1. Run the following curl command:

   ```bash
   curl -d "@OmfCreateType.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: type" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

When this command completes successfully, an OMF type with the same name is created on the server. Any number of containers can be created from the type, as long as they use a timestamp as an index and have a 32-bit floating point value. The create type message needs to be sent first before container and data messages, but it does not cause an error if the same message is sent at a later time.

## Create an OMF container

The next step in writing OMF data is to create an OMF container. As with an OMF type, the create container message only needs to be sent once before sending data events, but resending the same definition again does not cause an error.

To create an OMF container:

1. Create an OMF JSON file that defines the container as follows:

   ```json
   [{
       "id": "MyCustomContainer",
       "typeid": "MyCustomType"
   }]
   ```

   This container references the OMF type that was created earlier, and an error will occur if the type does not exist when the container is created.

1. To create the OMF container in Edge Storage, store the JSON file with the name `OmfCreateContainer.json` on the local device.

1. To create the SDS stream to store data defined by the type, run the following curl command:

   ```bash
   curl -d "@OmfCreateContainer.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: container" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

## Write data events to the OMF container

Once a type and container are defined, follow these steps to write data to the container:

1. Create an OMF JSON file to define data events to be stored in the SDS Stream created in the previous steps. For best performance, batch OMF values together, as in the following example:

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

1. To write the data to EDS, store the JSON file with the name `OmfCreateDataEvents.json` on the local device.

1. To write data values to the SDS stream, run the following curl command:

   ```bash
   curl -d "@OmfCreateDataEvents.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: data" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

## Use SDS to read last data written

To use the SDS REST API to read back the last data event written to the server:

1. Start the curl command line tool.

1. Run the following curl command to return the last value written:

   ```bash
   curl http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/MyCustomContainer/Data/Last
   ```

   Sample output:

   ```json
   {"Timestamp": "2019-07-16T15:18:25.9870136Z", "Value": 12346.6789}
   ```

## Use SDS to read a range of data events

To use the SDS REST API to read back the a range of data written to the server:

1. Start the curl command line tool.

1. Run the following curl command to return up to 100 values after the `startIndex` specified:

   ```bash
   curl "http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/MyCustomContainer/Data?startIndex=2017-07-08T13:00:00Z&count=100"
   ```

   Sample output:

   ```json
   [{"Timestamp": "2019-07-16T15:18:24.9870136Z","Value": 12345.6789}, {"Timestamp": "2019-07-16T15:18:25.9870136Z", "Value": 12346.6789}]
   ```

   Both values that were entered are returned. This command returns up to 100 values after the specified timestamp.
