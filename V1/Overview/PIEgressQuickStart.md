---
uid: piEgressQuickStart
---

# PI System (PI Web API) egress quick start

This quick start gives an overview on how to get data stored in the Edge Data Store into a remote PI System. You can accomplish this using PI Web API which is configured for Basic authentication.

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

1. Edit the JSON above to add the server name of your PI Web API server.
2. Add a username and password properties to specify a valid account that can write data through PI Web API using Basic authentication. You can use the StreamPrefix and TypePrefix to ensure uniqueness on the destination system, if required. If you provide the StreamPrefix value, it will be used in creating unique PI Points on the PI System. 
3. Run the following curl script to configure the data store to send data to the PI System. This configuration is set up to send all stream data to the PI System. 
4. Optional: If you want to only send specific streams, edit the EgressFilter value. For examples of more advanced scenarios, see [Egress](xref:egress).
5. Save the JSON with the file name PeriodicEgressEndpoints.json.
6. Run the following curl script in the same directory where the file exists on the device where the Edge Data Store is installed. The file and curl script can be run from any directory on the device:

```bash
curl -i -d "@PeriodicEgressEndpoints.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/
```

When this command completes successfully, data will start being sent to the PI System.
