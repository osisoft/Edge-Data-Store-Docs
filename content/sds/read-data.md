---
uid: sdsReadingData
---

# Read data

The .NET and REST APIs provide programmatic access to read and write data. This section identifies and describes the APIs used to read [SdsStreams](xref:sdsStreams) data. Results are influenced by [SdsTypes](xref:sdsTypes), [SdsStreamViews](xref:sdsStreamViews), [filter expressions](xref:sdsFilterExpressions), and [table format](xref:sdsTableFormat).

If you are working in a .NET environment, convenient SDS Client Libraries are available. The `ISdsDataService` interface, which is accessed using the `SdsService.GetDataService()` helper, defines the functions that are available.

## Reading data from streams

While SDS is a robust data storage, it performs best if you follow certain guidelines:

- Maximum limit for events in read data calls

- Increase the Request-Timeout in the header

- Enable compression

- Use available read data APIs

### Maximum limit for events in read data calls

Read data API is limited to retrieve less than 250,000 events per request. An error message is returned when the maximum limit is reached. This maximum limit applies to [List Values](xref:sdsStreamsAPI#list-streams), [List Summaries](xref:sdsStreamsAPI#list-summaries), [List Sampled Values](xref:sdsStreamsAPI#list-sampled-values).

```text
400 bad request error
{ 
               "Error": "The request is not valid.", 
               "Reason": "Exceeded the maximum return count of 250000 events." 
               "Resolution": "Reduce query size and resubmit the request." 
} 
```

### Increase the Request-Timeout in the header

Increase the Request-Timeout in the header to 5 minutes for large range calls that are requesting 250,000 events in a read call. The gateway will send `408 - Operation timed out error` if the request needs more than 30 seconds.

The range of values that are held in memory can be large and be anywhere between 1 GB and 2 GB, so the system needs enough time to read and return the data.

If multiple calls return `408 - Operation timed out error` even after increasing the timeout limit to 5 minutes, do one of the following:

- Reduce the range in the request calls of this type

- Retry with an exponential back-off policy

### Compression

Include ``Accept-Encoding: gzip, deflate`` in the HTTP header. This enables compression. For more information, see [Compression](xref:sdsCompression#supported-compression-schemes).

### Use available read data APIs

Depending on the scenario, there are different read data APIs available. They return an overview of the values instead of reading all values at once. These APIs provide a good high-level view of the values without displaying them all at the same time:

- [List Values](xref:sdsReadingDataApi#list-values) with filters

- [Get Summaries](xref:sdsReadingDataApi#get-summaries)

- [Get Sampled Values](xref:sdsReadingDataApi#get-sampled-values)

## Single stream reads

The following methods for reading a single value are available:

- [Get First Value](xref:sdsReadingDataApi#get-first-value) returns the first value in the stream.

- [Get Last Value](xref:sdsReadingDataApi#get-last-value) returns the last value in the stream.

- [Find Distinct Value](xref:sdsReadingDataApi#find-distinct-value) returns a value based on a starting index and search criteria.

In addition, the following methods support reading multiple values:

- [List Values](xref:sdsReadingDataApi#list-values) retrieves a collection of stored values based on the request parameters.

- [List Interpolated Values](xref:sdsReadingDataApi#list-interpolated-values) retrieves a collection of stored or calculated values based on the request parameters.

- [Get Summaries](xref:sdsReadingDataApi#get-summaries) retrieves a collection of evenly spaced summary intervals based on a count and specified start and end indexes.

- [Get Sampled Values](xref:sdsReadingDataApi#get-sampled-values) retrieves a collection of sampled data based on the request parameters.

## Bulk reads

SDS supports reading from multiple streams in one request. The following method for reading data from multiple streams is available:

- [Join Values](xref:sdsReadingDataApi#join-values) retrieves a collection of events across multiple streams and joins the results based on the request parameters.

## SdsBoundaryType

The `SdsBoundaryType` enum defines how data on the boundary of queries is handled: around the start index for range value queries,  and around the start and end index for window values. The following are valid values for `SdsBoundaryType`:

| Boundary | Enumeration value | Operation |
| -------  | ----------------- | --------- |
| `Exact`    | 0                 | Results include the event at the specified index boundary if a stored event exists at that index. |
| `Inside`   | 1                 | Results include only events within the index boundaries |
| `Outside`  | 2                 | Results include up to one event that falls immediately outside of the specified index boundary. |
| `ExactOrCalculated` | 3        | Results include the event at the specified index boundary. If no stored event exists at that index, one is calculated based on the index type and interpolation and extrapolation settings. |

## SdsSearchMode

The `SdsSearchMode` enum defines search behavior when seeking a stored event near a specified index. The following table shows valid values for `SdsSearchMode`.

| Mode  | Enumeration value | Operation |
| ----- | ----------------- | --------- |
| `Exact` | 0                 | If a stored event exists at the specified index, that event is returned. Otherwise, no event is returned. |
| `ExactOrNext` | 1           | If a stored event exists at the specified index, that event is returned. Otherwise, the next event in the stream is returned. |
| `Next` | 2                  | Returns the stored event after the specified index. |
| `ExactOrPrevious` | 3       | If a stored event exists at the specified index, that event is returned. Otherwise, the previous event in the stream is returned. |
| `Previous` | 4              | Returns the stored event before the specified index. |
