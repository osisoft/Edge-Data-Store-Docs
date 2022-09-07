---
uid: ocsEgressQuickStart
---

# AVEVA Data Hub egress quick start

Data egress provides a mechanism to transfer data to AVEVA Data Hub using OMF messages. To get started sending data stored in Edge Data Store to AVEVA Data Hub, create an OMF connection in AVEVA Data Hub and configure an egress endpoint with the connection information for AVEVA Data Hub.

## Create an OMF connection in AVEVA Data Hub

To create an OMF connection in AVEVA Data Hub:

1. In AVEVA Data Hub, create a client. For details, see [Clients](https://docs.osisoft.com/bundle/data-hub/page/set-up/clients/clients-concept.html) in the AVEVA Data Hub documentation.

  The **Client Id** and **Client Secret** are used for the corresponding properties in the egress configuration.

1. In AVEVA Data Hub, create an OMF connection. For details, see [Configure an OMF connection](https://docs.osisoft.com/bundle/data-hub/page/add-organize-data/collect-data/connectors/omf/omf-connection-procedure.html) in the AVEVA Data Hub documentation.

  The **OMF Endpoint** URL for the connection is used as the egress configuration **EndpointId** parameter.

## Create a periodic egress configuration

To configure periodic egress to AVEVA Data Hub:

1. Create a JSON file containing one or more egress endpoints, by copying the following example into a text editor.

   ```json
   [{
       "Id": "AVEVA Data Hub",
       "ExecutionPeriod": "00:00:50",
       "Name": null,
       "NamespaceId": "default",
       "Description": null,
       "Enabled": true,
       "Backfill": false,
       "EgressFilter": "",
       "StreamPrefix": "ChangeMe",
       "TypePrefix": "ChangeMe",
       "Endpoint": "https://<your AVEVA Data Hub OMF endpoint>",
       "ClientId": "<your AVEVA Data Hub ClientId>",
       "ClientSecret": "<your AVEVA Data Hub ClientSecret>",
       "UserName": null,
       "Password": null,
       "DebugExpiration": null,
       "ValidateEndpointCertificate": true,
       "TokenEndpoint": null
   }]
   ```

1. Modify the **Endpoint** parameter to be the URL of the AVEVA Data Hub OMF endpoint.

1. Modify the **ClientId** and **ClientSecret** parameters with the authentication information to connect to the AVEVA Data Hub OMF endpoint.

    **Note:** If uniqueness is required on the destination system, use the **StreamPrefix** and **TypePrefix** parameters. If a **StreamPrefix** is specified, it is used to create a unique stream ID on AVEVA Data Hub. This configuration is set up to send all stream data to AVEVA Data Hub. To only send specific streams, edit the **EgressFilter** parameter. For examples of more advanced scenarios, see [Data egress configuration](xref:egress).

1. Save the JSON file with the name `PeriodicEgressEndpoints.json` to any directory on the device where EDS is installed.

1. To configure the Edge Storage component to send data to AVEVA Data Hub, run the following curl script from the directory where the JSON file is located.

    ```bash
    curl -d "@PeriodicEgressEndpoints.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/
    ```

   When this command completes successfully, data egress to AVEVA Data Hub begins.
