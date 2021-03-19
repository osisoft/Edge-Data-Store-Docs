---
uid: sdsIndexes
---

# Indexes

Indexes speed up and order the results of searches. A key uniquely identifies a record within a collection of records.

In SDS, the key of an SdsType is also an index. The key is often referred to as the *primary index*, while all other indexes are referred to as *secondary indexes* or *secondaries*.

An SdsType that is used to define an SdsStream must specify a key. When inserting data into an SdsStream, every key value must be unique. SDS will not store more than a single event for a given key. An event with a particular key may be deleted or updated, but two events with the same key cannot exist.

Secondary indexes are defined on SdsStreams and applied to a single property. You can define many secondary indexes and the values do not need to be unique.

The following table contains supported index types:

Type                     | SdsTypeCode
-----------------------  | -----
Boolean                  | 3
Byte                     | 6
Char                     | 4
DateTime                 | 16
DateTimeOffset           | 20
Decimal                  | 15
Double                   | 14
Guid                     | 19
Int16                    | 7
Int32                    | 9
Int64                    | 11
SByte                    | 5
Single                   | 13
String                   | 18
TimeSpan                 | 21
UInt16                   | 8
UInt32                   | 10
UInt64                   | 12
