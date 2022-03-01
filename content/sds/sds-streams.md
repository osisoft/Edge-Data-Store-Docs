---
uid: sdsStreams
---

# Streams

SdsStreams are collections of sequentially occurring values indexed by a single property, typically time series data. You define SdsStreams to organize incoming data from another system into the OCS. To define an SdsStream, you must first define an SdsType, which defines the structure of the data you want to stream into a selected namespace.

SdsStreams are referenced by their identifier, which is the `Id` field. SdsStream identifiers must be unique within a namespace. An SdsStream must include a `TypeId` that references the identifier of an existing SdsType. When an SdsStream contains data, you must use a stream view to update the stream type.

The following table shows the SdsStream fields. Fields not listed are reserved for internal SDS use.

| Property          | Type                             | Optionality | Searchable | Details |
|-------------------|----------------------------------|-------------|------------|---------|
| `Id`                | String                           | Required    | Yes        | An identifier for referencing the stream. |
| `TypeId`            | String                           | Required    | Yes        | The SdsType identifier of the type to be used for this stream. |
| `Name`              | String                           | Optional    | Yes        | Friendly name. |
| `Description`       | String                           | Optional    | Yes        | Description text. |
| `Indexes`           | IList\<SdsStreamIndex\>          | Optional    | No         | Used to define secondary indexes for stream. |
| `InterpolationMode` | SdsInterpolationMode             | Optional    | No         | Interpolation setting of the stream. Default is null. |
| `ExtrapolationMode` | SdsExtrapolationMode             | Optional    | No         | Extrapolation setting of the stream. Default is null. |
| `PropertyOverrides` | IList\<SdsStreamPropertyOverride\> | Optional    | No   | Used to define unit of measure and interpolation mode overrides for a stream. |

## Rules for the stream identifier (SdsStream.Id)

The stream identifier, `SdsStream.Id`, has the following requirements:

- Is not case sensitive.

- Can contain spaces.

- Cannot contain forward slash ("/").

- Contains a maximum of 100 characters.

## Indexes

The key or primary index is defined at the SdsType. Secondary indexes are defined at the SdsStream. Secondary indexes are applied to a single property; there are no compound secondary indexes. Only SdsTypeCodes that can be ordered are supported for use in a secondary index.

For more information about indexes, see [Indexes](xref:sdsIndexes).

## Interpolation and extrapolation

The InterpolationMode, ExtrapolationMode, and [PropertyOverrides](#propertyoverrides) can be used to determine how a specific stream reads data. These read characteristics are inherited from the type if they are not defined at the stream level. For more information about type read characteristics and how these characteristics dictate how events are read, see [Types](xref:sdsTypes).

## PropertyOverrides

PropertyOverrides are used to override interpolation behavior and unit of measure for individual SdsType Properties for a specific SdsStream.

The `SdsStreamPropertyOverride` object has the following structure:

| Property          | Type                 | Optionality | Details |
|-------------------|----------------------|-------------|---------|
| `SdsTypePropertyId` | String               | Required    | SdsTypeProperty identifier. |
| `InterpolationMode` | SdsInterpolationMode | Optional    | Interpolation setting. Default is null. |
| `Uom`               | String               | Optional    | Unit of measure. |

The unit of measure can be overridden for any type property defined by the stream type, including primary keys and secondary indexes. For more information about type property units of measure, see [Types](xref:sdsTypes).

Read characteristics of the stream are determined by the type and the `PropertyOverrides` of the stream. The interpolation mode for non-index properties can be defined and overridden at the stream level. For more information about type read characteristics, see [Types](xref:sdsTypes).

If the SdsType `InterpolationMode` is `Discrete`, it cannot be overridden at any level. When `InterpolationMode` is set to `Discrete` and an event is not defined for that index, a null value is returned for the entire event.
