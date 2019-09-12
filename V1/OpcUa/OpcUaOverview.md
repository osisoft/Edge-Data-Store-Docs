---
uid: opcUaOverview
---

# OPC UA EDS adapter

## Overview

The OPC UA EDS adapter transfers time-series data from OPC UA devices into Edge Data Store.

It is possible to add a single EDS OPC UA adapter during installation. If multiple EDS OPC UA adapters are desired, please reference [Edge Data Store Configuration](xref:EdgeDataStoreConfiguration) on how to add a new component to Edge Data Store. The example below covers configuring the first adapter. If another adapter has been installed, please substitute the name of the installed adapter in the below example for OpcUa1.

As with other Edge Data Store EDS adapters, the EDS OPC UA adapter is configured using data source and data selection JSON documents. The data source configuration are identical with other adapters, but OPC UA supports an option to generate a template data selection file that can be manually edited and used for subsequent configuration, see [OPC UA Data Selection](xref:opcUaDataSelection). Once the template file is created it can be reused on both Linux and Windows without changes.

OPC UA is an open standard, which ensures interoperability, security, and reliability of industrial automation devices and systems. OPC UA is recognized as one of the key communication and data modeling technologies of Industry 4.0, due to the fact that it works with many software platforms and that it is completely scalable and flexible.

## Configuration of OPC UA data source

To use the OPC UA EDS adapter of Edge Data Store, you must configure from which OPC UA data source it will be receiving data.

### Procedure for Configuring OPC UA data source

**Note:** You cannot modify OPC UA data source configurations manually. You must use the REST endpoints to add or edit the configuration.

The following procedure is for configuring OPC UA data source.

1. Use any text editor and create a file that contains an OPC UA data source in JSON form
    - For content structure, see the following OPC UA data source example section.
    - For a table of all available parameters, see the following Parameters for OPC UA data source section.
2. Save the file as DataSource.config.json.
3. Use any [tool](xref:managementTools) capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSource/`. During installation it is possible to add a single EDS OPC UA adapter and it is named OpcUa1. The example below uses this component name.

    - Example using cURL:

```bash
curl -v -d "@DataSource.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/OpcUa1/DataSource"
```

### Parameters for OPC UA data source

The following parameters are available for configuring an OPC UA data source.

| Parameter | Required | Type |	Description |
|-----------|----------|------|-------------|
| **EndpointURL** | Required | string | The endpoint URL of the OPC UA server. The following is an example of the URL format: opc.tcp://OPCServerHost:Port/OpcUa/SimulationServer<br><br>**Note:** If you change the EndpointURL on a configured OPC UA EDS adapter that has ComponentID_DataSelection.json file exported, you will need to relocate the ComponentID_DataSelection.json file from the configuration directory to trigger a new browse (export).|
| **UseSecureConnection**|Optional | bool | When set to true, the OPC UA EDS adapter connects to a secure endpoint using OPC UA certificate exchange operation. The default is true. When set to false, the OPC UA EDS adapter connects to an unsecured endpoint of the server and certificate exchange operation is not required.<br><br>**Note:** OSIsoft recommends setting this option to false for testing purposes only.|
| **UserName** | Optional | string | User name for accessing the OPC UA server. |
| **Password** | Optional | string | Password for accessing the OPC UA server.<br><br>**Note:** OSIsoft recommends using REST to configure the data source when the password must be specified.|
| **RootNodeIds** | Optional | string |List of comma-separated NodeIds of those objects from which the OPC UA EDS adapter browses the OPC UA server address space. This option allows selecting only subsets of the OPC UA address by explicitly listing one or more NodeIds which are used to start the initial browse. For example: ns=5;s=85/0:Simulation, ns=3;s=DataItems. If not specified, it means that the whole address space will be browsed.|
| **IncomingTimestamp**	| Optional | string | Specifies whether the incoming timestamp is taken from the source, from the OPC UA server, or should be created by the OPC UA EDS adapter instance. **Source** - Default and recommended setting. The timestamp is taken from the source timestamp field. The source is what provides data for the item to the OPC UA server, such as a field device. **Server** - In case the OPC UA item has an invalid source timestamp field, the Server timestamp can be used. **Connector** - The OPC UA EDS adapter generates a timestamp for the item upon receiving it from the OPC UA server.|
| **StreamIdPrefix** | Optional | string | Specifies what prefix is used for Stream IDs. Naming convention is StreamIdPrefixNodeId. **Note:** An empty string means no prefix will be added to the Stream IDs. Null value means ComponentID followed by dot character will be added to the stream IDs (example: OpcUa1.NodeId).|


### OPC UA data source example

The following is an example of valid OPC UA data source configuration:

```json
{
    "EndpointUrl": "opc.tcp://IP-Address/TestOPCUAServer",
    "UseSecureConnection": true,
    "UserName": null,
    "Password": null,
    "RootNodeIds": null,
    "IncomingTimestamp": "Source",
    "StreamIdPrefix": null
}
```

## Configuration of OPC UA data selection

In addition to the data source configuration, you need to provide a data selection configuration to specify the data you want the OPC UA EDS adapter to collect from the data sources.

### Procedure

**Note:** You cannot modify OPC UA data selection configurations manually. You must use the REST endpoints to add or edit the configuration.

The following procedure is for configuring OPC UA data selection:

1. Use any text editor and create a file that contains an OPC UA data selection in JSON form
    - For content structure, see the following OPC UA data selection example.
    - For a table of all available parameters, see the following Parameters for OPC UA data selection section.
2. Save the file as DataSelection.config.json.
3. Use any [tool](xref:managementTools) capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSelection/`
    - Example using cURL:


```bash
curl -v -d "@DataSelection.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/<EDS adapterId>/DataSelection"
```

### Parameters for OPC UA Data Selection

| Parameter     | Required | Type | Description |
|---------------|----------|------|-------------|
| **Selected** | Optional | bool | This field is used to select or clear a measurement. To select an item, set to true. To remove an item, leave the field empty or set to false.  If not configured, the default value is false.|
| **Name**      | Optional | string | The optional friendly name of the data item collected from the data source. If not configured, the default value will be the stream id |
| **NodeId**    | Required | string | The NodeId of the variable. |
| **StreamID** | Required | string | The custom stream ID that will be used to create the streams. If not specified, the Modbus TCP EDS adapter will generate a default stream ID based on the measurement configuration. A properly configured custom stream ID follows these rules:<br><br>Is not case-sensitive.<br>Can contain spaces.<br>Cannot start with two underscores ("__").<br>Can contain a maximum of 260 characters.<br>Cannot use the following characters: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % < > &#124;<br>Cannot start or end with a period.<br>Cannot contain consecutive periods.<br>Cannot consist of only periods.

### OPC UA data selection example

The following is an example of valid OPC UA Data Selection configuration:

```json
[
 {
    "Selected": true,
    "Name": "Random1",
    "NodeId": "ns=5;s=Random1",
    "StreamId": "CustomStreamName"
  },
  {
    "Selected": false,
    "Name": "Sawtooth1",
    "NodeId": "ns=5;s=Sawtooth1",
    "StreamId": null
  },
  {
    "Selected": true,
    "Name": "Sinusoid1",
    "NodeId": "ns=5;s=Sinusoid1",
    "StreamId": null
  }
]
```

## OPC UA Adapter Security

OPC UA security standard is concerned with the authentication of Client and Server applications, the authentication of users and confidentiality of their communication. As the security model relies heavily on Transport Level Security (TLS) to establish a secure communication link with an OPC UA server, each client, including the OSIsoft Adapter, must have a digital certificate deployed and configured. Certificates uniquely identify client applications and machines on servers and allow for creation of a secure communication link when trusted on both sides.

OSIsoft Adapter for OPC UA generates a self-signed certificate when the first secure connection attempt is made. Each OPC UA Adapter instance creates a certificate store where it's own as well as the server’s certificates will be persisted.

### Procedure

1. Configure the data source to use secure connection (Set UseSecureConnection as true).
2. Add server's certificate to the adapter's trust store.
3. Add adapter's certificate to the server's trust store.

### Data source configuration

```json
{
"EndpointUrl": "opc.tcp://IP-Address/TestOPCUAServer",
"UseSecureConnection": true,
"UserName": null,
"Password": null,
"RootNodeIds": null,
"IncomingTimestamp": "Source"
}
```

> **Note:** OSIsoft strongly recommends using secure connection in production environment(s).

### Adapter Certificate store

Adapter Certificate store location:

```bash
Windows: %programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates

Linux: /usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates
```

Adapter Trust store location:

```bash
Windows: %programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\Trusted\certs

Linux: /usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/Trusted/certs
```

Adapter Rejected certificates location:

```bash
Windows: %programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\RejectedCertificates\certs

Linux: /usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/RejectedCertificates/certs
```

The adapter verifies if the server certificate is present in the adapter trust store location and is therefore trusted. In case the certificates were not exchanged upfront, the adapter persists the server certificate within the RejectedCertificates folder and the following warning message about the rejected server certificate will be printed:

```bash
~~2019-09-08 11:45:48.093 +01:00~~ [Warning] Rejected Certificate: "DC=MyServer.MyDomain.int, O=Prosys OPC, CN=Simulation
```

After the certificate is reviewed and approved, it can be manually moved from the “RejectedCertificates\certs” folder to the “Trusted\certs" folder using a file explorer or command-line interpreter.

- Linux example using command-line:

```bash
 mv /usr/share/OSIsoft/EdgeDataStore/OpcUa1/Certificates/RejectedCertificates/certsSimulationServer\ \[F9823DCF607063DBCECCF6F8F39FD2584F46AEBB\].der /usr/share/OSIsoft/EdgeDataStore/OpcUa1/Certificates/Trusted/certs/
```

> **Note:** Administrator or Root privileges are required to perform this operation.

When the certificate is in the adapter trust store, the adapter trusts the server and the connection attempt proceeds to making the actual connection call to the configured server. Connection succeeds only when the adapter certificate is trusted on the server side. Please refer to your OPC UA server documentation for more details on how to make a client certificate trusted. In general, servers work in a similar fashion to the clients; hence a similar approach for making the server certificate trusted on the client side can be taken on the server.

When certificates are mutually trusted the connection attempt succeeds and the adapter is connected to the most secure endpoint provided by the server.

