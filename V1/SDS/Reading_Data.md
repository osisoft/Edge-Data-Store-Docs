---
uid: sdsReadingData
---

# Reading data

The REST APIs provide programmatic access to read and write data. This section identifies and describes the APIs used to read [Streams](xref:sdsStreams) data. Results are influenced by [Types](xref:sdsTypes), [Stream Views](xref:sdsStreamViews), [Filter expressions](xref:sdsFilterExpressions), and [Table format](xref:sdsTableFormat).

### Single stream reads

The following methods for reading a single value are available:

* [Get First Value](xref:sdsReadingDataApi#get-first-value) returns the first value in the stream.
* [Get Last Value](xref:sdsReadingDataApi#get-last-value) returns the last value in the stream.
* [Find Distinct Value](xref:sdsReadingDataApi#find-distinct-value) returns a value based on a starting index and search criteria.

In addition, the following methods support reading multiple values:

* [Get Values](xref:sdsReadingDataApi#get-values) retrieves a collection of stored values based on the request parameters.
* [Get Interpolated Values](xref:sdsReadingDataApi#get-interpolated-values) retrieves a collection of stored or calculated values based on the request parameters.
* [Get Summaries](xref:sdsReadingDataApi#get-summaries) retrieves a collection of evenly spaced summary intervals based on a count 
  and specified start and end indexes.
* [Get Sampled Values](xref:sdsReadingDataApi#get-sampled-values) retrieves a collection of sampled data based on the request parameters.

All single stream reads are HTTP GET actions. Reading data involves getting events from streams. The base reading URI from a single stream is as follows:

```text
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data
```

**Parameters**  
**string namespaceId**  
default or diagnostics

**string streamId**  
The stream identifier

### Bulk reads

SDS supports reading from multiple streams in one request. The following method for reading data from multiple streams is available:

[Join Values](xref:sdsReadingDataApi#join-values) retrieves a collection of events across multiple streams and joins the results based on the request parameters.

Multi-stream reads can be HTTP GET or POST actions. The base reading URI for reading from multiple streams is the following:

```text
  api/v1/Tenants/default/Namespaces/{namespaceId}/Bulk/Streams/Data
```

**Parameters**  
**string namespaceId**  
default or diagnostics

### Response format

Supported response formats include JSON, verbose JSON, and SDS.

- JSON is the default response format for SDS, which is used in all examples in this documentation. Default JSON responses do not include any values that are equal to the default value for their type.
- Verbose JSON responses include all values, including defaults, in the returned JSON payload. To specify verbose JSON return, add the header ``Accept-Verbosity`` with a value of ``verbose`` to the request.  
- SDS format is specified by setting the ``Accept`` header in the request to ``application/sds``.

### Indexes and reading data

Most read operations take at least one index as a parameter. Indexes may be specified as strings. You can find additional details about working with indexes on the [Indexes](xref:sdsIndexes) page.

### Read characteristics

When you request data at an index for which no stored event exists, the read characterisitics determine whether the result is an error, no event, interpolated event, or extrapolated event. The combination of the type of the index and the interpolation and extrapolation modes of the SdsType and the SdsStream determine the read characteristics. For more information on read characteristics, see [Types](xref:sdsTypes) and [Streams](xref:sdsStreams).

### Filter expressions

You can apply filter expressions to any read that returns multiple values, including Get Values, Get Range Values, Get Window Values, and Get Intervals. The filter expression is applied to the collection events conditionally filtering events that do not meet the filter conditions.

For details on filter expressions, see the [Filter expressions](xref:sdsFilterExpressions) section.

### Table format

You can organize results of a query into tables by directing the form parameter to return a table. Two forms of table are available: table and header table.

When you specify the form parameter as table, ``?form=table``, events are returned in row column form. Results include a collection named ``Columns`` that lists column name and type and a collection named ``Rows`` containing a collection of rows matching the order of the columns.

When you specify a form of type ``table-headers``, ``?form=tableh``, it results in a collection where the Rows collection contains a column header list.

For details on table formats, see the [Table format](xref:sdsTableFormat) section.

### SdsBoundaryType

The `SdsBoundaryType` enum defines how data on the boundary of queries is handled: around the start index for range value queries, and around the start and end index for window values. The following are valid `SdsBoundaryType` values:

| Boundary | Enumeration value | Operation |
| -------  | ----------------- | --------- |
| Exact    | 0                 | Results include the event at the specified index boundary if a stored event exists at that index. |
| Inside   | 1                 | Results include only events within the index boundaries |
| Outside  | 2                 | Results include up to one event that falls immediately outside of the specified index boundary. |
| ExactOrCalculated | 3        | Results include the event at the specified index boundary. If no stored event exists at that index, one is calculated based on the index type and interpolation and extrapolation settings. |

### SdsSearchMode

The `SdsSearchMode` enum defines search behavior when seeking a stored event near a specified index. The following are valid values for `SdsSearchMode`:

| Mode  | Enumeration value | Operation |
| ----- | ----------------- | --------- |
| Exact | 0                 | If a stored event exists at the specified index, that event is returned. Otherwise, no event is returned. |
| ExactOrNext | 1           | If a stored event exists at the specified index, that event is returned. Otherwise, the next event in the stream is returned. |
| Next | 2                  | Returns the stored event after the specified index. |
| ExactOrPrevious | 3       | If a stored event exists at the specified index, that event is returned. Otherwise, the previous event in the stream is returned. |
| Previous | 4              | Returns the stored event before the specified index. |
*****

## Transforming data

SDS provides the ability to transform data upon reads. The supported data transformations are:

* [Reading with SdsStreamViews](#reading-with-sdsstreamviews): Changing the shape of the returned data
* [Unit of Measure Conversions](#unit-conversion-of-data): Converting the unit of measure of the data  

Data transformations are supported for all single stream reads, but transformations have specific endpoints. The following are the base URIs for the tranformation endpoints:

```text
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/First
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Last
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Interpolated
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Summaries
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Sampled
```

### Reading with SdsStreamViews

When you transform data with an SdsStreamView, the data read is converted to the *target type* specified in the SdsStreamView. For details on working with stream views, see the [Stream Views](xref:sdsStreamViews) section.

All stream view transformations are GET HTTP requests. You specify the stream view by appending the stream view identifier to requests to the transformation endpoint. For example, the following request would return the first event in the stream as the target type in the stream view specified by the `streamViewId`:

```text
  GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/First?streamViewId={streamViewId}
```

All single stream data reads support stream view transformations.

When you request data with an SdsStreamView, the read characteristics defined by the *target type* of the SdsStreamView determine what is returned. The read characteristics are discussed in the code samples.

### Unit conversion of data

SDS supports assigning [Units of Measure](xref:unitsOfMeasure) (UOM) to stream data. If stream data has UOM information associated, SDS supports reading data with unit conversions applied. On each read data request, unit conversions are specified by a user defined collection of `SdsStreamPropertyOverride` objects in read requests. The `SdsStreamPropertyOverride` object has the following structure:

| Property          | Type                 | Optionality | Description                                           |
| ----------------- | -------------------- | ----------- | ----------------------------------------------------  |
| SdsTypePropertyId | String               | Required    | Identifier for an SdsTypeProperty with a UOM assigned |
| Uom               | String               | Required    | Target unit of measure                                |
| InterpolationMode | SdsInterpolationMode | N/A         | Currently not supported in context of data reads      |

This is supported in the REST API through HTTP POST calls with a request body containing a collection of `SdsStreamPropertyOverride` objects.  

All unit conversions are POST HTTP requests. The unit conversion transformation URI is as follows:

```text
  POST api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform
```

**Request body**  
The Request Body contains a collection of `SdsStreamPropertyOverride` objects.

The example request body below requests SDS to convert the `Measurement` property of the returned data from meter to centimeter.

```json
[
  {
    "SdsTypePropertyId" : "Measurement",
    "Uom" : "centimeter"
  }
]
```

All single stream data reads with streams that have specified UOMs support UOM conversions.
*****
  
