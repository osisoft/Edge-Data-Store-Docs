---
uid: piEgressQuickStart
---

# PI egress quick start

Data egress provides a mechanism to transfer data to PI Server using OMF messages through a PI Web API endpoint. To get started sending data stored in Edge Data Store to a PI System, create a PI Web API OMF endpoint and configure periodic egress to use the PI Web API endpoint.

## Create a PI Web API OMF endpoint

To create a PI Web API OMF endpoint, follow these steps:

1. Install PI Web API and enable the **OSIsoft Message Format (OMF) Services** feature.

    - During configuration, choose an AF database and PI Data Archive where metadata and data will be stored.

    - The account used in an egress configuration needs permissions to create AF elements, element templates, and PI points.

2. Configure PI Web API to use `Basic` authentication.

 For complete steps, as well as best practices and recommendations, see the [PI Web API User Guide](https://docs.osisoft.com/bundle/pi-web-api/page/pi-web-api.html).

 **Note:**  The certificate used by PI Web API must be trusted by the device running EDS, otherwise the egress configuration **ValidateEndpointCertificate** property needs to be set to `false`, which can be the case with a self-signed certificate, but should only be used for testing purposes.

## Create a periodic egress configuration

To configure Edge Storage periodic egress for the PI Web API endpoint and credentials, follow these steps:

1. Create a JSON file containing one or more egress endpoints, by copying the following example into a text editor.

   ```json
   [{
       "Id": "PWA",
       "ExecutionPeriod": "00:00:50",
       "Name": null,
       "NamespaceId": "default",
       "Description": null,
       "Enabled": true,
       "Backfill": false,
       "EgressFilter": "",
       "StreamPrefix": "<unique stream prefix>",
       "TypePrefix": "<unique type prefix>",
       "Endpoint": "https://<your PI Web API Server>/piwebapi/omf/",
       "ClientId": null,
       "ClientSecret": null,
       "UserName": "<username>",
       "Password": "<password>",
       "DebugExpiration": null,
       "ValidateEndpointCertificate": true,
       "TokenEndpoint": null
   }]
   ```

1. Modify the **Endpoint** parameter with the name of the PI Web API sever.

1. Modify the **Username** and **Password** parameters to specify a valid user account that can write data with PI Web API using Basic authentication. For examples, see [Configure data egress](xref:configureEgress).

   **Note:** The **StreamPrefix** and **TypePrefix** parameters ensure uniqueness on the destination system, if required. The StreamPrefix value creates unique PI Points on the PI System. To only send specific streams, edit the **EgressFilter** value. For examples of more advanced scenarios, see [Data egress configuration](xref:egress).

1. Save the JSON file with the name `PeriodicEgressEndpoints.json` to any directory on the device where EDS is installed.

1. To configure Edge Storage to send data to the PI System, run the following curl script from the directory where the JSON file is located.

```bash
curl -d "@PeriodicEgressEndpoints.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/
```

When the command completes successfully, data egress to the PI System begins.
