---
uid: OMFMessages
---

# OMF messages

[The OSIsoft Message Format (OMF) specification](https://docs.osisoft.com/bundle/omf/page/index.html) is generic in that it does not specify a particular back-end system. This topic is a companion to the OMF specification which describes how OMF is interpreted by Edge Data Store. When creating an OMF application for EDS, you also need to consider the final destination of the data and review the associated documentation to determine what is supported.

## Headers

Message headers allow you to pass additional information with the message. The message header is where you specify the action for the message, such as CREATE. For a description of each of the headers, see the [OMF specification](https://docs.osisoft.com/bundle/omf/page/headers.html).

The `omfversion` header must match the version of the OMF spec used to construct the message.
EDS supports versions 1.0 and 1.1 of the OMF specification.

## Message types

OMF message types fall into three categories: Type, Container, and Data, which are described below. Each message type creates a different type of data and contains keywords that define characteristics of the data. Most of the message types are used to create the structure of the data and give it meaning. Data messages contain time-series data for which the PI System is known. The message types and the data they create are described in detail in this section. For details about the keywords supported by OCS, see the OCS documentation, [OSIsoft Cloud Services](https://docs.osisoft.com/bundle/ocs/page/ocs-content-portal-overview.html).

All messages should only be sent from the OMF application one time, but resending the same definition again does not cause an error.

### Type messages

An OMF type message describes the format of the data to be stored. A type message is interpreted by OSIsoft Cloud Services as an SdsType in the Sequential Data Store. Because SdsTypes are immutable, update operations are not supported.  

### Create an OMF type

The first step in OMF data ingress is to create an OMF type that describes the format of the data to be stored. In this example, the data to be written is a timestamp and a numeric value.

To create an OMF type, follow these steps:

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

2. To create the OMF type in Edge Storage, store the JSON file with the name `OmfCreateType.json` on the local device.

3. Run the following curl command:

   ```bash
   curl -d "@OmfCreateType.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: type" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

When this command completes successfully, an OMF type with the same name is created on the server. Any number of containers can be created from the type, as long as they use a timestamp as an index and have a 32-bit floating point value. The create type message needs to be sent before container and data messages.

## Container messages

An OMF container message uses an OMF type as a template to create a way to collect and group data events. A container message is interpreted as an SdsStream in the Sequential Data Store.

### Create an OMF container

The next step in writing OMF data is to create an OMF container. To create an OMF container, follow these steps:

1. Create an OMF JSON file that defines the container as follows:

   ```json
   [{
       "id": "MyCustomContainer",
       "typeid": "MyCustomType"
   }]
   ```

   This container references the OMF type that was created earlier, and an error will occur if the type does not exist when the container is created.

2. To create the OMF container in Edge Storage, store the JSON file with the name `OmfCreateContainer.json` on the local device.

3. To create the SDS stream to store data defined by the type, run the following curl command:

   ```bash
   curl -d "@OmfCreateContainer.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: container" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```

## Data messages

An OMF data message sends actual data events, like time-series data, to be stored. A data message is mapped to generic SDS values in the Sequential Data Store.

### Write data events to the OMF container

Once a type and container are defined, you can send data messages to write data to the container.

To writer data to the container, follow these steps:

1. Create an OMF JSON file to define data events to be stored in the SdsStreams created in the previous steps. For best performance, batch OMF messages together, as in the following example:

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

1. Save the JSON file with the name `OmfCreateDataEvents.json` on the local device.

1. To write data values to the SDS stream, run the following curl command:

   ```bash
   curl -d "@OmfCreateDataEvents.json" -H "Content-Type: application/json" -H "producertoken: x " -H "omfversion: 1.1" -H "action: create" -H "messageformat: json" -H "messagetype: data" -X POST http://localhost:5590/api/v1/tenants/default/namespaces/default/omf/
   ```
