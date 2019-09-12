---
uid: omfOverview
---

# OSIsoft Message Format (OMF) ingress with Edge Storage

The Edge Storage component supports both OMF version 1.0 and OMF version 1.1 for data ingress. The OMF ingress functionality is the same technology that is used in OSIsoft Cloud Services (OCS). Writing an OMF application to run on EDS is very similar to writing an OMF application to write data to OCS. No authentication is necessary for writing to Edge Data Store, as long as the application is running on the same computer or device as Edge Data Store. Remote access to OMF data ingress is currently not supported.

## OMF specification

The OMF specification may be found here: <http://omf-docs.osisoft.com>

EDS uses OMF technology developed for use on OSIsoft Cloud Services (OCS), and the behavior of OMF in EDS is very similar to OCS. Dynamic messages are supported, but static messages (usually used for creating PI AF assets) are not supported by EDS. Any static OMF messages sent to the EDS OMF REST endpoint will be ignored.

## OMF endpoint

The route to the OMF endpoint provided by the Edge Storage component is:

```http
Method: POST
Endpoint: http://localhost:5590/api/v1/tenants/default/namespaces/default/omf
```

## Supported functionality

The OMF endpoint for the Edge Storage component supports both OMF version 1.0 and OMF version 1.1 for data ingress. Errors will be returned if a later version of OMF is specified.

The OMF endpoint for the Edge Storage component does not support the update action - only create messages are supported. If a create data message is sent with the same time index the values will be replaced at that index value.

It is recommended for reasons of efficiency that OMF messages being sent to the EDS endpoint be batched. Sending single messages or a small number of messsages can be successful to the OMF endpoint, but it is relatively inefficient. When a single message or a small number of messages are sent at a time the HTTP overhead of creating the request and processing the response on a small device is more expensive than the processing of the OMF message itself. While a large number of OMF messages per second can be processed by EDS platforms, for purposes of efficiency it is recommended that the number of HTTP calls per second be kept fairly low.
