---
uid: ManualEgress
---

# Configure manual data egress

Once the AVEVA Data Hub or PI Server destinations are configured to receive OMF messages, you can send data egress requests as needed. For example, you may need to backfill data or want to review data for an event as soon as possible. For manual data egress, you specify the details of the data transfer which includes the start time and the data to egress. For more information on egress destinations, see [Configure egress destinations](xref:PrepareEgressDestinations).

Make requests in JSON using parameters, similar to periodic egress. You can either save the parameters in a file to send them or send the request directly. In addition to creating manual egress requests, you can cancel, resume, and delete these requests. 

## Send manual data egress request

To send a manual data egress request:

1. Create a JSON file.

  - For content structure, see the following [Example manual egress request](#example_manual_egress_request).

  **Note:** If you prefer, you can send the JSON request directly without saving the parameters to a file.

1. Update the parameters as needed. For descriptions of all available parameters, see [Parameters](#parameters).

1. Save the JSON file to any directory on the device where Edge Data Store is installed.

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `POST`:

  `http://localhost:5590/api/v1/configuration/storage/manualegresses`

Example using cURL, which must be run from the directory where the JSON file is saved:

```bash
curl -d "@{Filename}" -H "Content-Type: application/json" -X POST `http://localhost:5590/api/v1/configuration/storage/manualegresses`
```

## Parameters

The following table lists the parameters for manual egress.

| Parameter             | Required       | Type      | Description                                        |
|-----------------------|----------------|-----------|----------------------------------------------------|
| `Id`                  | Optional       | string    | Unique identifier of the request.                  |
| `EndpointId`          | Required       | string    | Destination that accepts OMF v1.2 and older messages. Supported destinations include AVEVA Data Hub and PI Server.|
| `Period`              | Optional       | string    | If the egress request includes future data, the `Period` is the frequency of time between each egress action after the `ScheduledTime`. Must be a string in the format `d.hh:mm:ss.##`. See `ScheduledTime` for additional information. If the egress request includes future data and the `Period` is not set, the default value is `00:60:00`, which is 60 minutes. If both the `StartIndex` and `EndIndex` are in the past, the `Period` is not used. |
| `ScheduledTime`           | Optional       | string    | The date and time when egress request will begin. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ` and Local: `yyyy-mm-ddThh:mm:ss`. Use the `ScheduledTime` parameter if you want data egress to begin at or after a specific time instead of beginning immediately. If you do not specify a `ScheduledTime`, EDS uses the time the request is received as the start time. <br>**Note:** The next egress job will not start until the previous egress job is complete. |
| `StartIndex`          | Optional       | string    | Start of the data to transfer. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `yyyy-mm-ddThh:mm:ss`, and Relative: `+d.hh:mm:ss.##` or `-d.hh:mm:ss.##`. Relative time strings are compared to the `ScheduledTime` to determine the start of the data to transfer. If the `ScheduledTime` is not specified, the relative time string is compared to the time the request is received.   |
| `EndIndex`            | Optional       | string    | End of the data to transfer. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `yyyy-mm-ddThh:mm:ss`, and Relative: `+d.hh:mm:ss.##`. Relative time strings are compared to the `StartIndex` to determine the start of the data to transfer. Relative time strings must be positive to ensure a range of data is selected for egress. |
| `DataSelectors`       | Optional       | array     | An array of configuration settings to select data for egress. See the `DataSelectors` parameters in the following table.    |

The following table lists egress parameters for `DataSelectors`.

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **Id**                          | Required                  | string    | Unique identifier of the data selector configuration. |
| **StreamFilter**                | Optional                  | string    | A filter used to determine which streams and types are egressed. For more information on valid filters, see [Search in SDS](xref:sdsSearching). |
| **AbsoluteDeadband**            | Optional                  | string    | Specifies the absolute change in data value that will cause the current value to pass the filter test.  |
| **PercentChange**               | Optional                  | string    | Specifies the percent change from previous value that will cause the current value to pass the filter test. |
| **ExpirationPeriod**            | Optional                  | string    | The length in time that can elapse after an event before automatically storing the next event. The expected format is `HH:MM:SS.###`. |

## Example manual egress request

The following is an example manual egress request.

```JSON
{
    "Id": "Egress1",
    "EndpointId": "AVEVA Data Hub_Location",
    "Period": "00:00:30",
    "ScheduledTime": "2022-08-10T21:20:00Z",
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

## Example response 

The following is an example response for a manual egress request.

```JSON
{ 
    "Id": "Egress1", 
    "EndpointId": "AVEVA Data Hub_Location", 
    "Period": "00:00:30", 
    "RequestTimeUtc": "2022-08-10T21:20:00Z", 
    "StartTime": "2022-08-10T21:20:00Z", 
    "DataSelectors": [ 
        { 
            "Id": "PercentChangeFilter", 
            "PercentChange": 1, 
        } 
    ], 
    "StartIndex": "2022-08-08T18:20:00Z", 
    "EndIndex": "2022-08-10T22:20:00Z", 
    "StartIndexDateTimeUtc": "2022-08-08T18:20:00Z", 
    "EndIndexDateTimeUtc": "2022-08-08T18:20:00Z", 
    "Checkpoint": null, 
    "Progress": 0, 
    "Status": "Active", 
    "Errors": null 
}
```

### Response parameters

Response parameters include information that was sent in the manual egress request and additional information about how the request will be processed. The following table lists the response parameters for manual egress.

| Parameter               | Type      | Description                                        |
|-------------------------|-----------|----------------------------------------------------|
| `RequestTimeUtc`        |
| `StartIndexDateTimeUtc` |
| `EndIndexDateTimeUtc`   |
| `Checkpoint`            |
| `Progress`              |
| `Status`                |
| `Errors`                |

## REST URLs

| Action     | Relative URL                                              | HTTP verb | Description                          |
|------------|-----------------------------------------------------------|-----------|--------------------------------------|
| List All   | `api/v1/configuration/storage/manualegresses`             | GET       | Returns the status of all manual egress jobs in the queue. |
| Status     | `api/v1/configuration/storage/manualegresses/<Id>`        | GET       | Returns the status of a specific egress job. |
| Resume     | `api/v1/configuration/storage/manualegresses/<Id>/resume` | POST      | Resumes a canceled or failed egress job.  |
| Cancel     | `api/v1/configuration/storage/manualegresses/<Id>/cancel` | POST      | Cancels an egress job.                |
| Delete     | `api/v1/configuration/storage/manualegresses/<Id>`        | DELETE    | Cancels all active history recovery operations and removes states |
| Delete All | `api/v1/configuration/storage/manualegresses`             | DELETE   | Gets the status of an individual history recovery

**Note:** Replace `<Id>` with the Id of the egress job for which you want to perform the action.
