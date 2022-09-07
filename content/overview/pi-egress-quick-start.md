---
uid: piEgressQuickStart
---

# PI Server egress quick start

Data egress provides a mechanism to transfer data to PI Server using OMF messages through a PI Web API endpoint. To get started sending data stored in Edge Data Store to a PI Server, create a PI Web API OMF endpoint and configure periodic egress to use the PI Web API endpoint.

## Create a PI Web API OMF endpoint

To create a PI Web API OMF endpoint:

1. Install PI Web API and enable the **OSIsoft Message Format (OMF) Services** feature.

    - During configuration, choose an AF database and PI Data Archive where metadata and data will be stored.

    - The account used in an egress configuration needs permissions to create AF elements, element templates, and PI points.

2. Configure PI Web API to use `Basic` authentication.

 For complete steps, as well as best practices and recommendations, see the [PI Web API User Guide](https://docs.osisoft.com/bundle/pi-web-api/page/pi-web-api.html).

 **Note:**  The certificate used by PI Web API must be trusted by the device running EDS, otherwise the egress configuration **ValidateEndpointCertificate** property needs to be set to `false`, which can be the case with a self-signed certificate, but should only be used for testing purposes.

## Create a periodic egress configuration

To configure Edge Storage periodic egress for the PI Web API endpoint and credentials, follow the steps in [Configure data egress](https://docs.osisoft.com/bundle/edge-data-store/page/egress/configure-data-egress.html#create-configurations).
