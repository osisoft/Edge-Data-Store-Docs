---
uid: sdsReadingData
---

# Read data

The REST APIs provide programmatic access to read stream data from SDS. The results returned by the APIs are affected by types, stream views, filter expressions, and table format.

## Single stream reads

The following methods for reading a single value are available:

* [Get First Value](xref:sdsReadingDataApi#get-first-value) returns the first value in the stream.

* [Get Last Value](xref:sdsReadingDataApi#get-last-value) returns the last value in the stream.

* [Find Distinct Value](xref:sdsReadingDataApi#find-distinct-value) returns a value based on a starting index and search criteria.

In addition, the following methods support reading multiple values:

* [Get Values](xref:sdsReadingDataApi#get-values) retrieves a collection of stored values based on the request parameters.

* [Get Interpolated Values](xref:sdsReadingDataApi#get-interpolated-values) retrieves a collection of stored or calculated values based on the request parameters.

* [Get Summaries](xref:sdsReadingDataApi#get-summaries) retrieves a collection of evenly spaced summary intervals based on a count and specified start and end indexes.

* [Get Sampled Values](xref:sdsReadingDataApi#get-sampled-values) retrieves a collection of sampled data based on the request parameters.

All single stream reads are HTTP GET actions, because reading data involves getting events from streams. The base reading URI from a single stream is as follows:

```text
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data
```

**Parameters**  
`string namespaceId` 
The namespace; either default or diagnostics.

`string streamId` 
The stream identifier.

## Bulk reads

SDS supports reading from multiple streams in one request using the following method:

[Join Values](xref:sdsReadingDataApi#join-values) retrieves a collection of events across multiple streams and joins the results based on the request parameters.

Multi-stream reads can be either HTTP GET or HTTP POST actions. The base reading URI for reading from multiple streams is the following:

```text
  api/v1/Tenants/default/Namespaces/{namespaceId}/Bulk/Streams/Data
```

**Parameters**  
`string namespaceId` 
The namespace; either default or diagnostics.

## Indexes and reading data

Most read operations take at least one index as a parameter. Indexes may be specified as strings. For additional details about working with indexes, see [Indexes](xref:sdsIndexes).
