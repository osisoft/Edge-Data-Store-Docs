---
uid: ocsEgressQuickStart
---

# OCS egress quick start

Data egress provides a mechanism to transfer data to OSIsoft Cloud Services using OMF messages. To get started sending data stored in Edge Data Store to OCS, create an OMF connection in OCS and configure an egress endpoint with the connection information for OCS.

## Create an OMF connection in OCS

To create an OMF connection in OCS, follow these steps:

1. In OCS, create a **Client**.

  The `Client Id` and `Client Secret` are used for the corresponding properties in the egress configuration.

1. In OCS, create an **OMF** type **Connection**.

  The connection should link the client to an existing namespace where the data will be stored. The **OMF Endpoint** URL for the connection is used as the value for the `Endpoint` property in the egress configuration.

  For complete steps, as well as best practices and recommendations, see the [OSIsoft Cloud Services documentation](https://docs.osisoft.com/bundle/ocs/page/ocs-content-portal-overview.html).

## Create a periodic egress configuration

To configure periodic egress to OCS, follow these steps:

1. Create a JSON file containing one or more egress endpoints, by copying the following example into a text editor.

   ```json
   [{
       "Id": "OCS",
       "ExecutionPeriod": "00:00:50",
       "Name": null,
       "NamespaceId": "default",
       "Description": null,
       "Enabled": true,
       "Backfill": false,
       "EgressFilter": "",
       "StreamPrefix": "ChangeMe",
       "TypePrefix": "ChangeMe",
       "Endpoint": "https://<your OCS OMF endpoint>",
       "ClientId": "<your OCS ClientId>",
       "ClientSecret": "<your OCS ClientSecret>",
       "UserName": null,
       "Password": null,
       "DebugExpiration": null,
       "ValidateEndpointCertificate": true,
       "TokenEndpoint": null
   }]
   ```

1. Modify the **Endpoint** parameter to be the URL of the OCS OMF endpoint.

1. Modify the **ClientId** and **ClientSecret** parameters with the authentication information to connect to the OCS OMF endpoint.

    **Note:** If uniqueness is required on the destination system, use the **StreamPrefix** and **TypePrefix** parameters. If a **StreamPrefix** is specified, it is used to create a unique stream ID on OCS. This configuration is set up to send all stream data to OCS. To only send specific streams, edit the **EgressFilter** parameter. For examples of more advanced scenarios, see [Data egress configuration](xref:egress).

1. Save the JSON file with the name `PeriodicEgressEndpoints.json` to any directory on the device where EDS is installed.

1. To configure the Edge Storage component to send data to OCS, run the following curl script from the directory where the JSON file is located.

    ```bash
    curl -d "@PeriodicEgressEndpoints.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/
    ```

   When this command completes successfully, data egress to OCS begins.
