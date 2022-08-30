---
uid: ondemandEgress
---

# Configure on-demand data egress

Once the OCS or PI Server destinations are configured to receive OMF messages, you can send data egress requests as needed. For example, you may need to backfill data or want to review data for an event as soon as possible. For on-demand data egress, you specify the details of the data transfer which includes the start time and the data to egress. For more information on egress destinations, see [Configure egress destinations](xref: PrepareEgressDestinations).

Make requests in JSON using parameters, similar to periodic egress. You can either save the parameters in a file to send them or send the request directly. In addition to creating on-demand egress requests, you can cancel, resume, and delete these requests. 

## Send on-demand data egress request

To send an on-demand data egress request:

1. Create a JSON file.

    - For content structure, see the following [Example on-demand egress request](#Example_on-demand_egress_request).

**Note:** If you prefer, you can send the JSON request directly without saving the parameters to a file.

1. Update the parameters as needed. For descriptions of all available parameters, see [Parameters](#parameters).

1. Save the JSON file to any directory on the device where Edge Data Store is installed.

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `POST`:

  `http://localhost:5590/api/v1/configuration/storage/ondemandegresses`

Example using cURL, which must be run from the directory where the JSON file is saved:

```bash
curl -d "@{Filename}" -H "Content-Type: application/json" -X POST `http://localhost:5590/api/v1/configuration/storage/ondemandegresses`
```

## Resume an on-demand data egress request

You can resume an on-demand egress request to restart an egress that has failed or been canceled. 

To resume an on-demand data egress request:

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `POST`:

  `http://localhost:5590/api/v1/configuration/storage/ondemandegresses/Id/resume`

## Cancel an on-demand data egress request

You can cancel an on-demand egress request to stop the egress. If needed, you can resume a cancelled request.<!--What happens if the egress is in process?-->

To cancel an on-demand data egress request:

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `POST`:

  `http://localhost:5590/api/v1/configuration/storage/ondemandegresses/Id/cancel`

## Delete an on-demand data egress request

Delete an on-demand data egress request to stop the egress and remove the request. You cannot resume a deleted request.

To delete an on-demand data egress request:

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `DELETE`:

  `http://localhost:5590/api/v1/configuration/storage/ondemandegresses/Id`

  To delete all egress requests, use the following endpoint:

  `http://localhost:5590/api/v1/configuration/storage/ondemandegresses`

## Parameters

The following table lists the parameters for on-demand egress.

| Parameter             | Required       | Type      | Description                                        |
|-----------------------|----------------|-----------|----------------------------------------------------|
| `Id`                  | Optional       | string    | Unique identifier of the request.                  |
| `EndpointId`            | Required       | string    | Destination that accepts OMF v1.2 and older messages. Supported destinations include OCS and PI Server.|
| `Period`              | Optional       | string    | If both the `StartIndex` and `EndIndex` are in the past, the `Period` is not used. If the egress request includes future data, the `Period` is the frequency of time between each egress action after the `StartTime` . Must be a string in the format `d.hh:mm:ss.##`. See `StartTime` for additional information. If the egress request includes future data and the `Period` is not set, the default value is `00:01:00`, which is 1 minute. |
| `StartTime`           | Optional       | string    | The date and time when egress request should begin. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ` and Local: `yyyy-mm-ddThh:mm:ss`. Use the `StartTime` parameter if you want data egress to begin at or after a specific time instead of beginning immediately. If you do not specify a `StartTime`, EDS uses the time the request is received as the start time. <br>**Note:** The next egress will not start until the previous egress is complete. |
| `StartIndex`          | Optional       | string    | Start of the data to transfer. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `yyyy-mm-ddThh:mm:ss`, and Relative: `+d.hh:mm:ss.##` or `-d.hh:mm:ss.##`. Relative time strings are compared to the `StartTime` to determine the start of the data to transfer. If the `StartTime` is not specified, the relative time string is compared to the time the request is received.   |
| `EndIndex`            | Optional       | string    | End of the data to transfer. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `yyyy-mm-ddThh:mm:ss`, and Relative: `+d.hh:mm:ss.##` or `-d.hh:mm:ss.##`. Relative time strings are compared to the `StartIndex` to determine the start of the data to transfer.  |
| `DataSelectors`       | Optional       | array     | An array of DataSelectors configurations of the data selectors for egress. See the `DataSelectors` parameters in the following table.    |

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
    "EndpointId": "OCS_Location",
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
  "EndpointId": "OCS_Location",
  "Period": "00:00:30",
  "EndIndex": "+00:15:00"
}
```

### Example resume egress request

```JSON
{
  "Id": "Request_Id",
  "EndpointId": "OCS_Location",
  "StartIndex": "-00:05:00"
}
```

### Example delete egress request

```JSON
{
  "Id": "Request_Id",
  "EndpointId": "OCS_Location",
  "StartTime": "2022-08-10T10:20:00",
  "StartIndex": "-00:10:00",
  "EndIndex": "+00:30:00"
}
```