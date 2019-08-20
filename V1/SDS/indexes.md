---
uid: sdsIndexes
---

Indexes
=======

Indexes speed up and order the results of searches. A key uniquely identifies a record within a collection of records. Keys are unique within the collection.

In Sds, the key of an SdsType is also an index. The key is often referred to as the *primary index,* while all other indexes are referred to as *secondary indexes* or *secondaries*.

An SdsType that is used to define an SdsStream must specify a key. When inserting data into an SdsStream, every key value must be unique. Sds will not store more than a single event for a given key. An event with a particular key may be deleted or updated, but two events with the same key cannot exist.

Secondary indexes are defined on SdsStreams and are applied to a single property. You can define many secondary indexes. Secondary index values do not need to be unique.

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

Working with Indexes
--------------------

The following discusses the types defined in the [Python](<https://github.com/osisoft/OCS-Samples/tree/master/basic_samples/SDS/Python/SDSPy>) and [Java Script](<https://github.com/osisoft/OCS-Samples/tree/master/basic_samples/SDS/JavaScript>) samples. Samples in other languages can be found [here](<https://github.com/osisoft/OCS-Samples/tree/master/basic_samples/SDS>).

To build an SdsType representation of the following sample class, see [Sample](#sample):

*Python*

```python
class State(Enum):
  Ok = 0
  Warning = 1
  Alarm = 2

class Simple(object):
  Time = property(getTime, setTime)
  def getTime(self):
    return self.__time
  def setTime(self, time):
    self.__time = time

  State = property(getState, setState)
  def getState(self):
    return self.__state
  def setState(self, state):
    self.__state = state

  Measurement = property(getValue, setValue)
  def getValue(self):
    return self.__measurement
  def setValue(self, measurement):
    self.__measurement = measurement
```

*JavaScript*

```javascript
var State =
{
  Ok: 0,
  Warning: 1,
  Alarm: 2
}

var Simple = function () {
  this.Time = null;
  this.State = null;
  this.Value = null;
}
```

### Sample

The following code is used to build an SdsType representation of the sample class above:

*Python*

```python
# Create the properties

# Time is the primary key
time = SdsTypeProperty()
time.Id = "Time"
time.Name = "Time"
time.IsKey = True
time.SdsType = SdsType()
time.SdsType.Id = "DateTime"
time.SdsType.Name = "DateTime"
time.SdsType.SdsTypeCode = SdsTypeCode.DateTime

# State is not a pre-defined type. An SdsType must be defined to represent the enum
stateTypePropertyOk = SdsTypeProperty()
stateTypePropertyOk.Id = "Ok"
stateTypePropertyOk.Measurement = State.Ok
stateTypePropertyWarning = SdsTypeProperty()
stateTypePropertyWarning.Id = "Warning"
stateTypePropertyWarning.Measurement = State.Warning
stateTypePropertyAlarm = SdsTypeProperty()
stateTypePropertyAlarm.Id = "Alarm"
stateTypePropertyAlarm.Measurement = State.Alarm

stateType = SdsType()
stateType.Id = "State"
stateType.Name = "State"
stateType.Properties = [ stateTypePropertyOk, stateTypePropertyWarning,\
                        stateTypePropertyAlarm ]
state = SdsTypeProperty()
state.Id = "State"
state.Name = "State"
state.SdsType = stateType

# Measurement property is a simple non-indexed, pre-defined type
measurement = SdsTypeProperty()
measurement.Id = "Measurement"
measurement.Name = "Measurement"
measurement.SdsType = SdsType()
measurement.SdsType.Id = "Double"
measurement.SdsType.Name = "Double"

# Create the Simple SdsType
simple = SdsType()
simple.Id = str(uuid.uuid4())
simple.Name = "Simple"
simple.Description = "Basic sample type"
simple.SdsTypeCode = SdsTypeCode.Object
simple.Properties = [ time, state, measurement ]
```

*JavaScript*

```javascript
// Time is the primary key
var timeProperty = new SdsObjects.SdsTypeProperty({
  "Id": "Time",
  "IsKey": true,
  "SdsType": new SdsObjects.SdsType({
    "Id": "dateType",
    "SdsTypeCode": SdsObjects.SdsTypeCodeMap.DateTime
  })
});

// State is not a pre-defined type. A SdsType must be defined to represent the enum
var stateTypePropertyOk = new SdsObjects.SdsTypeProperty({
  "Id": "Ok",
  "Value": State.Ok
});

var stateTypePropertyWarning = new SdsObjects.SdsTypeProperty({
  "Id": "Warning",
  "Value": State.Warning
});

var stateTypePropertyAlarm = new SdsObjects.SdsTypeProperty({
  "Id": "Alarm",
  "Value": State.Alarm
});

var stateType = new SdsObjects.SdsType({
  "Id": "State",
  "Name": "State",
  "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Int32Enum,
  "Properties": [stateTypePropertyOk, stateTypePropertyWarning,
    stateTypePropertyAlarm, stateTypePropertyRed]
});

// Value property is a simple non-indexed, pre-defined type
var valueProperty = new SdsObjects.SdsTypeProperty({
  "Id": "Value",
  "SdsType": new SdsObjects.SdsType({
    "Id": "doubleType",
    "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Double
  })
});

// Create the Simple SdsType
var simpleType = new SdsObjects.SdsType({
  "Id": "Simple",
  "Name": "Simple",
  "Description": "This is a simple Sds type",
  "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Object,
  "Properties": [timeProperty, stateProperty, valueProperty]
});
```

The Time property is identified as the Key by defining its SdsTypeProperty as follows:

*Python*

```python
# Time is the primary key
time = SdsTypeProperty()
time.Id = "Time"
time.Name = "Time"
time.IsKey = True
time.SdsType = SdsType()
time.SdsType.Id = "DateTime"
time.SdsType.Name = "DateTime"
time.SdsType.SdsTypeCode = SdsTypeCode.DateTime
```

*JavaScript*

```javascript
// Time is the primary key
var timeProperty = new SdsObjects.SdsTypeProperty({
  "Id": "Time",
  "IsKey": true,
  "SdsType": new SdsObjects.SdsType({
    "Id": "dateType",
    "SdsTypeCode": SdsObjects.SdsTypeCodeMap.DateTime
  })
});
```

**Note:** The time.IsKey field is set to true.

To read data using the key, you define a start index and an end index. For DateTime, use ISO 8601 representation of dates and times. To query for a window of values between January 1, 2010 and February 1, 2010, you would define indexes as “2010-01-01T08:00:00.000Z” and “2010-02-01T08:00:00.000Z”, respectively.

For additional information, see [Reading data](xref:sdsReadingData).
