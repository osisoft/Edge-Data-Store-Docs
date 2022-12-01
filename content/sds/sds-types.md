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

SdsTypes define how events are associated and read within an SdsStream. When attempting to read non-existent indexes, indexes that fall between, before, or after existing indexes, the results are determined by the interpolation and extrapolation settings of the SdsType. For more information about interpolation and extrapolation, see [Read characteristics](xref:ReadCharacteristics).

## SdsType fields and properties

The following table shows the SdsType fields. Fields that are not included are reserved for internal SDS use.

| Property          | Type                   | Optionality | Searchable | Details |
|-------------------|------------------------|-------------|---------|---------|
| `ID`               | String                 | Required    | Yes | Identifier for referencing the type |
| `Name`              | String                 | Optional    | Yes | Friendly name |
| `Description`       | String                 | Optional    | Yes | Description text |
| `SdsTypeCode`       | SdsTypeCode            | Required    | No | Numeric code identifying the base SdsType |
| `InterpolationMode` | SdsInterpolationMode   | Optional    | No | Interpolation setting of the type. Default is Continuous. |
| `ExtrapolationMode` | SdsExtrapolationMode   | Optional    | No | Extrapolation setting of the type. Default is All. |
| `Properties`        | IList\<SdsTypeProperty\> | Required    | Yes, with limitations | List of `SdsTypeProperty` items. See SdsTypeProperty below.  |
For search limitations, see [Search in SDS](xref:sdsSearching).

## Rules for the type identifier (SdsType.ID)

The type identifier, `SdsType.ID`, has the following requirements:

- Is not case sensitive

- Can contain spaces

- Cannot contain forward slash ("/")

- Contains a maximum of 100 characters

Type management using the .NET SDS client libraries methods is performed through `ISdsMetadataService`. You can create `ISdsMetadataService` using one of the `SdsService.GetMetadataService()` factory methods. .NET client libraries provide `SdsTypeBuilder` to help build SdsTypes from .NET types.

## `SdsTypeProperty`

The `Properties` collection defines each field in an SdsType. Type properties will appear in every stream that is created from a given type.

The following table shows the required and optional `SdsTypeProperty` fields. Fields that are not included are reserved for internal SDS use.

|          Property         | Type                    | Optionality | Details |
|---------------------------|-------------------------|-------------|---------|
| `Id`                        | String                  | Required    | Identifier for referencing the type |
| `Name`                      | String                  | Optional    | Friendly name |
| `Description`               | String                  | Optional    | Description text |
| `SdsType`                   | SdsType                 | Required    | Field defining the property's Type |
| `IsKey`                     | Boolean                 | Required    | Identifies the property as the Key (Primary Index) |
| `Value`                     | Object                  | Optional    | Value of the property |
| `Order`                     | Int                     | Optional    | Order of comparison within a compound index |
| `InterpolationMode`         | SdsInterpolationMode    | Optional    | Interpolation setting of the property. Default is null. |
| `Uom`                       | String                  | Optional    | Unit of Measure of the property. For a list of units of measures that are supported for an SdsTypeProperty, see [Units of measure](xref:SupportedUOM). |

The `SdsTypeProperty` identifier has the same requirements as the `SdsType` identifier, which are:

- Is not case sensitive

- Can contain spaces

- Cannot contain forward slash ("/")

- Contains a maximum of 100 characters

### `IsKey`

`IsKey` is a Boolean value that identifies the SdsType Key. Each SdsType needs a Key to function as the primary index.

A key defined by more than one property is called a compound key. A compound key can be defined by a maximum of three properties. In a compound key, each property that is included in the key is specified as `IsKey`. The `Order` field then defines how the keys are combined in the compound key.

### `Value`

The `Value` field is used for properties that represent a value. For example, the named constant for an enum is a property with a value. When representing an enum in a SdsType, the SdsType properties collection defines the constant list for the enum. The SdsTypeProperty Identifier represents the name of the constant and the SdsTypeProperty value represents the value of the constant (see the enum State definitions below).

### `InterpolationMode`

`InterpolationMode` is assigned when the property of the event should be interpolated in a specific way that differs from the interpolation mode of the SdsType. `InterpolationMode` is only applied to a property that is not part of the index. If the `InterpolationMode` is not set, the property inherits the `InterpolationMode` of the SdsType.

An SdsType with the `InterpolationMode` set to `Discrete` cannot have a property with an `InterpolationMode`. For more information on interpolation of events, see [Interpolation](xref:ReadCharacteristics#interpolation).

### `UOM`

`Uom` is the unit of measure for the property. The `Uom` of a property may be specified by the name or the abbreviation. The names and abbreviations of Uoms are case sensitive.

The `InterpolationMode` and `Uom` of a property can be overridden on the stream. For more information, see [SdsStreamPropertyOverride in Streams](xref:sdsStreams#sdsstreampropertyoverride).

### Supported units of measure

For a list of units of measures that are supported for an SdsTypeProperty, see [Units of measure](xref:SupportedUOM).
