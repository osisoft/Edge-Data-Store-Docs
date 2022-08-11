---
uid: ondemandEgress
---

# On-demand data egress

Once the OCS or PI Server destinations are prepared to receive OMF messages, you can send data egress requests as needed. For on-demand data egress, you specify the details of the data transfer which can include the start time. If you send multiple on-demand egress requests, EDS creates a queue of the requests based on the specified start time and the request time. <!--this needs clarification-->

In addition to creating on-demand egress requests, you can cancel, resume, and delete these requests.

Unlike standard data egress, the configurations are not stored.

## Send on-demand data egress request

To send a data egress request:<!--do we recommend saving the JSON file? Or just configuring on the fly?-->

1. Create a JSON file.

    - For content structure, see the following [Examples](#examples).

1. Update the parameters as needed. For a table of all available parameters, see [Parameters](#parameters).

1. Save the JSON file to any directory on the device where Edge Data Store is installed.

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `POST`:

  `http://localhost:5590/api/v1/configuration/storage/egresses`

### Parameters

The following table lists the parameters for on-demand egress.

| Parameter             | Required       | Type      | Description                                        |
|-----------------------|----------------|-----------|----------------------------------------------------|
| `Id`                  | Required       | string    | Unique identifier of the request.                  |
| `Endpoint`            | Required       | string    | Destination that accepts OMF v1.2 and older messages. Supported destinations include OCS and PI Server.|
| `Period`              | Required       | string    | Frequency of time between each egress action beginning at or after the `StartTime`. Must be a string in the format `d.hh:mm:ss.##`. See `StartTime` for additional information. <!--How is this used for on-demand egress?-->|
| `StartTime`           | Optional       | string    | The date and time when egress request should begin. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ` and Local: `mm-dd-yyyy hh:mm:ss`. Use the `StartTime` parameter if you want data egress to begin at or after a specific time instead of beginning immediately. If you do not specify a `StartTime`, egress begins as soon as you submit the configuration. <br>**Note:**`** The next egress will not start until the previous egress is complete. |
| `StartIndex`          | Required       | string    | Start of the data to transfer. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `mm-dd-yyyy hh:mm:ss`, and Relative: `d.hh:mm:ss.##`. Relative time strings are compared to the `StartTime` to determine the start of the data to transfer. If the `StartTime` is not specified, the relative time string is compared to the time the request is received.   |
| `EndIndex`            | Required       | string    | End of the data to transfer. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `mm-dd-yyyy hh:mm:ss`, and Relative: `d.hh:mm:ss.##`. Relative time strings are compared to the `StartIndex` to determine the start of the data to transfer.  |
| `DataSelectors`       | Optional       | array     | Ids of the data selectors for egress. <!--what selectors can be used and what do they mean?-->    |

### Example on-demand egress request

```JSON
{
    "Id": "Request_Id",
    "EndpointId": "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
    "Period": "00:00:30",
    "StartTime": "2022-08-10T21:20:00Z",
    "StartIndex": "2022-08-08T18:20:00Z",
    "EndIndex": "2022-08-10T22:20:00Z",
    "DataSelectors": [
        {
            "id": "PercentChangeFilter",
            "percentChange": 1
        }
    ]
}
```

### Example cancel egress request

```JSON
{
  "Id": "Request_Id",
  "EndpointId": "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
  "Period": "00:00:30",
  "EndIndex": "+00:15:00"
}
```

### Example resume egress request

```JSON
{
  "Id": "Request_Id",
  "EndpointId": "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
  "StartIndex": "-00:05:00"
}
```

### Example delete egress request

```JSON
{
  "Id": "Request_Id",
  "EndpointId": "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
  "StartTime": "2022-08-10T10:20:00",
  "StartIndex": "-00:10:00",
  "EndIndex": "+00:30:00"
}
```
