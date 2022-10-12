---
uid: ReadCharacteristics
---

# Read characteristics

When data is requested at an index for which no stored event exists, the read characteristics determine whether the result is an error, no event, interpolated event, or extrapolated event. The combination of the type of the index and the interpolation and extrapolation modes of the SdsType and the SdsStream determine the read characteristics.

## Interpolation

Interpolation determines how a stream behaves when asked to return an event at an index between two existing events. `InterpolationMode` determines how the returned event is constructed. The following table lists interpolation modes.

|Interpolation Mode                       |Enumeration value |Operation |
|---------------------------|------------------|----------|
|Default                    |0                 |The default InterpolationMode is Continuous. |
|Continuous                 |0                 |Interpolates the data using previous and next index values. |
|StepwiseContinuousLeading  |1                 |Returns the data from the previous index.  |
|StepwiseContinuousTrailing |2                 |Returns the data from the next index. |
|Discrete                   |3                 |Returns `null`. |
|ContinuousNullableLeading  |4                 |Returns interpolated data or data from the previous index if either of the surrounding indexes has a null value|
|ContinuousNullableTrailing |5                 |Returns interpolated data or data from the trailing index if either of the surrounding indexes has a null value|

**Note:** `Continuous` mode cannot return events for values that cannot be interpolated, such as when the type is not numeric.

The following table describes how the `Continuous` interpolation mode affects indexes that occur between data in a stream.

### InterpolationMode = Continuous or Default

| Type                      | Result for an index between data in a stream  | Comment |
|---------------------------|-----------------------------------------------|---------|
|Numeric Types              |Interpolated<sup>1</sup>                   |Rounding is done as needed for integer types. |
|Time related Types         |Interpolated                    |DateTime, DateTimeOffset, TimeSpan |
|Nullable Types             |Interpolated<sup>2</sup>                   |Limited support for nullable numeric types. |
|Array and List Types       |No event is returned            |         |
|String Type                |No event is returned            |         |
|Boolean Type               |Returns value of nearest index  |         |
|Enumeration Types          |Returns Enum value at 0         |This may have a value for the enumeration. |
|GUID                       |No event is returned            |         |
|Version                    |No event is returned            |         |
|IDictionary or IEnumerable |No event is returned            |Dictionary, Array, List, and so on. |
|Empty Type		|Not supported                  	 | |
|Object Type 		|Not supported                   	| |

<sup>1</sup> When extreme values are involved in an interpolation (for example, `Decimal.MaxValue`) the call might result in a `BadRequest` exception.

<sup>2</sup> For the Continuous interpolation mode, nullable types are interpolated in the same manner as their non-nullable equivalents as long as the values surrounding the requested interpolation index are non-null. If either of the values are null, the interpolated value will be null.

If the `InterpolationMode` is not assigned, the events are interpolated in the default manner, unless the interpolation mode is overridden in the `SdsTypeProperty` or the `SdsStream`. For more information on overriding the interpolation mode on a specific type property, see [SdsTypeProperty](xref:sdsTypeProperty). For more information on overriding the interpolation mode for a specific stream, see [Streams](xref:sdsStreams).

## Extrapolation

Extrapolation defines how a stream responds to requests with indexes that precede or follow all data in the steam. `ExtrapolationMode` acts as a master switch to determine whether extrapolation occurs and at which end of the data.

`ExtrapolationMode` works with the `InterpolationMode` to determine how a stream responds. The following tables show how `ExtrapolationMode` affects returned values for each `InterpolationMode` value.

If the `ExtrapolationMode` is not assigned, the events are extrapolated in the default manner, unless the extrapolation mode is overridden on the `SdsStream`. For more information on overriding the extrapolation mode on a specific stream, see [Streams](xref:sdsStreams).

### ExtrapolationMode with InterpolationMode = Default (or Continuous), StepwiseContinuousLeading and StepwiseContinuousTrailing

| ExtrapolationMode   | Enumeration value   | Index before data          | Index after data          |
|---------------------|---------------------|----------------------------|---------------------------|
| All                 | 0                   | Returns first data value   | Returns last data value.  |
| None                | 1                   | No event is returned       | No event is returned.     |
| Forward             | 2                   | No event is returned       | Returns last data value.  |
| Backward            | 3                   | Returns first data value   | No event is returned.     |

### ExtrapolationMode with InterpolationMode = Discrete  

| ExtrapolationMode   | Enumeration value   | Index before data    | Index after data     |
|---------------------|---------------------|----------------------|----------------------|
| All                 | 0                   | No event is returned.| No event is returned.|
| None                | 1                   | No event is returned.| No event is returned.|
| Forward             | 2                   | No event is returned.| No event is returned.|
| Backward            | 3                   | No event is returned.| No event is returned.|

For additional information about the effect of read characteristics for the available read methods, see [Read data API](xref:sdsReadingDataApi).
