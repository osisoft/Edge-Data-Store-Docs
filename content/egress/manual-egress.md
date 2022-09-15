---
uid: ManualEgress
---

# Configure manual data egress

Manual data egress is a task that sends the timeseries data collected by EDS to long term storage in either AVEVA Data Hub or PI Server. You can create multiple egress destinations and multiple manual egress tasks. Periodic egress runs on a regular schedule to ensure that data is sent to long term storage.

Once the AVEVA Data Hub or PI Server destinations are configured to receive OMF messages, you can send data egress requests as needed. For example, you may need to backfill data or want to review data for an event as soon as possible. For more information on egress destinations, see [Configure egress destinations](xref:PrepareEgressDestinations). 

Make requests in JSON using parameters, similar to periodic egress, to specify the data to egress and when the egress should happen. You can either save the parameters in a file to send them or send the request directly. In addition to creating manual egress requests, you can cancel, resume, and delete these requests. 

**Note:** The maximum number of manual egress jobs is 50. If the maximum number is reached, new manual egress requests will be rejected. Use the delete URLs to remove egress jobs that are no longer needed.  

## Send manual data egress request

To send a manual data egress request:

1. Create a JSON file.

  - For content structure, see the following [Example manual egress request](#example-manual-egress-request).

  **Note:** If you prefer, you can send the JSON request directly without saving the parameters to a file.

1. Update the parameters as needed. For descriptions of all available parameters, see [Parameters](#parameters).

1. Save the JSON file to any directory on the device where Edge Data Store is installed. For example, as `ManualEgress.json`.

1. Use any tool capable of making HTTP requests to send the contents of the JSON request to the following configuration endpoint using `POST`:

  `http://localhost:5590/api/v1/configuration/storage/manualegresses`

Example using cURL, which must be run from the directory where the JSON file is saved:

```bash
curl -d "@ManualEgress.json" -H "Content-Type: application/json" -X POST http://localhost:5590/api/v1/configuration/storage/manualegresses
```

## Parameters

The following table lists the parameters for manual egress.

| Parameter             | Required       | Type      | Description                                        |
|-----------------------|----------------|-----------|----------------------------------------------------|
| `Id`                  | Optional       | string    | Unique identifier of the request.                  |
| `EndpointId`          | Required       | string    | Unique identifier of the endpoint destination. <br>**Note:** The endpoint must be configured before sending manual egress requests.    |
| `Period`              | Optional       | string    | The frequency of time between each egress action after the initial egress. Must be a string in the format `d.hh:mm:ss.##`. See `ScheduledTime` for additional information. If the `Period` is not set, the default value is `01:00:00`, which is 1 hour. If the entire range of data specified by the `StartIndex` and `EndIndex` is in the past, the `Period` is not used. |
| `ScheduledTime`       | Optional       | string    | The date and time when the egress request will begin. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ` and Local: `yyyy-mm-ddThh:mm:ss`. Use the `ScheduledTime` parameter if you want data egress to begin at or after a specific time instead of beginning immediately. If you do not specify a `ScheduledTime`, EDS uses the time the request is received. <br>**Note:** Only one manual egress job runs at a time. |
| `StartIndex`          | Optional       | string    | Identifies the first data point to transfer. The Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `yyyy-mm-ddThh:mm:ss`, and Relative: `+d.hh:mm:ss.##` or `-d.hh:mm:ss.##`. <br>Relative time strings are calculated based on the `ScheduledTime`. If the `ScheduledTime` is not specified, the relative time string is calculated based on the time the egress job request is received. |
| `EndIndex`            | Optional       | string    | Identifies the last data point to transfer. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `yyyy-mm-ddThh:mm:ss`, and Relative: `+d.hh:mm:ss.##`. <br>Relative time strings are calculated based on the `StartIndex`. Relative time strings must be positive to ensure a range of data is selected for egress. |
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
    "EndIndex": "+ 04:00:00",
    "DataSelectors": [
        {
            "id": "PercentChangeFilter",
            "percentChange": 1
        }
    ]
}
```

## Example manual egress response 

The following is an example response for a manual egress request.

```JSON
{ 
    "id": "Egress1", 
    "endpointId": "AVEVA Data Hub_Location", 
    "period": "00:00:30", 
    "requestTimeUtc": "2022-08-10T13:45:58.607148Z", 
    "scheduledTime": "2022-08-10T21:20:00Z", 
    "dataSelectors": [ 
        { 
            "id": "PercentChangeFilter",
            "streamFilter": null, 
            "absoluteDeadband": null,
            "percentChange": 1, 
            "expirationPeriod": null
        } 
    ], 
    "startIndex": "2022-08-08T18:20:00Z", 
    "endIndex": "+ 04:00:00", 
    "startIndexDateTimeUtc": "2022-08-08T18:20:00Z", 
    "endIndexDateTimeUtc": "2022-08-10T22:20:00Z", 
    "checkpoint": null, 
    "progress": 0, 
    "status": "Active", 
    "errors": null 
}
```

### Response parameters

Response parameters include information that was sent in the manual egress request and additional information about how the request will be processed. The following table lists the response parameters for manual egress.

| Parameter               | Description                                        |
|-------------------------|----------------------------------------------------|
| `RequestTimeUtc`        | The date and time EDS received the egress request. |
| `StartIndexDateTimeUtc` | The date and time of the first data point to transfer in Coordinated Universal Time (UTC). If you specified a relative time, this is the calculated result. |
| `EndIndexDateTimeUtc`   | The date and time of the last data point to transfer Coordinated Universal Time (UTC). If you specified a relative time, this is the calculated result. |
| `Checkpoint`            | The latest timestamp that the egress has completed with the range between `StartIndex` and `EndIndex`.  |
| `Progress`              | Current percent complete of the egress job.   |
| `Status`                | Status of the egress job. Values are `Active`, `Canceled`, `Complete`, and `Failed`.            |
| `Errors`                | Errors encountered during egress.             |

## REST URLs

| Relative URL                                              | HTTP verb | Action                               |
|-----------------------------------------------------------|-----------|--------------------------------------|
| `api/v1/configuration/storage/manualegresses`             | POST      | Requests a manual egress job.        |
| `api/v1/configuration/storage/manualegresses`             | GET       | Returns the state of all manual egress jobs in the queue. |
| `api/v1/configuration/storage/manualegresses/<Id>`        | GET       | Returns the state of a specific egress job. |
| `api/v1/configuration/storage/manualegresses/<Id>/resume` | POST      | Resumes a canceled or failed egress job.  |
| `api/v1/configuration/storage/manualegresses/<Id>/cancel` | POST      | Cancels an egress job.                |
| `api/v1/configuration/storage/manualegresses/<Id>`        | DELETE    | Cancels all active history recovery operations and removes states |
| `api/v1/configuration/storage/manualegresses`             | DELETE    | Deletes the state of an individual history recovery

**Note:** Replace `<Id>` with the Id of the egress job for which you want to perform the action.
