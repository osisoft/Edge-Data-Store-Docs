---
uid: SupportedFeaturesModbus
---

# Supported features
The Modbus TCP EDS adapter collects data using register types and then converts the registers into data types. It can apply bitmaps and data conversion to values converted from reading the Modbus TCP devices.

## Register types
The Modbus TCP EDS adapter supports 6 register types, corresponding to 4 function codes (1-4). Since one function code can return two types of registers, either 16-bit or 32-bit depending on the device, either the register type or the register type code is required when configuring the data selection for the adapter. The following table lists all the register types supported in the Modbus TCP EDS adapter.

| Register Type | Register Type Code | Description | Function Code |
|---------------|-------------------|-------------|---------------|
| Coil          | 1                 |Read Coil Status| 1|
| Discrete          | 2                 |Read Discrete Input Status | 2|
| Holding16          | 3                 |Read 16-bit Holding Registers | 3|
| Holding32          | 4                 |Read 32-bit Holding Registers | 3|
| Input16          | 6                 |Read 16-bit Input Registers |4|
| Input32          | 7                 |Read 32-bit Input Registers |4|

When reading from function codes **1** and **2**, the adapter expects these to be returned as single bits. For function codes **3** and **4**, the adapter expects 16 bits to be returned from devices that contain 16-bit registers and 32 bits to be returned from devices that contain 32-bit registers.

## Data types
The Modbus TCP EDS adapter converts readings from single or multiple registers into the data types specified by the data type code and populates the value into streams created in the Edge Data Store.

The following table lists all data types with their corresponding type codes supported by the Modbus TCP EDS adapter.

| Data type code | Data type name | Value type | Register type | Description |
|----------------|----------------|------------|---------------|-------------|
| 1              | Boolean        | Boolean       | Bool          | 0 = false <br> 1 = true
| 10             | Int16          | Int16      | Bool/16-bit   | Read 1 Modbus TCP register and interpret as a 16-bit integer. Bytes [BA] read from the device are stored as [AB]. |
| 20             | UInt16         | UInt16     | Bool/16-bit   | Read 1 Modbus TCP register and interpret as an unsigned 16-bit integer. Bytes [BA] read from the device are stored as [AB]. |
| 30             | Int32          | Int32      | 16-bit/32-bit | Read 32 bits from the Modbus TCP device and interpret as a 32-bit integer. Bytes [DCBA] read from the device are stored as [ABCD]. |
| 31             | Int32ByteSwap  | Int32      | 16-bit/32-bit | Read 32 bits from the Modbus TCP device and interpret as a 32-bit integer. Bytes [BADC] read from the device are stored as [ABCD]. |
| 100            | Float32        | Float32    | 16-bit/32-bit | Read 32 bits from the Modbus TCP device and interpret as a 32-bit float. Bytes [DCBA] read from the device are stored as [ABCD]. |
| 101            | Float32ByteSwap | Float32   | 16-bit/32-bit | Read 32 bits from the Modbus TCP device and interpret as a 32-bit float. Bytes [BADC] read from the device are stored as [ABCD]. |
| 110            | Float64        | Float64    | 16-bit/32-bit | Read 64 bits from the Modbus TCP device and interpret as a 64-bit float. Bytes [HGFEDCBA] read from the device are stored as [ABCDEFGH]. |
| 111            | Float64ByteSwap | Float64   | 16-bit/32-bit | Read 64 bits from the Modbus TCP device and interpret as a 64-bit float. Bytes [BADCFEHG] read from the device are stored as [ABCDEFGH]. |
| 1001 - 1250    | String         | String     | 16-bit/32-bit | 1001 reads a one-character string, 1002 reads a two-character string, and 1003 reads a three-character string and so on. Bytes [AB] are interpreted as "AB". |
| 2001 - 2250    | StringByteSwap | String     | 16-bit/32-bit | 2001 reads a one-character string, 2002 reads a two-character string, and 2003 reads a three-character string and so on. Bytes [BA] are interpreted as "AB". |

## Apply bitmap
The Modbus TCP EDS adapter supports applying bitmaps to the value converted from the readings from the Modbus TCP devices. A bitmap is a series of numbers used to extract and reorder bits from a word register. The format of the bitmap is uuvvwwxxyyzz, where uu, vv, ww, yy, and zz each refer to a single bit. A leading zero is required if the referenced bit is less than 10. The low-order bit is 01 and high-order bit is either 16 or 32. Up to 16 bits can be referenced for a 16-bit word (data types 10 and 20) and up to 32 bits can be referenced for a 32-bit word (data type 30 and 31). For example, the bitmap 0307120802 will map the second bit of the original word to the first bit of the new word, the eighth bit to the second bit, the twelfth bit to the third bit, and so on. The high-order bits of the new word are padded with zeros if they are not specified. 

Not all data types support applying bitmap. The data types supporting bitmap are: 
 - Int16 (Data type code 10) 
 - UInt16 (Data type code 20)
 - Int32 (Data type code 30 and 31) 
 
## Apply data conversion 
 
The Modbus TCP EDS adapter supports applying data conversion to the value converted from reading the Modbus TCP devices. A conversion factor and conversion offset can be specified. The conversion factor is used for scaling the value up or down, and the conversion offset is used for shifting the value. The mathematical equation used in conversion is the following: 

 ```
 <After Conversion> = <Before Conversion> / Factor - Offset 
 ```

 Not all data types support applying data conversion. Data types that support data conversion are: 
 - Int16 (Data type code 10) 
 - UInt16 (Data type code 20) 
 - Int32 (Data type code 30 and 31) 
 - Float32 (Data type code 100 and 101) 

 The value with data conversion applied will always be converted to the 32-bit float type to maintain the precision of the conversion factor and conversion offset.
