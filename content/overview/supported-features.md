---
uid: PIAdapterForModbusTCPSupportedFeatures
---

# Supported features

For certain data types, the adapter supports applying bitmaps and applying data conversion.

## Bitmap application

The adapter supports applying bitmaps to the value converted from reading the Modbus TCP devices. A bitmap is a series of numbers used to extract and reorder bits from a word register. The format of the bitmap is `uuvvwwxxyyzz`, where `uu`, `vv`, `ww`, `xx`, `yy`, and `zz` each refer to a single bit. Bitmaps require a leading zero if the referenced bit is less than 10. The low-order bit is 01 and high-order bit is either 16 or 32. Bitmaps can reference up to 16 bits for a 16-bit word (data types 10 and 20) and up to 32 bits for a 32-bit word (data types 30 and 31).

For example, the bitmap `0307120802` maps the second bit of the original word to the first bit of the new word, the eighth bit to the second bit, the twelfth bit to the third bit, the seventh bit to the fourth bit, and the third bit to the fifth bit. The high-order bits of the new word are padded with zeros if they are not specified.

Not all data types support bitmapping. The data types that support bitmaps include:

- `Int16` (Data type code `10`)
- `UInt16` (Data type code `20`)
- `Int32` (Data type code `30` and `31`)

## Data conversion application

The adapter supports applying data conversion to the value converted from reading Modbus TCP devices. You can specify a conversion factor and conversion offset. The conversion factor is used for scaling the value up or down and the conversion offset is used for shifting the value. The mathematical equation for conversion is represented below:

 ```code
 <After Conversion> = <Before Conversion> / Factor - Offset
 ```

 Not all data types support applying data conversion. The following data types support conversion:

- `Int16` (Data type code `10`)
- `UInt16` (Data type code `20`)
- `Int32` (Data type code `30` and `31`)
- `Float32` (Data type code `100` and `101`)

The value with data conversion applied is always converted to the 32-bit float type to maintain the precision of the conversion factor and conversion offset.
