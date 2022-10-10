---
uid: sdsGSStreamViews
---

# Get started with SdsStreamViews

To work with stream views, you first need to have types, streams, and streams data defined. The following is a simplified procedure for working with a stream view. For code examples, see [Work with SdsStreamViews outside of .NET framework](xref:IndexesOutsideDotNet) and [Work with SdsStreamViews in .NET framework](xref:IndexesInDotNet).

1. Create a type that will be the source type.

1. Create a stream that is of the type defined in the previous step.

1. Write data into the stream that was created in the previous step.

1. Read data from the stream to verify.

1. Create another type that will be the target type.

1. Create a stream view using the source type (step 1) and the target type (step 5).

    - The mapping between the source and the target type happens automatically if you do not specify it in [SdsStreamViewProperty](xref:sdsStreamViews#SdsStreamViewProperty).

1. Get [SdsStreamViewMap](xref:sdsStreamViews) to see how properties are mapped.

1. Read data from the stream with the stream view to verify. For more information, see [Reading with SdsStreamViews](xref:sdsReadingData#reading-with-sdsstreamviews).

## Work with SdsStreamViews outside of .NET framework

When working with stream views, invoke HTTP directly or use some of the sample code. Both Python and JavaScript use SdsStreamView definitions.

The following JSON is a simple mapping between a source type with identifier `Simple` and a target type with identifier `Simple1`.

```json
{  
  "Id":"StreamView",
  "Name":"StreamView",
  "SourceTypeId":"Simple",
  "TargetTypeId":"Simple1"
}
```

The following is the corresponding `SdsStreamViewMap`.

```json
{  
  "SourceTypeId":"Simple",
  "TargetTypeId":"Simple1",
  "Properties":[  
      {  
        "SourceId":"Time",
        "TargetId":"Time"
      },
      {  
        "SourceId":"State",
        "TargetId":"State"
      },
      {  
        "SourceId":"Measurement",
        "TargetId":"Value",
        "Mode":4
      }
  ]
}
```

## Work with SdsStreamViews in .NET framework

When working in .NET, use the SDS client libraries method `ISdsMetadataService`.

Given the following:

```csharp
public enum State
{
    Ok,
    Warning,
    Alarm
}
public class Simple
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public State State { get; set; }
    public double Measurement { get; set; }
}
SdsType simpleType = SdsTypeBuilder.CreateSdsType<Simple>();
simpleType.Id = "Simple";
simpleType.Name = "Simple";
await config.GetOrCreateTypeAsync(simpleType);
SdsStream simpleStream = await config.GetOrCreateStreamAsync(new SdsStream()
{
    Id = "Simple",
    Name = "Simple",
    TypeId = simpleType.Id
});
DateTime start = new DateTime(2017, 4, 1).ToUniversalTime();
for (int i = 0; i < 10; i++)
{
    Simple value = new Simple()
    {
        Time = start + TimeSpan.FromMinutes(i),
        State = State.Warning,
        Measurement = i
    };
    await client.InsertValueAsync(simpleStream.Id, value);
}
IEnumerable<Simple> simpleValues = await client.GetWindowValuesAsync<Simple>(simpleStream.Id, start.ToString("o"),
    start.Add(TimeSpan.FromMinutes(10)).ToString("o"));
foreach (Simple value in simpleValues)
    Console.WriteLine($"{value.Time}: {value.State}, {value.Measurement}");
// The example displays the following output:
//  4 / 1 / 2017 7:00:00 AM: Warning, 0
//  4 / 1 / 2017 7:01:00 AM: Warning, 1
//  4 / 1 / 2017 7:02:00 AM: Warning, 2
//  4 / 1 / 2017 7:03:00 AM: Warning, 3
//  4 / 1 / 2017 7:04:00 AM: Warning, 4
//  4 / 1 / 2017 7:05:00 AM: Warning, 5
//  4 / 1 / 2017 7:06:00 AM: Warning, 6
//  4 / 1 / 2017 7:07:00 AM: Warning, 7
//  4 / 1 / 2017 7:08:00 AM: Warning, 8
//  4 / 1 / 2017 7:09:00 AM: Warning, 9
```

To map the `Measurement` property to a property in the same location of the same type, allow SDS to automatically determine mapping.

```csharp
public class Simple1
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public State State { get; set; }
    public double Value { get; set; }
}
SdsType simple1Type = SdsTypeBuilder.CreateSdsType<Simple1>();
simple1Type.Id = "Simple1";
simple1Type.Name = "Simple1";
simple1Type = await config.GetOrCreateTypeAsync(simple1Type);
SdsStreamView view = new SdsStreamView()
{
    Id = "StreamView",
    Name = "StreamView",
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple1Type.Id,
};
view = await config.GetOrCreateStreamViewAsync(view);
SdsStreamViewMap map = await config.GetStreamViewMapAsync(view.Id);
Console.WriteLine($"{map.SourceTypeId} to {map.TargetTypeId}");
for (int i = 0; i < map.Properties.Count; i++)
    Console.WriteLine($"\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}");
Console.WriteLine();
IEnumerable<Simple1> simple1Values = await client.GetWindowValuesAsync<Simple1>(simpleStream.Id, start.ToString("o"),
    start.Add(TimeSpan.FromMinutes(10)).ToString("o"), view.Id);
foreach (Simple1 value in simple1Values)
    Console.WriteLine($"{value.Time}: {value.State}, {value.Value}");
// The example displays the following output:
//    Simple to Simple1
//        0) Time to Time - None
//        1) State to State - None
//        2) Measurement to Value - FieldRename
//
//  4 / 1 / 2017 7:00:00 AM: Warning, 0
//  4 / 1 / 2017 7:01:00 AM: Warning, 1
//  4 / 1 / 2017 7:02:00 AM: Warning, 2
//  4 / 1 / 2017 7:03:00 AM: Warning, 3
//  4 / 1 / 2017 7:04:00 AM: Warning, 4
//  4 / 1 / 2017 7:05:00 AM: Warning, 5
//  4 / 1 / 2017 7:06:00 AM: Warning, 6
//  4 / 1 / 2017 7:07:00 AM: Warning, 7
//  4 / 1 / 2017 7:08:00 AM: Warning, 8
//  4 / 1 / 2017 7:09:00 AM: Warning, 9
```

The `SdsStreamViewMap` shows that SDS was able to determine that mapping from `Measurement` to `Value` resulted in renaming.

SDS can also determine property mapping of the same name but different type. Note that the location of the `Measurement` property is different, yet it is still mapped.

```csharp
public class Simple2
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public int Measurement { get; set; }
    public State State { get; set; }
}
SdsType simple2Type = SdsTypeBuilder.CreateSdsType<Simple2>();
simple2Type.Id = "Simple2";
simple2Type.Name = "Simple2";
simple2Type = await config.GetOrCreateTypeAsync(simple2Type);
SdsStreamView view = new SdsStreamView() 
{
    Id = "StreamView1",
    Name = "StreamView1",
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple2Type.Id,
};
view = await config.GetOrCreateStreamViewAsync(view);
SdsStreamViewMap map = await config.GetStreamViewMapAsync(view.Id);
Console.WriteLine($"{map.SourceTypeId} to {map.TargetTypeId}");
for (int i = 0; i < map.Properties.Count; i++)
    Console.WriteLine($"\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}");
Console.WriteLine();
IEnumerable<Simple2> simple2Values = await client.GetWindowValuesAsync<Simple2>(simpleStream.Id, start.ToString("o"),
    start.Add(TimeSpan.FromMinutes(10)).ToString("o"), view.Id);
foreach (Simple2 value in simple2Values)
    Console.WriteLine($"{value.Time}: {value.State}, {value.Measurement}");
//The example displays the following output:
//    Simple to Simple2
//        0) Time to Time - None
//        1) State to State - None
//        2) Measurement to Measurement - FieldConversion
//
//    4 / 1 / 2017 7:00:00 AM: Warning, 0
//    4 / 1 / 2017 7:01:00 AM: Warning, 1
//    4 / 1 / 2017 7:02:00 AM: Warning, 2
//    4 / 1 / 2017 7:03:00 AM: Warning, 3
//    4 / 1 / 2017 7:04:00 AM: Warning, 4
//    4 / 1 / 2017 7:05:00 AM: Warning, 5
//    4 / 1 / 2017 7:06:00 AM: Warning, 6
//    4 / 1 / 2017 7:07:00 AM: Warning, 7
//    4 / 1 / 2017 7:08:00 AM: Warning, 8
//    4 / 1 / 2017 7:09:00 AM: Warning, 9
```

The `SdsStreamViewMap` shows that the source `Measurement` floating point is converted to integer in the target.

When neither the field name, the field type, or location matches, SDS does not determine mapping. The source is eliminated and the target is added and assigned the default value.

```csharp
public class Simple3
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public State State { get; set; }
    public int Value { get; set; }
}
SdsType simple3Type = SdsTypeBuilder.CreateSdsType<Simple3>();
simple3Type.Id = "Simple3";
simple3Type.Name = "Simple3";
simple3Type = await config.GetOrCreateTypeAsync(simple3Type);
SdsStreamView view = new SdsStreamView()
{
    Id = "StreamView2",
    Name = "StreamView2",
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple3Type.Id,
};
view = await config.GetOrCreateStreamViewAsync(view);
SdsStreamViewMap map = await config.GetStreamViewMapAsync(view.Id);
Console.WriteLine($"{map.SourceTypeId} to {map.TargetTypeId}");
for (int i = 0; i < map.Properties.Count; i++)
    Console.WriteLine($"\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}");
Console.WriteLine();
IEnumerable<Simple3> simple3Values = await client.GetWindowValuesAsync<Simple3>(simpleStream.Id, start.ToString("o"),
    start.Add(TimeSpan.FromMinutes(10)).ToString("o"), view.Id);
foreach (Simple3 value in simple3Values)
    Console.WriteLine($"{value.Time}: {value.State}, {value.Value}");
//The example displays the following output:
//    Simple to Simple3
//        0) Time to Time - None
//        1) State to State - None
//        2) Measurement to  -FieldRemove
//        3)  to Value -FieldAdd
//
// 4 / 1 / 2017 7:00:00 AM: Warning, 0
// 4 / 1 / 2017 7:01:00 AM: Warning, 0
// 4 / 1 / 2017 7:02:00 AM: Warning, 0
// 4 / 1 / 2017 7:03:00 AM: Warning, 0
// 4 / 1 / 2017 7:04:00 AM: Warning, 0
// 4 / 1 / 2017 7:05:00 AM: Warning, 0
// 4 / 1 / 2017 7:06:00 AM: Warning, 0
// 4 / 1 / 2017 7:07:00 AM: Warning, 0
// 4 / 1 / 2017 7:08:00 AM: Warning, 0
// 4 / 1 / 2017 7:09:00 AM: Warning, 0
```

To map when SDS cannot determine mapping, use SdsStreamView `Properties`.

```csharp
SdsStreamView view = new SdsStreamView()
{
    Id = "SteamView3",
    Name = "StreamView3",
    SourceTypeId = simpleType.Id,
    TargetTypeId = simple3Type.Id,
    Properties = new List<SdsStreamViewProperty>()
    {
        new SdsStreamViewProperty()
        {
            SourceId = "Time",
            TargetId = "Time"
        },
        new SdsStreamViewProperty()
        {
            SourceId = "State",
            TargetId = "State"
        },
        new SdsStreamViewProperty()
        {
            SourceId = "Measurement",
            TargetId = "Value"
        }
    }
};
view = await config.GetOrCreateStreamViewAsync(view);
SdsStreamViewMap map = await config.GetStreamViewMapAsync(view.Id);
Console.WriteLine($"{map.SourceTypeId} to {map.TargetTypeId}");
for (int i = 0; i < map.Properties.Count; i++)
    Console.WriteLine($"\t{i}) {map.Properties[i].SourceId} to {map.Properties[i].TargetId} - {map.Properties[i].Mode}");
Console.WriteLine();
IEnumerable<Simple3> simple3Values = await client.GetWindowValuesAsync<Simple3>(simpleStream.Id, start.ToString("o"),
    start.Add(TimeSpan.FromMinutes(10)).ToString("o"), view.Id);
foreach (Simple3 value in simple3Values)
    Console.WriteLine($"{value.Time}: {value.State}, {value.Value}");
//The example displays the following output:
//    Simple to Simple3
//        0) Time to Time - None
//        1) State to State - None
//        2) Measurement to Value - FieldRename, FieldConversion
//
//    4 / 1 / 2017 7:00:00 AM: Warning, 0
//    4 / 1 / 2017 7:01:00 AM: Warning, 1
//    4 / 1 / 2017 7:02:00 AM: Warning, 2
//    4 / 1 / 2017 7:03:00 AM: Warning, 3
//    4 / 1 / 2017 7:04:00 AM: Warning, 4
//    4 / 1 / 2017 7:05:00 AM: Warning, 5
//    4 / 1 / 2017 7:06:00 AM: Warning, 6
//    4 / 1 / 2017 7:07:00 AM: Warning, 7
//    4 / 1 / 2017 7:08:00 AM: Warning, 8
//    4 / 1 / 2017 7:09:00 AM: Warning, 9
```
