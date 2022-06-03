---
uid: omfOverview
---

# OSIsoft Message Format

Create a custom application using OSIsoft Message Format (OMF) to send data to EDS from sources that cannot use Modbus or OPC UA protocols. The following diagram depicts the data flow from an OMF data collection application into EDS:

![EDS OMF Ingress](https://osisoft.github.io/Edge-Data-Store-Docs/content/images/OMFIngressExample.jpg "OMF Ingress Example")

The OMF application collects data from a data source and sends it to the Edge Data Store endpoint. The EDS endpoint sends the data to the storage component where it is held until it can be egressed to permanent storage in PI Server or OSIsoft Cloud Services. The OMF application must run on the same device as Edge Data Store and no authentication is needed.

## OMF endpoint

The route to the OMF endpoint to the Edge Storage component is shown below. Replace `<port_number>` with the port configured for your EDS system:

```http
Method: POST
Endpoint: http://localhost:<port_number>/api/v1/tenants/default/namespaces/default/omf
```

This endpoint can only be accessed locally, so the OMF application must run on the same device as EDS.

## Supported functionality

Edge Data Store supports OMF versions 1.0 and OMF version 1.1 for data ingress. For details on the difference versions of OMF, see the OMF specification, available here: [OSIsoft Message Format](https://docs.osisoft.com/bundle/omf/page/index.html). The OMF ingress functionality is the same technology that is used in OSIsoft Cloud Services (OCS) and writing an OMF application for EDS is very similar to writing an OMF application for OCS.

The OMF endpoint for the Edge Storage component only supports the create action; it does not support the update action. If a create data message is sent with the same time index, the values will be replaced at that index value.

Dynamic messages are supported, but static messages (usually used for creating PI AF assets) are not supported by EDS. Any static OMF messages sent to the EDS OMF REST endpoint will be ignored.

For efficiency reasons, OSIsoft recommends batching OMF messages that are sent to the EDS endpoint. Sending single messages or a small number of messages to the OMF endpoint can be successful, but it is inefficient. When a single message or a small number of messages are sent at a time, the HTTP overhead of creating the request and processing the response on a small device requires more system resources than the processing of the OMF message itself. While a large number of OMF messages per second can be processed by EDS platforms, OSIsoft recommends keeping the number of HTTP calls per second low to increase efficiency.

## HTTPS status codes

Edge Data Store returns the following status codes to provide feedback when an OMF ingress message is received. If an error occurs because of an issue with the server (408 Request Timeout or 503 Service Unavailable), the application can retry the request. It is up to the OMF application developer to determine how many times to retry a request.

| Status Code        | Description               | Common Causes               |
|--------------------|---------------------------|-----------------------------|
| 204 No Content     | The OMF message was successfully processed, but there is no additional information to return. | |
| 400 Bad Request    | The OMF message was malformed or not understood. The client should not retry sending the message without modifications.| The body or headers of the OMF message were incorrect. Verify the validity of the request contents and headers.
| 408 Request Timeout| The server did not reply to a request within the time that the client was prepared to wait. The client may repeat the request without modifications at any later time.| Server busy or over-loaded with other requests.|
| 409 Conflict       | The request could not be completed due to a conflict with the current state of the server.| The information in the OMF message contradicts the data currently stored in EDS.|
| 413 Payload Too Large| Payload size exceeds OMF body size limit.| The body of an OMF message has a maximum size of 192KB. A request with a body size exceeding the maximum will be rejected with this error code.|
| 500 Internal Server Error| The server encountered an unexpected condition.| Review EDS logs for more insight.|
| 503 Service Unavailable| The server is currently unavailable, retry later.| The EDS server is performing maintenance on one or more streams.|
