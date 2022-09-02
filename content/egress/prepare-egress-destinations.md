---
uid: PrepareEgressDestinations
---

# Configure egress destinations

OCS and PI Server destinations require additional configuration to receive OMF messages. Once you configure a destination, you can use the `EndpointId` parameter to specify it as the destination of the data in periodic and manual egress configurations.

## OCS destinations

To configure OCS to receive OMF messages from EDS, create an OMF connection in OCS. Creating an OMF connection results in an available OMF endpoint that can be used by the EDS egress mechanism.

To create an OMF connection to OCS:

1. In OCS, create a **Client**. For details, see [Clients](https://docs.osisoft.com/bundle/ocs/page/set-up/clients/clients-concept.html) in the OCS documentation.
   
   - The **Client Id** and **Client Secret** are used for the corresponding properties in the egress configuration.
   
1. Create an **OMF** type **Connection**.
   
   - The connection should link the created client to an existing [namespace](https://docs.osisoft.com/bundle/ocs/page/set-up/namespaces/namespaces-concept.html) where the data will be stored.
  
   The **OMF Endpoint** URL for the connection is used as the egress configuration `EndpointId` parameter.

## PI Server destinations

To prepare a PI Server to receive OMF messages from EDS, a PI Web API OMF endpoint must be available.

To create an OMF connection to PI Server:

1. Install PI Web API and enable the **OSIsoft Message Format (OMF) Services** feature.

    - During configuration, choose an AF database and PI Data Archive where metadata and data will be stored.
    
    - The account used in an egress configuration needs permissions to create AF elements, element templates, and PI points.

1. Configure PI Web API to use `Basic` authentication.

 For complete steps, as well as best practices and recommendations, see the [PI Web API User Guide](https://docs.osisoft.com/bundle/pi-web-api/page/pi-web-api.html).

**Note:** The certificate used by PI Web API must be trusted by the device running EDS, otherwise the egress configuration `ValidateEndpointCertificate` property needs to be set to `false`. This can be the case with a **self-signed certificate**, which should only be used for testing purposes.

**Note:** To continue to send OMF egress messages to the PI Web API endpoint after upgrading PI Web API, restart the EDS service.
<!-- What is used for the EndpointId parameter in this case? -->