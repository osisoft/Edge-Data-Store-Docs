---
uid: piEgressQuickStart
---

# PI System (PI Web API) egress quick start

This document is a quick tour of getting data stored in the Edge Data Store into a remote PI System. This is accomplished using PI Web API which is configured for Basic authentication.

## Create a periodic egress configuration

Configure Edge Storage periodic egress for the PI Web API endpoint and credentials:

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
        "DebugExpiration": null
}]
```

Edit the JSON above to add the server name of your PI Web API server, add a username and password properties to specify a valid account that can write data via PI Web API using Basic authentication. The StreamPrefix and TypePrefix can be used to ensure uniqueness on the destination system, if required. The StreamPrefix value will be used if provided in creating unique PI Points on the PI System. Run the following curl script to configure the Edge Storage to send data to the PI System. This configuration is set up to send all stream data to the PI System. If you wish to only send specific streams, edit the EgressFilter value. Examples of more advanced scenarios are in the Egress section of this documentation.

Save the JSON with the file name PeriodicEgressEndpoints.json and run the following curl script in the same directory where the file exists on the device where the Edge Data Store is installed. The file and curl script can be run from any directory on the device:

```bash
curl -i -d "@PeriodicEgressEndpoints.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/
```

When this command completes successfully, data will start being sent to the PI System.
