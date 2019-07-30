---
uid: ocsEgressQuickStart
---

# OSIsoft Cloud Services (OCS) Egress Quick Start

This topic is a quick tour of getting data stored in the Edge System into OCS. You can accThis is accomplished using the OCS OMF endpoint which is configured for OCS authentication.

## Create a Periodic Egress configuration

The first step is to configure Edge Storage Periodic Egress for the PI Web API endpoint and credentials:

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

1. Edit the JSON above to add the URL of your OCS OMF endpoint. 
2. Add a ClientId and ClientScret that can write data to your OCS tenant and namespace. 
OSIsoft also recommendes that each device have a unique StreamPrefix and TypePrefix. These values will be used when creating unique streams on OCS. 
3. Run the following curl script to configure the Edge Storage to send data to the PI System. 
This configuration is set up to send all stream data to the PI System. 
4. Optional: If you want to only send specific streams, edit the EgressFilter value. 
Examples of more advanced scenarios are in the Egress section of this documentation.
5. Save the JSON with the file name PeriodicEgressEndpoints.json.
6. Run the following curl script in the same diretory where the file exists on the device where the Edge System is installed. You can run the file and curl script from any directory on the device:

```bash
curl -i -d "@PeriodicEgressEndpoints.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/PeriodicEgressEndpoints/
```

When this command completes successfully, data will start being sent to the OCS.
