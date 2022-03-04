---
uid: sdsTypeProperty
---

# SdsTypeProperty

The `Properties` collection defines each field in an SdsType. Type properties will appear in every stream that is created from a given type.

The following table shows the required and optional SdsTypeProperty fields. Fields that are not included are reserved for internal SDS use.

|          Property         | Type                    | Optionality | Details |
|---------------------------|-------------------------|-------------|---------|
| Id                        | String                  | Required    | Identifier for referencing the type. |
| Name                      | String                  | Optional    | Friendly name. |
| Description               | String                  | Optional    | Description text. |
| SdsType                   | SdsType                 | Required    | Field defining the property's Type. |
| IsKey                     | Boolean                 | Required    | Identifies the property as the Key (Primary Index). |
| Value                     | Object                  | Optional    | Value of the property. |
| Order                     | Int                     | Optional    | Order of comparison within a compound index. |
| InterpolationMode         | SdsInterpolationMode    | Optional    | Interpolation setting of the property. Default is null. |
| Uom                       | String                  | Optional    | Unit of Measure of the property. For a list of units of measures that are supported for an SdsTypeProperty, see [Units of measure](xref:SupportedUOM). |

The SdsTypeProperty identifier has the same requirements as the SdsType identifier, which are:

- Is not case sensitive.

- Can contain spaces.

- Cannot contain forward slash ("/").

- Contains a maximum of 100 characters. 

## `IsKey`

`IsKey` is a Boolean value that identifies the SdsType Key. Each SdsType needs a Key to function as the primary index. 

A key defined by more than one property is called a compound key. A compound key can be defined by a maximum of three properties. In a compound key, each property that is included in the key is specified as `IsKey`. The `Order` field then defines how the keys are combined in the compound key.

## `Value`

The `Value` field is used for properties that represent a value. For example, the named constant for an enum is a property with a value. When representing an enum in a SdsType, the SdsType properties collection defines the constant list for the enum. The SdsTypeProperty Identifier represents the name of the constant and the SdsTypeProperty value represents the value of the constant (see the enum State definitions below).

## `InterpolationMode`

`InterpolationMode` is assigned when the property of the event should be interpolated in a specific way that differs from the interpolation mode of the SdsType. `InterpolationMode` is only applied to a property that is not part of the index. If the `InterpolationMode` is not set, the property inherits the `IntepolationMode` of the SdsType.

An SdsType with the `InterpolationMode` set to `Discrete` cannot have a property with an `InteroplationMode`. For more information on interpolation of events, see [Interpolation](xref:ReadCharacteristics#interpolation).

## `UOM`

`Uom` is the unit of measure for the property. The `Uom` of a property may be specified by the name or the abbreviation. The names and abbreviations of Uoms are case sensitive.

The `InterpolationMode` and `Uom` of a property can be overridden on the stream. For more information, see [PropertyOverrides in Streams](xref:sdsStreams#propertyoverrides).

## Supported units of measure

For a list of units of measures that are supported for an SdsTypeProperty, see [Units of measure](xref:SupportedUOM).
