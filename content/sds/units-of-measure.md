---
uid: unitsOfMeasure
---

# Units of measure

SDS provides a collection of built-in units of measure (Uom). These units of measure can be associated with SdsStreams and SdsTypes to provide unit information for stream data that model measurable quantities. If data has unit information associated with it, SDS supports unit conversions when retrieving data. For more information, see [Read data](xref:sdsReadingData).

Since a unit of measurement (such as meter) defines the magnitude of a quantity (such as Length), SDS represents this through two objects: `SdsUom` and `SdsUomQuantity`.

## SdsUom

An SdsUom represents a single unit of measure, such as 'meter'. The following table shows the required and optional SdsUom fields.

| Property         | Type   | Optionality | Description | Example  |
| ---------------- | ------ | ----------- | ------- | -------- |
| `Id`               | String | Required    | Unique identifier for the unit of measure. | meters per second |
| `Abbreviation`     | String | Optional    | Abbreviation for the unit of measure.  | m/s |
| `Name`             | String | Optional    | Full name for the unit of measure. | Meters per second |
| `DisplayName`      | String | Optional    | Friendly display name for the unit of measure. | meters per second |
| `QuantityId`       | String | Required    | The identifier for the quantity that this unit of measure quantifies.| Velocity|
| `ConversionFactor` | Double | Required    | Used for unit conversions. When a value of this unit is multiplied by the `ConversionFactor` and then incremented by the `ConversionOffset`, the value in terms of the base unit of the corresponding quantity is returned. | 1.0 |
| `ConversionOffset` | Double | Required    | Used for unit conversions. See details for `ConversionFactor`. | 0.0  |

## SdsUomQuantity

An SdsUomQuantity represents a single measurable quantity, such as length. The following table shows the required and optional SdsUomQuantity fields.

| Property   | Type    | Optionality | Description| Example  |
| ---------- | ------- | ----------- | ------- | ---------|
| `Id`         | String  | Required    | Unique identifier for the quantity. | Velocity |
| `Name`       | String  | Optional    | Full name for the quantity. | Velocity |
| `BaseUom`    | SdsUom  | Required    | The base unit of measure for this quantity. All other Uoms measuring this quantity will have `ConversionFactors` and `ConversionOffsets` relative to the `BaseUom`.  | SdsUom representing "meters per second" |
| `Dimensions` | short[] | Optional    | Reserved for internal use. Represents the seven base SI dimensions: Length, Mass, Time, Electric Current, Thermodynamic Temperature, Amount of Substance, and Luminous Density. | [1,0,-1,0,0,0,0] |

## Associating a unit of measure with a type

At [type](xref:sdsTypes) creation, SdsUom can be associated with an [SdsTypeProperty](xref:sdsTypes#sdstypeproperty). For types API, see [Types](xref:sdsTypeAPI).

## Associating a unit of measure with a stream

At [stream](xref:sdsStreams) creation, you can override any unit of measure associated with an SdsTypeProperty belonging to the type of the stream. This enables the reuse of a type that may have default unit information associated with it already. For streams API, see [Streams](xref:sdsStreamsAPI).
