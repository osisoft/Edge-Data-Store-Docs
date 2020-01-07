---
uid: piEgressQuickStart
---

# PI egress quick start

This topic provides quick start instructions for egressing data stored in the Edge Data Store into a remote PI System. This is accomplished using PI Web API which is configured for basic authentication.

The examples here use curl, a commonly available tool on both Windows and Linux, and command line commands. You can use the same operations with any programming language or tool that supports making REST calls. You can also accomplish data retrieval steps (GET commands) using a browser, if available on your device.

## Create a periodic egress configuration

Complete the following to configure Edge Storage periodic egress for the PI Web API endpoint and credentials:

1. Use the following example to create a JSON file.

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

2. Add the server name, username, and password of your PI Web API server into the "Endpoint" definition.  You must specify a valid user account that can write data via PI Web API using Basic authentication.  See [Data egress configuration](xref:egress) for examples.

**Note:** StreamPrefix and TypePrefix values can be used to ensure uniqueness on the destination system, if required. The StreamPrefix value will create unique PI Points on the PI System. If you want to only send specific streams, edit the "EgressFilter" value. Examples of more advanced scenarios are in the Egress section of this documentation.

3. Save the JSON file with the name PeriodicEgressEndpoints.json.
4. To configure Edge Storage to send data to the PI System, run the following curl script from the same directory where you saved the JSON file. 

**Note:** You can run the file and curl script from any directory on the device as long as the file and the curl script are run from the same directory.

```bash
curl -i -d "@PeriodicEgressEndpoints.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/
```

When the command completes successfully, data will start being sent to the PI System.