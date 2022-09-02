---
uid: IndexesOutsideDotNet
---

# Indexes outside of .NET framework

The following examples are in Python and JavaScript.

## Simple indexes

When the .NET `SdsTypeBuilder` is unavailable, indexes must be built manually.

The following examples show SdsTypes defined in [Python](https://github.com/osisoft/sample-ocs-waveform-python) and [Java Script](https://github.com/osisoft/sample-ocs-waveform-nodejs). For samples in other languages, go to [AVEVA DATA HUB code samples in GitHub](https://github.com/osisoft/OSI-Samples-ADH/blob/main/docs/SDS_WAVEFORM.md).

To build an SdsType representation of sample classes in Python and Java Script, see [Sample](#sample) below:

##### [Python](#tab/tabid-1)

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

##### [JavaScript](#tab/tabid-2)

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

***

### Sample

The following code is used to build an SdsType representation of the sample class above.

##### [Python](#tab/tabid-3)

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

##### [JavaScript](#tab/tabid-4)

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
    
      // State is not a pre-defined type. SdsType must be defined to represent the enum
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

***

The `Time` property is identified as the primary index by defining its SdsTypeProperty as follows:

##### [Python](#tab/tabid-5)

```python
      # Time is the primary index
      time = SdsTypeProperty()
      time.Id = "Time"
      time.Name = "Time"
      time.IsKey = True
      time.SdsType = SdsType()
      time.SdsType.Id = "DateTime"
      time.SdsType.Name = "DateTime"
      time.SdsType.SdsTypeCode = SdsTypeCode.DateTime
```

##### [JavaScript](#tab/tabid-6)

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
```

***

Note that the `time.IsKey` field is set to true.

To read data using the index, you define a start index and an end index. For `DateTime`, use the ISO 8601 representation of dates and times. To query for a window of values between January 1, 2010 and February 1, 2010, define indexes as “2010-01-01T08:00:00.000Z” and “2010-02-01T08:00:00.000Z”, respectively.

For additional information, see [Read data](xref:sdsReadingData).

## Secondary indexes

Secondary indexes are defined at the stream level. To create a stream using the `Simple` class and adding a secondary index on the `Measurement`, use the previously defined type. Then create `SdsStreamIndex` specifying the `Measurement` property and define a stream identifying the `Measurement` as the secondary index as shown in the following example.

##### [Python](#tab/tabid-7)

```python
      # Create the properties
    
      measurementIndex = SdsStreamIndex()
      measurementIndex.SdsTypePropertyId = measurement.Id
    
      stream = SdsStream()
      stream.Id = str(uuid.uuid4())
      stream.Name = "SimpleWithSecond"
      stream.Description = "Simple with secondary index"
      stream.TypeId = simple.Id
      stream.Indexes = [ measurementIndex ]
```

##### [JavaScript](#tab/tabid-8)

```javascript
      var measurementIndex = new SdsObjects.SdsStreamIndex({
        "SdsTypePropertyId": valueProperty.Id
      });
    
      var stream = new SdsObjects.SdsStream({
        "Id": "SimpleWithSecond",
        "Name": "SimpleWithSecond",
        "Description": "Simple with secondary index",
        "TypeId": simpleTypeId,
        "Indexes": [ measurementIndex ]
      });
```

***

## Compound indexes

Consider the following Python and JavaScript types.

##### [Python](#tab/tabid-9)

```python
      class Simple(object):
      # First-order index property
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
    
      class DerivedCompoundIndex(Simple):
      # Second-order index property
      @property
      def Recorded(self):
        return self.__recorded
      @Recorded.setter
      def Recorded(self, recorded):
        self.__recorded = recorded
```

##### [JavaScript](#tab/tabid-10)

```javascript
      var Simple = function () {
        this.Time = null;
        this.State = null;
        this.Value = null;
      }
    
      var DerivedCompoundIndex = function() {
        Simple.call(this);
        this.Recorded = null;
      }
```

***

To turn the simple type shown in the example into a type supporting the `DerivedCompoundIndex` type with a compound index based on the `Simple.Time` and `DerivedCompoundIndex.Recorded`, extend the type as shown in the following example.

##### [Python](#tab/tabid-11)

```python
      # We set the order for this property. The order of the first property defaulted to 0
      recorded = SdsTypeProperty()
      recorded.Id = "Recorded"
      recorded.Name = "Recorded"
      recorded.IsKey = True
      recorded.Order = 1
      recorded.SdsType = SdsType()
      recorded.SdsType.Id = "DateTime"
      recorded.SdsType.Name = "DateTime"
      recorded.SdsType.SdsTypeCode = SdsTypeCode.DateTime
    
      # Create the Derived SdsType
      derived = SdsType()
      derived.Id = str(uuid.uuid4())
      derived.Name = "Compound"
      derived.Description = "Derived compound index sample type"
      derived.BaseType = simple
      derived.SdsTypeCode = SdsTypeCode.Object
      derived.Properties = [ recorded ]
```

##### [JavaScript](#tab/tabid-12)

```javascript
      // We set the order for this property. The order of the first property defaulted to 0
      var recordedProperty = new SdsObjects.SdsTypeProperty({
        "Id": "Recorded",
        "Name": "Recorded",
        "IsKey": true,
        "Order": 1,
        "SdsType": new SdsObjects.SdsType({
          "Id": "DateTime",
          "Name": "DateTime",
          "SdsTypeCode": SdsObjects.SdsTypeCodeMap.DateTime
        })
      });
    
      // Create the Derived SdsType
      var derivedType = new SdsObjects.SdsTyp({
        "Id": "Compound",
        "Name": "Compound",
        "Description": "Derived compound index sample type",
        "BaseType": simpleType,
        "SdsTypeCode": SdsObjects.SdsTypeCodeMap.Object,
        "Properties": [recordedProperty]
      });
```

***

Data in the stream will be ordered as shown in the following table.

| Time   | Recorded   | Measurement   |
|------------|----------------|-------------------|
| 01:00      | 00:00          | 0                 |
| 01:00      | 01:00          | 2                 |
| 01:00      | 14:00          | 5                 |
| 02:00      | 00:00          | 1                 |
| 02:00      | 01:00          | 3                 |
| 02:00      | 02:00          | 4                 |
| 02:00      | 14:00          | 6                 |

If the `Order` parameters were reversed with `Recorded` set to `0` and `Time` set to `1`, the results would be sorted as shown in the following table.

| Time   | Recorded   | Measurement   |
|------------|----------------|-------------------|
| 01:00      | 00:00          | 0                 |
| 02:00      | 00:00          | 1                 |
| 01:00      | 01:00          | 2                 |
| 02:00      | 01:00          | 3                 |
| 02:00      | 02:00          | 4                 |
| 01:00      | 14:00          | 5                 |
| 02:00      | 14:00          | 6                 |
