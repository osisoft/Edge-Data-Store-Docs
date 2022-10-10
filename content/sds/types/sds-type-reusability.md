---
uid: sdsTypeReusability
---

# SdsType reusability

An SdsType can refer other SdsTypes by using their identifiers. This enables type reusability. For example, if there is a common index and value property for a group of types that may have additional properties, you can create a base type with those properties. This is shown in the following example.

```json
{
    "Id": "Simple",
    "Name": "Simple",
    "SdsTypeCode": 1,
    "Properties": [
        {
            "Id": "Time",
            "Name": "Time",
            "IsKey": true,
            "SdsType": {
                "SdsTypeCode": 16
            }
        },
        {
            "Id": "Measurement",
            "Name": "Measurement",
            "SdsType": {
                "SdsTypeCode": 14
            }
        }
    ]
}
```

If a new type should be created with additional properties to the ones above, add a reference to the base type by specifying the base type's `Id`, as shown in the following example.

```json
{
    "Id": "Complex",
    "Name": "Complex",
    "SdsTypeCode": 1,
    "BaseType":{
        "Id":"Simple"
    },
    "Properties": [
        {
            "Id": "Depth",
            "Name": "Depth",
            "SdsType": {
                "SdsTypeCode": 14
            }
        }
    ]
}
```

The new type may also include the full type definition of the reference type instead of specifying only the `Id`, as shown in the following example.

```json
{
    "Id": "Complex",
    "Name": "Complex",
    "SdsTypeCode": 1,
    "BaseType":{
        "Id": "Simple",
        "Name": "Simple",
        "SdsTypeCode": 1,
        "Properties": [
            {
                "Id": "Time",
                "Name": "Time",
                "IsKey": true,
                "SdsType": {
                    "SdsTypeCode": 16
                }
            },
            {
                "Id": "Measurement",
                "Name": "Measurement",
                "SdsType": {
                    "SdsTypeCode": 14
                }
            }
        ]
    },
    "Properties": [
        {
            "Id": "Depth",
            "Name": "Depth",
            "SdsType": {
                "SdsTypeCode": 14
            }
        }
    ]
}
```

If you send the full definition, the referenced types (base type `Simple` in the example above) should match the actual type initially created. If you send the full definition and the referenced types do not exist, SDS creates them automatically. Further type creations can reference them as demonstrated above.

**Note:** When trying to get types back from SDS, the results will also include types that were automatically created by SDS.

Base types and properties of type Object, Enum, and user-defined collections such as Array, List, and Dictionary are treated as referenced types. Note that you cannot create streams using these referenced types. If a stream of particular type is to be created, the type should contain at least one property with a valid index type as described in [Indexes](xref:sdsIndexes). The index property may also be in the base type as shown in the example above.

If needed, the base type's `Id` can be changed to be more meaningful.

You can do this using any programming language. The following is a .NET example.

```csharp
public class Basic
{
    [SdsMember(IsKey = true, Order = 0)]
    public DateTime Time { get; set; }
    public double Temperature { get; set; }
}
public class EngineMonitor : Basic
{
    public double PistonSpeed { get; set; }
}
public class WindShieldMonitor : Basic
{
    public double Luminance { get; set; }
}
SdsType engineType = SdsTypeBuilder.CreateSdsType<EngineMonitor>();
engineType.Id = "Engine";
engineType.BaseType.Id = "Basic";
SdsType windShieldType = SdsTypeBuilder.CreateSdsType<WindShieldMonitor>();
windShieldType.Id = "WindShield";
windShieldType.BaseType.Id = "Basic";
```
