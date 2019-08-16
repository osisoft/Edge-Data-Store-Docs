---
uid: ocsEgressQuickStart
---

# OSIsoft Cloud Services (OCS) egress quick start

This quick start gives an overview on how to get get data stored in the Edge Data Store into OCS. You can accomplish this by using the OCS OMF endpoint which is configured for OCS authentication.

## Create a periodic egress configuration

Configure Edge Storage periodic egress for the PI Web API endpoint and credentials:

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
    "Endpoint": "https:/<your OCS OMF end point endpoint>",
    "ClientId": "<your OCS ClientId>",
    "ClientSecret": "<your OCS ClientSecret>",
    "UserName": null,
    "Password": null,
    "DebugExpiration": null
}]
```

1. Edit the previous JSON to add the URL of your OCS OMF endpoint.
2. Add a ClientId and ClientSecret that can write data to your OCS tenant and namespace.
You can use the StreamPrefix and TypePrefix to ensure uniqueness on the destination system, if required. If you specify a StreamPrefix, it will be used to create a unique stream id on OCS.
3. Run the following curl script to configure the Edge Storage to send data to the PI System.
This configuration is set up to send all stream data to the PI System.
**Note:** If you want to only send specific streams, edit the EgressFilter value. 
For examples of more advanced scenarios, see [Egress](xref:egress).
4. Save the JSON with the file name PeriodicEgressEndpoints.json.
5. Run the following curl script in the same directory where the file exists, on the device where the Edge Data Store is installed. You can run the file and curl script from any directory on the device:

```bash
curl -i -d "@PeriodicEgressEndpoints.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/
```

When this command completes successfully, data will start being sent to the OCS.
