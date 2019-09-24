---
uid: EdgeDataStoreHealth
---

# Edge Data Store health

Insight into the health of the Edge Data Store and the EDS Adapter components that make it up can be critical for ensuring that your needs for data collection are being met. To that end, Edge Data Store and its components produce health information. When configured, Edge Data Store transfers health information to OSIsoft OMF endpoints, in the form of the types and containers that represent available health information.

## Configure Edge Data Store health endpoints

Edge Data Store has the ability to report system health to one or more OMF endpoints. To enable this functionality, you must configure one or more health endpoints.

Table 1. Configuration parameters for Edge Data Store health endpoints

| Parameter         | Required | Description                      |
|-------------------|----------------------------------|-------------|
| Id | Optional    | The ID can be any alphanumeric string, for example Endpoint1. If you do not specify an ID, Edge Data Store generates one automatically. |
| Endpoint | Required    | The URL of the ingress endpoint which accepts OMF health messages. |
| UserName | Required for PI Web API endpoints  | The user name used for authentication to PI Web API OMF endpoint.  |
| Password | Required for PI Web API endpoints | The password used for authentication to PI Web API OMF endpoint.  |
| ClientId| Required for OSIsoft Cloud Services.  | The Client Id used for authentication to OSIsoft Cloud Services.|
| ClientSecret | Required for OSIsoft Cloud Services. | The Client Secret used for authentication to OSIsoft Cloud Services. |
| Buffering | Optional    | Options are memory, disk, or none. The default is none. |
| MaxBufferSizeMB | Optional    | The limit on the maximum megabytes of data to buffer for messages to this endpoint if an integer is >0. This parameter is useful if you want to limit memory or disk usage growth in the event of disconnection to the endpoint. If the buffer is full, old messages will be discarded for new messages. The default is 0. |
| ValidateEndpointCertificate | Optional | Edge Data Store validates the endpoint certificate if set to true (recommended). If set to false, Edge Data Store accepts any endpoint certificate. OSIsoft recommends you to use disabled endpoint certificate validation for testing purposes only.|

## EDS health

The Edge Data Stores static type includes these properties and servers as a root AF element with the id Edge Data Stores.

| Type         | Property | Description      |
|--------------|----------|------------------|
| string | Id | Edge Data Stores |
| string | Description | Collection of Edge Data Store Assets|


### EDS adapter health
The following health types and streams are created to reflect the health of EDS adapters.

The EDS Adapter Health static type includes the following properties, which are logged in a stream with the id {machinename}.{componentid}. The stream is linked to root AF element (Edge Data Stores).

| Type         | Property | Description      |
|--------------|----------|------------------|
| string | Id  | {machinename}.{componentId} |
| string | Data Source  | {componentId} |
| string | Description | {productname} Health |
| string | End Point |  |
| string | Host | {machinename} |
| string | Type | {adaptertype} |
| string | Version | {adapterversion} |

### Device status

The DeviceStatus dynamic type includes the following values, which are logged in a stream with the id {machinename}.{componentid}.DeviceStatus. The stream is linked to {machinename}.{componentid} static stream. The PI Tag for DeviceStatus is {machinename}.{componentid}.DeviceStatus.DeviceStatus.

| Type         | Property | Description      |
|--------------|----------|------------------|
| string | Time | Timestamp of event |
| string | DeviceStatus | Device status value |

### Next health message expected

The NextHealthMessageExpected dynamic type includes the following values, which are logged in a stream with the id {machinename}.{componentid}.NextHealthMessageExpected. The stream is linked to {machinename}.{componentid} static stream. The PI Tag for the NextHealthMessageExpected is {machinename}.{componentid}.NextHealthMessageExpected.NextHealthMessageExpected. Heart beat message is expected once a minute. 

| Type         | Property | Description      |
|--------------|----------|------------------|
| string | Time | Timestamp of event |
| string | NextHealthMessageExpected | Time when next health message is expected. |

## Storage component health
The following health types and streams are created to reflect the health of the Storage component.

The Storage static type includes the following properties and servers as a root AF element with the id Storage.

| Type         | Property | Description      |
|--------------|----------|------------------|
| string | Id | Storage - root AF element |
| string | Description | Storage Health |

### Storage health

The Storage Health static type includes the following properties, which are logged in a stream with the id {machinename}.Storage. The stream is linked to root AF element (Edge Data Stores).

| Type         | Property | Description      |
|--------------|----------|------------------|
| string | Id  | {machinename}.Storage |
| string | Description | Storage health |
| string | Host | {machinename} |
| string | Version | {storageversion} |

### Storage device status

The DeviceStatus dynamic type includes the following values, which are logged in a stream with the id {machinename}.Storage.DeviceStatus. The stream is linked to {machinename}.Storage static stream. The PI Tag for DeviceStatus is {machinename}.Storage.DeviceStatus.DeviceStatus.

| Type         | Property | Description      |
|--------------|----------|------------------|
| string | Time | Timestamp of event |
| string | DeviceStatus | Device status value |

### Storage next health message expected

The NextHealthMessageExpected dynamic type includes the following values, which are logged in a stream with the id {machinename}.Storage.NextHealthMessageExpected. The stream is linked to {machinename}.Storage static stream. The PI Tag for NextHealthMessageExpected is {machinename}.Storage.NextHealthMessageExpected.NextHealthMessageExpected. Heart beat message is expected once a minute.

| Type         | Property | Description      |
|--------------|----------|------------------|
| string | Time | Timestamp of event |
| string | NextHealthMessageExpected | Time when next health message is expected. |
