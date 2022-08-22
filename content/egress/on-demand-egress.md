---
uid: ondemandEgress
---

# On-demand data egress

Once the OCS or PI Server destinations are prepared to receive OMF messages, you can send data egress requests as needed. For on-demand data egress, you specify the details of the data transfer which can include the start time. If you send multiple on-demand egress requests, EDS creates a queue of the requests based on the specified start time and the request time. <!--this needs clarification-->

In addition to creating on-demand egress requests, you can cancel, resume, and delete these requests. Make requests in JSON using parameters, similar to periodic egress. You can either save the parameters in a file to send them or send the request directly.

## Send on-demand data egress request

To send an on-demand data egress request:

1. Create a JSON file.

    - For content structure, see the following [Examples](#examples).

1. Update the parameters as needed. For a table of all available parameters, see [Parameters](#parameters).

1. Save the JSON file to any directory on the device where Edge Data Store is installed.

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `POST`:

  `http://localhost:5590/api/v1/configuration/storage/egresses`

**Note:** If you prefer, you can send the JSON request directly without saving the parameters to a file.

## Delete an on-demand data egress request

To delete an on-demand data egress request:

1. Create a JSON file.

    - For content structure, see the following [Examples](#examples).

1. Update the parameters as needed. For a table of all available parameters, see [Parameters](#parameters).

1. Save the JSON file to any directory on the device where Edge Data Store is installed.

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `DELETE`:

  `http://localhost:5590/api/v1/configuration/storage/egresses`

**Note:** If you prefer, you can send the JSON request directly without saving the parameters to a file.

## Parameters

The following table lists the parameters for on-demand egress.

| Parameter             | Required       | Type      | Description                                        |
|-----------------------|----------------|-----------|----------------------------------------------------|
| `Id`                  | Required       | string    | Unique identifier of the request.                  |
| `Endpoint`            | Required       | string    | Destination that accepts OMF v1.2 and older messages. Supported destinations include OCS and PI Server.|
| `Period`              | Optional       | string    | If both the `StartIndex` and `EndIndex` are in the past, the `Period` is not used. If the egress request includes future data, the `Period` is the frequency of time between each egress action after the `StartTime` . Must be a string in the format `d.hh:mm:ss.##`. See `StartTime` for additional information. If the egress request includes future data and the `Period` is not set, the default value is `0.00:01:00`, which is 1 minute. |
| `StartTime`           | Optional       | string    | The date and time when egress request should begin. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ` and Local: `mm-dd-yyyy hh:mm:ss`. Use the `StartTime` parameter if you want data egress to begin at or after a specific time instead of beginning immediately. If you do not specify a `StartTime`, egress begins as soon as you submit the configuration. <br>**Note:** The next egress will not start until the previous egress is complete. |
| `StartIndex`          | Required       | string    | Start of the data to transfer. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `mm-dd-yyyy hh:mm:ss`, and Relative: `d.hh:mm:ss.##`. Relative time strings are compared to the `StartTime` to determine the start of the data to transfer. If the `StartTime` is not specified, the relative time string is compared to the time the request is received.   |
| `EndIndex`            | Required       | string    | End of the data to transfer. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `mm-dd-yyyy hh:mm:ss`, and Relative: `d.hh:mm:ss.##`. Relative time strings are compared to the `StartIndex` to determine the start of the data to transfer.  |
| `DataSelectors`       | Optional       | array     | Ids of the data selectors for egress. See the `DataSelectors` parameters in the following table.    |

The following table lists egress parameters for `DataSelectors`.

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **Id**                          | Required                  | string    | Unique identifier of the data selector configuration. |
| **StreamFilter**                | Optional                  | string    | A filter used to determine which streams and types are egressed. For more information on valid filters, see [Search in SDS](xref:sdsSearching). |
| **AbsoluteDeadband**            | Optional                  | string    | Specifies the absolute change in data value that should cause the current value to pass the filter test. At least one of `AbsoluteDeadband` or `PercentChange` must be specified. |
| **PercentChange**               | Optional                  | string    | Specifies the percent change from previous value that should cause the current value to pass the filter test. At least one of `AbsoluteDeadband` or `PercentChange` must be specified. |
| **ExpirationPeriod**            | Optional                  | string    | The length in time that can elapse after an event before automatically storing the next event. The expected format is `HH:MM:SS.###`. |

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
