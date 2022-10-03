---
uid: adhEgressQuickStart
---

# AVEVA Data Hub egress quick start

Data egress provides a mechanism to transfer data to AVEVA Data Hub using OMF messages. To get started sending data stored in Edge Data Store to AVEVA Data Hub, configure an AVEVA Data Hub destination and configure periodic egress to use that destination.

## AVEVA Data Hub destinations

To configure AVEVA Data Hub to receive OMF messages from EDS, create an OMF connection in AVEVA Data Hub. Creating an OMF connection results in an available OMF endpoint that EDS can use for the egress mechanism.

To create an OMF connection to AVEVA Data Hub:

1. In AVEVA Data Hub, create a client. For details, see [Clients](https://docs.osisoft.com/bundle/data-hub/page/set-up/clients/clients-concept.html) in the AVEVA Data Hub documentation.
   
  The **Client Id** and **Client Secret** are used for the corresponding properties in the egress configuration.
   
1. In AVEVA Data Hub, create an OMF connection. For details, see [Configure an OMF connection](https://docs.osisoft.com/bundle/data-hub/page/add-organize-data/collect-data/connectors/omf/omf-connection-procedure.html) in the AVEVA Data Hub documentation.
  
  The **OMF Endpoint** URL for the connection is used as the egress configuration **EndpointId** parameter.

## Create a periodic egress configuration

To configure Edge Storage periodic egress for the AVEVA Data Hub endpoint and credentials, follow the steps in [Configure data egress](https://docs.osisoft.com/bundle/edge-data-store/page/egress/configure-data-egress.html#create-configurations).
