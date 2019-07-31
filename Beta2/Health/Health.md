---
uid: edgeSystemHealth
---

# Edge System health

Having insight into the health of the Edge System and the components that make it up can be critical for ensuring that your needs for data collection are being met.  To that end, Edge System and its components produce health information to be sent to OSIsoft Health Omf Endpoints. When enabled, Edge System will transfer to configured Omf health endpoints the types and containers that represent available  health information.

## Configuring Edge System health endpoints

The Edge System has the ability to report system health to one or more OMF endpoints capable of receiving health messages. To enable this functionality, one or more health endpoints must be configured.

Table 1. Configuration parameters for Edge System health endpoints

| Parameter         | Required | Description                      |
|-------------------|----------------------------------|-------------|
| Id | Optional    | The ID can be any alphanumeric string, for example Endpoint1. If you do not specify an ID, Edge System generates one automatically. |
| Endpoint | Required    | The URL of the ingress point which accepts OMF health messages. |
| UserName | Required for PI Web API endpoints  | The user name used for authentication to PI Web API OMF endpoint.  |
| Password | Required for PI Web API endpoints | The password used for authentication to PI Web API OMF endpoint.  |
| ClientId| Required for OSIsoft Cloud Services.  | The Client Id used for authentication to OSIsoft Cloud Services.|
| ClientSecret | Required for OSIsoft Cloud Services. | The Client Secret used for authentication to OSIsoft Cloud Services. |
| Buffering | Optional    | Options are memory, disk, or none. The default is none. |
| MaxBufferSizeMB | Optional    | The limit on the maximum megabytes of data to buffer for messages to this endpoint if an integer is >0. This parameter is useful if you want to limit memory or disk usage growth in the event of disconnection to the endpoint. If the buffer is full, old messages will be discarded for new messages. The default is 0. |
| ValidateEndpointCertificate | Optional | Edge connectivity validates the endpoint certificate if set to true (recommended). If set to false, Edge connectivity accepts any endpoint certificate. OSIsoft strongly recommends using disabled endpoint certificate validation for testing purposes only.|

## Connectivity Adapters health

The following health types and streams are created to reflect the health of connectivity adapters.

The Connectors static type includes these properties and servers as a root AF element with the id Connectors.

| Type         | Property |  Description     |
|--------------|----------|------------------|
| string | Id | Connectors - root AF element |
| string | Description | Collection of Connector assets |

### Connectivity Adapters health

The Connector Health static type includes the following properties, which are logged in a stream with the id {machinename}.{componentid}. The stream is linked to root AF element (Connectors).

| Type         | Property |  Description     |
|--------------|----------|------------------|
| string | Id  | {machinename}.{componentId} |
| string | Description | {productname} health |
| string | Connector Type | {adaptertype} |
| string | Version | {adapterversion} |

### Device status

The DeviceStatus dynamic type includes the following values, which are logged in a stream with the id Connectors.{machinename}.{componentid}.DeviceStatus. The stream is linked to {machinename}.{componentid} static stream.

| Type         | Property |  Description     |
|--------------|----------|------------------|
| string | Time | Timestamp of event |
| string | DeviceStatus | Device status value |

### Next health message expected

The NextHealthMessageExpected dynamic type includes the following values, which are logged in a stream with the id Connectors.{machinename}.{componentid}.NextHealthMessageExpected. The stream is linked to {machinename}.{componentid} static stream. Heard beat message is expected once a minute.

| Type         | Property |  Description     |
|--------------|----------|------------------|
| string | Time | Timestamp of event |
| string | NextHealthMessageExpected | Time when next health message is expected. |

## Storage component health

The following health types and streams are created to reflect the health of the Storage component.

The Storage static type includes the following properties and servers as a root AF element with the id Storage.

| Type         | Property |  Description     |
|--------------|----------|------------------|
| string | Id | Storage - root AF element |
| string | Description | Storage Health |

### Storage health

The Storage Health static type includes the following properties, which are logged in a stream with the id {machinename}.Storage. The stream is linked to root AF element (Storage).

| Type         | Property |  Description     |
|--------------|----------|------------------|
| string | Id  | {machinename}.Storage |
| string | Description | {productname} health |
| string | Connector Type | {adaptertype} |
| string | Version | {storageversion} |

### Storage device status

The DeviceStatus dynamic type includes the following values, which are logged in a stream with the id Storage.{machinename}.DeviceStatus. The stream is linked to {machinename}.Storage static stream.

| Type         | Property |  Description     |
|--------------|----------|------------------|
| string | Time | Timestamp of event |
| string | DeviceStatus | Device status value |

### Storage next health message expected

The NextHealthMessageExpected dynamic type includes the following values, which are logged in a stream with the id Storage.{machinename}.NextHealthMessageExpected. The stream is linked to {machinename}.Storage static stream. Heard beat message is expected once a minute.

| Type         | Property |  Description     |
|--------------|----------|------------------|
| string | Time | Timestamp of event |
| string | NextHealthMessageExpected | Time when next health message is expected. |
