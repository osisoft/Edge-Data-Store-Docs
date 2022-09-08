---
uid: ManageEgressJobs
---

# Manage egress jobs


## Resume a manual data egress request

You can resume a manual egress request to restart an egress that has failed or been canceled. 

To resume a manual data egress request:

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `POST`:

  `http://localhost:5590/api/v1/configuration/storage/manualegresses/Id/resume`

### Example cancel egress request

```JSON
{
  "Id": "Request_Id",
  "EndpointId": "AVEVA Data Hub_Location",
  "Period": "00:00:30",
  "EndIndex": "+00:15:00"
}
```

## Cancel a manual data egress request

You can cancel a manual egress request to stop the egress. If needed, you can resume a cancelled request.

To cancel a manual data egress request:

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `POST`:

  `http://localhost:5590/api/v1/configuration/storage/manualegresses/Id/cancel`

### Example resume egress request

```JSON
{
  "Id": "Request_Id",
  "EndpointId": "AVEVA Data Hub_Location",
  "StartIndex": "-00:05:00"
}
```

## Delete a manual data egress request

Delete a manual data egress request to stop the egress and remove the request. You cannot resume a deleted request.

To delete a manual data egress request:

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `DELETE`:

  `http://localhost:5590/api/v1/configuration/storage/manualegresses/Id`

  To delete all egress requests, use the following endpoint:

  `http://localhost:5590/api/v1/configuration/storage/manualegresses`

### Example delete egress request

```JSON
{
  "Id": "Request_Id",
  "EndpointId": "AVEVA Data Hub_Location",
  "ScheduledTime": "2022-08-10T10:20:00",
  "StartIndex": "-00:10:00",
  "EndIndex": "+00:30:00"
}
```