---
uid: SdsTypesInDotNet
---

# SdsTypes in .NET framework

When working in .NET, use the `SdsTypeBuilder` to create SdsTypes. The `SdsTypeBuilder` eliminates 
potential errors that can occur when working with SdsTypes manually.

There are several ways to work with the `SdsTypeBuilder`. One is to use the static methods for convenience:

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
    
    [SdsMember(IsQuality = true)]
    public State State { get; set; }
    
    public Double Measurement { get; set; }
}
SdsType simpleType = SdsTypeBuilder.CreateSdsType<Simple>();
simpleType.Id = "Simple";
simpleType.Name = "Simple";
simpleType.Description = "Basic sample type";
```

`SdsTypeBuilder` recognizes the ``System.ComponentModel.DataAnnotations.KeyAttribute`` and 
its own ``OSIsoft.Sds.SdsMemberAttribute``. When using the ``SdsMemberAttribute`` to specify 
the primary index, set the ``IsKey`` to true.

The SdsType is created with the following parameters. `SdsTypeBuilder` automatically generates 
unique identifiers. Note that the following table contains only a partial list of fields.

| Field            | Values                  |             |                                      |
|------------------|-------------------------|-------------|--------------------------------------|
| Id               | Simple                                                                       |
| Name             | Simple                                                                       |
| Description      | Basic sample type                                                            |
| Properties       | Count = 3                                                                    |
|   [0]            | Id                      | Time                                               |
|                  | Name                    | Time                                               |
|                  | Description             | null                                               |
|                  | Order                   | 0                                                  |
|                  | IsKey                   | true                                               |
|                  | SdsType                 | Id          | c48bfdf5-a271-384b-bf13-bd21d931c1bf |
|                  |                         | Name        | DateTime                             |
|                  |                         | Description | null                                 |
|                  |                         | Properties  | null                                 |
|                  | Value                   | null                                               |
|   [1]            | Id                      | State                                              |
|                  | Name                    | State                                              |
|                  | Description             | null                                               |
|                  | Order                   | 0                                                  |
|                  | IsKey                   | false                                              |
|                  | SdsType                 | Id          | 02728a4f-4a2d-3588-b669-e08f19c35fe5 |
|                  |                         | Name        | State                                |
|                  |                         | Description | null                                 |
|                  |                         | Properties  | Count = 3                            |
|                  |                         | [0]         | Id                | "Ok"             |
|                  |                         |             | Name              | null             |
|                  |                         |             | Description       | null             |
|                  |                         |             | Order             | 0                |
|                  |                         |             | SdsType           | null             |
|                  |                         |             | Value             | 0                |
|                  |                         | [1]         | Id                | "Warning"        |
|                  |                         |             | Name              | null             |
|                  |                         |             | Description       | null             |
|                  |                         |             | Order             | 0                |
|                  |                         |             | SdsType           | null             |
|                  |                         |             | Value             | 1                |
|                  |                         | [2]         | Id                | "Alarm"          |
|                  |                         |             | Name              | null             |
|                  |                         |             | Description       | null             |
|                  |                         |             | Order             | 0                |
|                  |                         |             | SdsType           | null             |
|                  |                         |             | Value             | 2                |
|                  | Value                   | null                                               |
|   [2]            | Id                      | Measurement                                        |
|                  | Name                    | Measurement                                        |
|                  | Description             | null                                               |
|                  | Order                   | 0                                                  |
|                  | IsKey                   | false                                              |
|                  | SdsType                 | Id          | 0f4f147f-4369-3388-8e4b-71e20c96f9ad |
|                  |                         | Name        | Double                               |
|                  |                         | Description | null                                 |
|                  |                         | Properties  | null                                 |
|                  | Value                   | null                                               |


The `SdsTypeBuilder` also supports derived types. You need not add the base types to SDS before using `SdsTypeBuilder`. Base types are maintained within the SdsType.
