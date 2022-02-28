---
uid: DataTransformations
---

# Data transformations

SDS supports the following data transformations on read requests:

* Reading with SdsStreamViews: Changing the shape of the returned data

* Unit of Measure Conversions: Converting the unit of measure of the data  

Data transformations are supported for all single stream reads, but transformations have specific endpoints. The following are the base URIs for the transformation endpoints:

```text
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/First
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Last
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Interpolated
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Summaries
  api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/Sampled
```

## Reading with SdsStreamViews

When you transform data with an SdsStreamView, the data read is converted to the `target type` specified in the SdsStreamView. For details on working with stream views, see [Stream Views](xref:sdsStreamViews).

All stream view transformations are GET HTTP requests. Specify the stream view by appending the stream view identifier to requests to the transformation endpoint. For example, the following request would return the first event in the stream as the target type in the stream view specified by the `streamViewId`:

```text
  GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Data/Transform/First?streamViewId={streamViewId}
```

All single stream data reads support stream view transformations.

When you request data with an SdsStreamView, the read characteristics defined by the `target type` of the SdsStreamView determine what is returned. The read characteristics are discussed in the code samples.

## Unit of measure conversions

SDS supports assigning units of measure (UOM) to stream data. For more information, see [Units of measure](xref:unitsOfMeasure). If stream data has UOM information associated, SDS supports reading data with unit conversions applied. On each read data request, unit conversions are specified by a user defined collection of `SdsStreamPropertyOverride` objects in read requests. 

The properties of the `SdsStreamPropertyOverride` object are descriped in the following table.

| Property          | Type                 | Optionality | Description                                            |
| ----------------- | -------------------- | ----------- | -----------------------------------------------------  |
| SdsTypePropertyId | String               | Required    | Identifier for an SdsTypeProperty with a UOM assigned. |
| Uom               | String               | Required    | Target unit of measure.                                |
| InterpolationMode | SdsInterpolationMode | N/A         | Currently not supported in context of data reads.      |

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
