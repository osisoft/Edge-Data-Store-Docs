---
uid: sdsIndexExamples
---

# Index examples

The following examples show how to build an SdsType representation using the provided sample classes in Python and JavaScript.

## Sample classes

The following sample classes are used in the [Example SdsType](#example-sdstype) section below.

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

## Example SdsType

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

To read data using the key, define a start index and an end index. For DateTime, use ISO 8601 representation of dates and times. To query for a window of values between January 1, 2022 and February 1, 2022, define indexes as *2022-01-01T08:00:00.000Z* and *2022-02-01T08:00:00.000Z*, respectively.

For additional information, see [Reading data](xref:sdsReadingData).
