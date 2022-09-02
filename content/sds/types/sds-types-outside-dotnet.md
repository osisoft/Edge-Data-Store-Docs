---
uid: SdsTypesOutsideDotNet
---

# SdsTypes outside of .NET framework

You can manually build types when .NET `SdsTypeBuilder` is unavailable. In the following examples, types are built and defined in Python and Javascript. For more detailed examples, see the AVEVA DATA HUB code samples in GitHub for[Python](https://github.com/osisoft/sample-ocs-waveform-python) and [JavaScript](https://github.com/osisoft/sample-ocs-waveform-nodejs).

For samples in other languages, go to [AVEVA DATA HUB code samples in GitHub](https://github.com/osisoft/OSI-Samples-AVEVA DATA HUB/blob/master/docs/SDS_WAVEFORM_README.md).

## SdsTypeCode, SdsTypeProperty, and SdsType

### [Python](#tab/tabid-1)

```python
class SdsTypeCode(Enum):
    Empty = 0
    Object = 1
    DBNull = 2
    Boolean = 3
    Char = 4
      ...
class SdsTypeProperty(object):
    """SDS type property definition"""
    def __init__(self):
            self.__isKey = False
    @property
    def Id(self):
        return self.__id
    @Id.setter
    def Id(self, id):
        self.__id = id
      ...
    @property
    def IsKey(self):
        return self.__isKey
    @IsKey.setter
    def IsKey(self, iskey):
        self.__isKey = iskey
    @property
    def SdsType(self):
        return self.__SdsType
    @SdsType.setter
    def SdsType(self, SdsType):
        self.__SdsType=SdsType
      ...
class SdsType(object):
    """SDS type definitions"""
    def __init__(self):
        self.SdsTypeCode = SdsTypeCode.Object
    @property
    def Id(self):
        return self.__id
    @Id.setter
    def Id(self, id):
        self.__id = id
      ...
    @property
    def BaseType(self):
        return self.__baseType
    @BaseType.setter
    def BaseType(self, baseType):
        self.__baseType = baseType
    @property
    def SdsTypeCode(self):
        return self.__typeCode
    @SdsTypeCode.setter
    def SdsTypeCode(self, typeCode):
        self.__typeCode = typeCode
    @property
    def Properties(self):
        return self.__properties
    @Properties.setter
    def Properties(self, properties):
        self.__properties = properties
```

### [JavaScript](#tab/tabid-2)

```javascript
SdsTypeCodeMap: {
    Empty: 0,
    "Object": 1,
    DBNull: 2,
    "Boolean": 3,
    Char: 4,
    ...
SdsTypeProperty: function (SdsTypeProperty) {
    if (SdsTypeProperty.Id) {
        this.Id = SdsTypeProperty.Id;
    }
    if (SdsTypeProperty.Name) {
        this.Name = SdsTypeProperty.Name;
    }
    if (SdsTypeProperty.Description) {
        this.Description = SdsTypeProperty.Description;
    }
    if (SdsTypeProperty.SdsType) {
        this.SdsType = SdsTypeProperty.SdsType;
    }
    if (SdsTypeProperty.IsKey) {
        this.IsKey = SdsTypeProperty.IsKey;
    }
},
SdsType: function (SdsType) {
    if (SdsType.Id) {
        this.Id = SdsType.Id
    }
    if (SdsType.Name) {
        this.Name = SdsType.Name;
    }
    if (SdsType.Description) {
        this.Description = SdsType.Description;
    }
    if (SdsType.SdsTypeCode) {
        this.SdsTypeCode = SdsType.SdsTypeCode;
    }
    if (SdsType.Properties) {
        this.Properties = SdsType.Properties;
    }
},
```

***

## Enum `State` and type `Simple`

### [Python](#tab/tabid-a)

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
    Measurement = property(getMeasurement, setMeasurement)
    def getMeasurement(self):
        return self.__measurement
    def setMeasurement(self, measurement):
        self.__measurement = measurement
```

### [JavaScript](#tab/tabid-b)

```javascript
var State =
{
    Ok: 0,
    Warning: 1,
    Alarm: 2,
}
var Simple = function () {
    this.Time = null;
    this.State = null;
    this.Measurement = null;
}
```

***

## Defining and creating types

### [Python](#tab/tabid-c)

```python
# Create the properties
# Time is the primary index
time = SdsTypeProperty()
time.Id = "Time"
time.Name = "Time"
time.IsKey = True
time.SdsType = SdsType()
time.SdsType.Id = "DateTime"
time.SdsType.Name = "DateTime"
time.SdsType.SdsTypeCode = SdsTypeCode.DateTime
# State is not a pre-defined type. SdsType must be defined to represent the enum
stateTypePropertyOk = SdsTypeProperty()
stateTypePropertyOk.Id = "Ok"
stateTypePropertyOk.Value = State.Ok
stateTypePropertyWarning = SdsTypeProperty()
stateTypePropertyWarning.Id = "Warning"
stateTypePropertyWarning.Value = State.Warning
stateTypePropertyAlarm = SdsTypeProperty()
stateTypePropertyAlarm.Id = "Alarm"
stateTypePropertyAlarm.Value = State.Alarm
stateType = SdsType()
stateType.Id = "State"
stateType.Name = "State"
stateType.Properties = [ stateTypePropertyOk, stateTypePropertyWarning, \
                        stateTypePropertyAlarm ]
state = SdsTypeProperty()
state.Id = "State"
state.Name = "State"
state.SdsType = stateType
# Value property is a simple non-indexed, pre-defined type
value = SdsTypeProperty()
value.Id = "Measurement"
value.Name = "Measurement"
value.SdsType = SdsType()
value.SdsType.Id = "Double"
value.SdsType.Name = "Double"
# Create the Simple SdsType
simpleType = SdsType()
simpleType.Id = "Simple"
simpleType.Name = "Simple"
simpleType.Description = "Basic sample type"
simpleType.SdsTypeCode = SdsTypeCode.Object
simpleType.Properties = [ time ]
```

### [JavaScript](#tab/tabid-d)

```javascript
// Time is the primary index
var timeProperty = new SdsObjects.SdsTypeProperty({
    "Id": "Time",
    "IsKey": true,
    "SdsType": new SdsObjects.SdsType({
        "Id": "dateType",
        "SdsTypeCode": SdsObjects.SdsTypeCodeMap.DateTime
    })
});
// State is not a pre-defined type. An SdsType must be defined to represent the enum
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
// Measurement property is a simple non-indexed, pre-defined type
var measurementProperty = new SdsObjects.SdsTypeProperty({
    "Id": "Measurement",
    "Name": "Measurement",
    "SdsType": new SdsObjects.SdsType({
        "Id": "doubleType",
        "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Double
    })
});
// Create the Simple SdsType
var simpleType = new SdsObjects.SdsType({
    "Id": "Simple",
    "Name": "Simple", 
    "Description": "This is a simple SDS type ",
    "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Object,
    "Properties": [timeProperty, stateProperty, measurementProperty]
});
```

Working with a derived class is easy. For example, this is a derived class:

```javascript
class Derived(Simple):
    @property
    def Observation(self):
        return self.__observation
    @Observation.setter
    def Observation(self, observation):
        self.__observation = observation
```

***

## Extending the types

### [Python](#tab/tabid-e)

```python
# Observation property is a simple non-indexed, standard data type
observation = SdsTypeProperty()
observation.Id = "Observation"
observation.Name = "Observation"
observation.SdsType = SdsType()
observation.SdsType.Id = "String"
observation.SdsType.Name = "String"
observation.SdsType.SdsTypeCode = SdsTypeCode.String
# Create the derived SdsType
derived = SdsType()
derived.Id = "Derived"
derived.Name = "Derived"
derived.Description = "Derived sample type"
derived.BaseType = simpleType # Set the base type to the derived type
derived.SdsTypeCode = SdsTypeCode.Object
derived.Properties = [ observation ]
```

### [JavaScript](#tab/tabid-f)

```javascript
var observationProprety = new SdsObjects.SdsTypeProperty({
    "Id": "Observation",
    "SdsType": new SdsObjects.SdsType({
        "Id": "strType",
        "SdsTypeCode": SdsObjects.SdsTypeCodeMap.String
    })
});
var derivedType = new SdsObjects.SdsType({
    "Id": "Derived",
    "Name": "Derived",
    "Description": " Derived sample type",
    "BaseType": simpleType,
    "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Object,
    "Properties": [ observationProprety ]
});
```
