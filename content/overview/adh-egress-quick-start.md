---
uid: adhEgressQuickStart
---

# AVEVA Data Hub egress quick start

Data egress provides a mechanism to transfer data to AVEVA Data Hub using OMF messages. To get started sending data stored in Edge Data Store to AVEVA Data Hub, prepare the destination and configure the `EgressEndpoints` facet to use that destination.

## AVEVA Data Hub destinations

To prepare AVEVA Data Hub to receive OMF messages from EDS, create an OMF connection in AVEVA Data Hub. Creating an OMF connection results in an available OMF endpoint that EDS can use for the egress mechanism.

To create an OMF connection to AVEVA Data Hub:

1. In AVEVA Data Hub, create a client. For details, see [Clients](https://docs.osisoft.com/bundle/data-hub/page/set-up/clients/clients-concept.html) in the AVEVA Data Hub documentation.
   
  The **Client Id** and **Client Secret** are used for the corresponding properties in the `EgressEndpoints` configuration.
   
1. In AVEVA Data Hub, create an OMF connection. For details, see [Configure an OMF connection](https://docs.osisoft.com/bundle/data-hub/page/add-organize-data/collect-data/connectors/omf/omf-connection-procedure.html) in the AVEVA Data Hub documentation.
  
  The **OMF Endpoint** URL for the connection is used as the `EgressEndpoints` configuration **Endpoint** parameter.

## Create an egress configuration

To configure Edge Data Store periodic egress to AVEVA Data Hub, follow the steps in [Configure periodic data egress](https://docs.osisoft.com/bundle/edge-data-store/page/egress/configure-data-egress.html#create-egress-configuration).

To configure Edge Data Store manual egress to AVEVA Data Hub, follow the steps in [Configure manual data egress](https://docs.osisoft.com/bundle/edge-data-store/page/egress/manual-egress.html#send-manual-data-egress-request).
