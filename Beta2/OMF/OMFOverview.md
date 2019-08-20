---
uid: omfOverview
---

# OSIsoft Message Format (OMF) ingress with Edge Storage

The Edge Storage component supports both OMF version 1.0 and OMF version 1.1 for data ingress. The OMF ingress functionality is the same technology that is used in OSIsoft Cloud Services (OCS). Writing an OMF application to run on EDS is very similar to writing an OMF application to write data to OCS. No authentication is necessary for writing to Edge System, as long as the application is running on the same computer or device as Edge System. Remote access to OMF data ingress is currently not supported.

## OMF specification

The OMF specification may be found here: <http://omf-docs.osisoft.com>

## OMF endpoint

The route to the OMF endpoint provided by the Edge Storage component is:

```http
Method: POST
Endpoint: http://localhost:5590/api/v1/tenants/default/namespaces/default/omf
```

## Supported functionality

The OMF endpoint for the Edge Storage component supports both OMF version 1.0 and OMF version 1.1 for data ingress.

The OMF endpoint for the Edge Storage component does not support the update action.
