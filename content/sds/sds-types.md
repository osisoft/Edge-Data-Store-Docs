---
uid: sdsTypes
---

# Types

An SdsType, also called a type, defines the shape of a single measured event or object. A type gives structure to the data. For example, if a device measures three things, such as longitude, latitude, and speed, at the same time, then the SdsType should include those three properties. 

An SdsType defines the structure of an event stored in an SdsStream and how to associate events within the SdsStream. An event is a single unit whose properties have values that relate to the index; that is, each property of an SdsType event is related to the event’s index. Each event is a single unit.

SdsTypes can define simple atomic types, such as integers, floats, strings, arrays, and dictionaries, or complex types with nested SdsTypes using the Properties collection of an SdsType.

An SdsType used to define an SdsStream must have a key, which is a property, or a combination of properties that constitute an ordered, unique identity. Because the key is ordered, it functions as an index. It is known as the primary index. While a timestamp (DateTime) is a very common key, any ordered data can be used. Other indexes (secondary indexes), are defined in the SdsStream. For more details on indexes, see [Indexes](xref:sdsIndexes).

An SdsType is referenced by its identifier or `Id` field. SdsType identifiers must be unique within a Namespace. An SdsType can also refer other SdsTypes by using their identifiers. This enables type reusability. Nested types and base types are automatically created as separate types. For further information, see [SdsType reusability](xref:sdsTypeReusability).

Once an SdsType is created, it is immutable and its definition cannot be changed. If the SdsType definition is incorrect, you must delete and recreate it, and it can only be deleted if no streams, stream views, or other types reference it.

Only the SdsTypes used to define SdsStreams or SdsStreamViews are required to be added to the Sequential Data Store. SdsTypes that define properties or base types are contained within the parent SdsType do not need to be added to the Data Store separately.

SdsTypes define how events are associated and read within an SdsStream. When attempting to read non-existent indexes, indexes that fall between, before or after existing indexes, the results are determined by the interpolation and extrapolation settings of the SdsType. For more information about interpolation and extrapolation, see [Read characteristics](xref:ReadCharacteristics).

## SdsType fields and properties

The following table shows the SdsType fields. Fields that are not included are reserved for internal SDS use.

| Property          | Type                   | Optionality | Searchable | Details |
|-------------------|------------------------|-------------|---------|---------|
| ID               | String                 | Required    | Yes | Identifier for referencing the type. |
| Name              | String                 | Optional    | Yes | Friendly name. |
| Descriptio`       | String                 | Optional    | Yes | Description text. |
| SdsTypeCode       | SdsTypeCode            | Required    | No | Numeric code identifying the base SdsType. |
| InterpolationMode | SdsInterpolationMode   | Optional    | No | Interpolation setting of the type. Default is Continuous. |
| ExtrapolationMode | SdsExtrapolationMode   | Optional    | No | Extrapolation setting of the type. Default is All. |
| Properties        | IList\<SdsTypeProperty\> | Required    | Yes, with limitations | List of SdsTypeProperty items. See [SdsTypeProperty](xref:sdsTypeProperty). |

For search limitations, see [Search in SDS](xref:sdsSearching).

## Rules for the type identifier (SdsType.ID)

The type identifier, `SdsType.ID`, has the following requirements:

- Is not case sensitive.

- Can contain spaces.

- Cannot contain forward slash ("/").

- Contains a maximum of 100 characters. 

Type management using the .NET SDS client libraries methods is performed through `ISdsMetadataService`. You can create `ISdsMetadataService` using one of the `SdsService.GetMetadataService()` factory methods. .NET client libraries provide `SdsTypeBuilder` to help build SdsTypes from .NET types. 
