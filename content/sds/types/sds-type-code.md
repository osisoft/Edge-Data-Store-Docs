---
uid: sdsTypeCode
---

# SdsTypeCode

The SdsTypeCode is a numeric identifier used by SDS to identify SdsTypes. An SdsTypeCode exists for every supported type.

Atomic types, such as strings, floats, and arrays, are defined entirely by the SdsTypeCode. Atomic types do not need fields to define the type.

Types requiring additional definition, such as enums and objects, are identified using a generic SdsTypeCode, such as ByteEnum, Int32Enum, NullableInt32Enum, or Object, plus additional SdsProperty fields.

**Supported Types**  
The following tables lists types that are supported and defined by the SdsTypeCode.

Type                    | SdsTypeCode
----------------------- | -----
Array                   | 400
Boolean                 | 3
BooleanArray            | 203
Byte                    | 6
ByteArray               | 206
ByteEnum                | 606
Char                    | 4
CharArray               | 204
DateTime                | 16
DateTimeArray           | 216
DateTimeOffset          | 20
DateTimeOffsetArray     | 220
DBNull                  | 2
Decimal                 | 15
DecimalArray            | 215
Double                  | 14
DoubleArray             | 214
Empty                   | 0
Guid                    | 19
GuidArray               | 219
IDictionary             | 402
IEnumerable             | 403
IList                   | 401
Int16                   | 7
Int16Array              | 207
Int16Enum               | 607
Int32                   | 9
Int32Array              | 209
Int32Enum               | 609
Int64                   | 11
Int64Array              | 211
Int64Enum               | 611
NullableBoolean         | 103
NullableByte            | 106
NullableByteEnum        | 706
NullableChar            | 104
NullableDateTime        | 116
NullableDateTimeOffset  | 120
NullableDecimal         | 115
NullableDouble          | 114
NullableGuid            | 119
NullableInt16           | 107
NullableInt16Enum       | 707
NullableInt32           | 109
NullableInt32Enum       | 709
NullableInt64           | 111
NullableInt64Enum       | 711
NullableSByte           | 105
NullableSByteEnum       | 705
NullableSingle          | 113
NullableTimeSpan        | 121
NullableUInt16          | 108
NullableUInt16Enum      | 708
NullableUInt32          | 110
NullableUInt32Enum      | 710
NullableUInt64          | 112
NullableUInt64Enum      | 712
Object                  | 1
SByte                   | 5
SByteArray              | 205
SByteEnum               | 605
Single                  | 13
SingleArray             | 213
String                  | 18
StringArray             | 218
TimeSpan                | 21
TimeSpanArray           | 221
UInt16                  | 8
UInt16Array             | 208
UInt16Enum              | 608
UInt32                  | 10
UInt32Array             | 210
UInt32Enum              | 610
UInt64                  | 12
UInt64Array             | 212
UInt64Enum              | 612
Version                 | 22
VersionArray            | 222
