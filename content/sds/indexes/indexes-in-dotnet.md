---
uid: IndexesInDotNet
---

# Indexes in .NET framework

The following examples are in csharp, but you can apply the concepts such as simple, compound, and secondary indexes to any language. For more information on indexes in JavaScript and Python, see [Indexes outside of .NET framework](#indexes-outside-of-net-framework). 

## Simple indexes

When working in .NET, use the `SdsTypeBuilder` together with either the `OSIsoft.Sds.SdsMemberAttribute` (preferred) or the `System.ComponentModel.DataAnnotations.KeyAttribute` to identify the property that defines the simple index. Using the `SdsTypeBuilder` eliminates potential errors that might occur when working with SdsTypes manually.

```csharp
      public enum State
      {
        Ok,
        Warning,
        Alarm
      }
    
      public class Simple
      {
        [SdsMember(IsKey = true, Order = 0) ]
        public DateTime Time { get; set; }
        public State State { get; set; }
        public Double Measurement { get; set; }
      }
    
      SdsType simpleType = SdsTypeBuilder.CreateSdsType<Simple>();
```

To read data that is located between two indexes, define both a start index and an end index. For `DateTime`, use the ISO 8601 representation of dates and times. For example, to query for a window of simple values between January 1, 2010 and February 1, 2010, you can define indexes and query as follows:

```csharp
      IEnumerable<Simple> values = await
      client.GetWindowValuesAsync<Simple>(simpleStream.Id,
      "2010-01-01T08:00:00.000Z","2010-02-01T08:00:00.000Z");
```

For more information about querying data, see [Read data](xref:sdsReadingData).

## Secondary indexes

Secondary indexes are defined at the stream level. To add indexes to a stream, add them to the stream `Indexes` field. For example, to add a second index on `Measurement`, use the following code:

```csharp
      SdsStreamIndex measurementIndex = new SdsStreamIndex()
      {
          SdsTypePropertyId = simpleType.Properties.First(p => p.Id.Equals("Measurement")).Id
      };
      SdsStream secondary = new SdsStream()
      {
          Id = "Simple with Secondary",
          TypeId = simpleType.Id,
          Indexes = new List<SdsStreamIndex>()
          {
              measurementIndex
          }
      };
      secondary = await config.GetOrCreateStreamAsync(secondary);
```

To read data indexed by a secondary index, use a filtered GET method(`IEnumerable<Simple> orderedBySecondary = await client.GetFilteredValuesAsync<Simple>(secondary.Id, 
      "Measurement gt 0 and Measurement lt 6");`).

Use indexes to order data. On a stream level, you can set the property to be the secondary index. To improve performance when working with a large set of data: 

- Ensure that the property is a secondary index.

- Use [logical operators](xref:sdsFilterExpressions#examples-of-logical-operators) for filtering. 

```csharp
      await client.UpdateValuesAsync<Simple>(secondary.Id, new List<Simple>()
        {
            new Simple()
            {
                Time = time,
                State = State.Ok,
                Measurement = 5
            },
            new Simple()
            {
                Time = time + TimeSpan.FromSeconds(1),
                State = State.Ok,
                Measurement = 4
            },
            new Simple()
            {
                Time = time + TimeSpan.FromSeconds(2),
                State = State.Ok,
                Measurement = 3
            },
            new Simple()
            {
                Time  = time + TimeSpan.FromSeconds(3),
                State = State.Ok,
                Measurement = 2
            },
            new Simple()
            {
                Time = time + TimeSpan.FromSeconds(4),
                State = State.Ok,
                Measurement = 1
            },
        });
    
      IEnumerable<Simple> orderedByKey = await client.GetWindowValuesAsync<Simple>(secondary.Id, 
          time.ToString("o"), time.AddSeconds(4).ToString("o"));
      foreach (Simple value in orderedByKey)
          Console.WriteLine("{0}: {1}", value.Time, value.Measurement);
    
      Console.WriteLine();
    
      IEnumerable<Simple> orderedBySecondary = await client.GetFilteredValuesAsync<Simple>(secondary.Id, 
      "Measurement gt 0 and Measurement lt 6");
      foreach (Simple value in orderedBySecondary)
          Console.WriteLine("{0}: {1}", value.Time, value.Measurement);
      Console.WriteLine();
    
      // Output:
      // 1/20/2017 12:00:00 AM: 5
      // 1/20/2017 12:00:01 AM: 4
      // 1/20/2017 12:00:02 AM: 3
      // 1/20/2017 12:00:03 AM: 2
      // 1/20/2017 12:00:04 AM: 1
      //
      // 1/20/2017 12:00:04 PM: 1
      // 1/20/2017 12:00:03 PM: 2
      // 1/20/2017 12:00:02 PM: 3
      // 1/20/2017 12:00:01 PM: 4
      // 1/20/2017 12:00:00 PM: 5
```

## Compound indexes

Compound indexes are defined using the `SdsMemberAttribute` as follows:

```csharp
      public class Simple
      {
        [SdsMember(IsKey = true, Order = 0)]
        public DateTime Time { get; set; }
        public State State { get; set; }
        public Double Measurement { get; set; }
      }
    
      public class DerivedCompoundIndex : Simple
      {
        [SdsMember(IsKey = true, Order = 1)]
        public DateTime Recorded { get; set; } 
      }
```

Events of type `DerivedCompoundIndex` are sorted first by the `Time` parameter and then by the `Recorded` parameter. A collection of times would be sorted as follows:

| **Time**   | **Recorded**   | **Measurement**   |
|------------|----------------|-------------------|
| 01:00      | 00:00          | 0                 |
| 01:00      | 01:00          | 2                 |
| 01:00      | 14:00          | 5                 |
| 02:00      | 00:00          | 1                 |
| 02:00      | 01:00          | 3                 |
| 02:00      | 02:00          | 4                 |
| 02:00      | 14:00          | 6                 |

If the `Order` parameter was reversed, with `Recorded` set to 0 and `Time` set to 1, the results would be sorted as follows:

| **Time**   | **Recorded**   | **Measurement**   |
|------------|----------------|-------------------|
| 01:00      | 00:00          | 0                 |
| 02:00      | 00:00          | 1                 |
| 01:00      | 01:00          | 2                 |
| 02:00      | 01:00          | 3                 |
| 02:00      | 02:00          | 4                 |
| 01:00      | 14:00          | 5                 |
| 02:00      | 14:00          | 6                 |

```csharp
      // estimates at 1/20/2017 00:00
      await client.UpdateValuesAsync(compoundStream.Id, new List<DerivedCompoundIndex>()
        {
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 01:00"),
                Recorded = DateTime.Parse("1/20/2017 00:00"),
                State = State.Ok,
                Measurement = 0
            },
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 02:00"),
                Recorded = DateTime.Parse("1/20/2017 00:00"),
                State = State.Ok,
                Measurement = 1
            },
        });
    
      // measure and estimates at 1/20/2017 01:00
      await client.UpdateValuesAsync(compoundStream.Id, new List<DerivedCompoundIndex>()
        {
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 01:00"),
                Recorded = DateTime.Parse("1/20/2017 01:00"),
                State = State.Ok,
                Measurement = 2
            },
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 02:00"),
                Recorded = DateTime.Parse("1/20/2017 01:00"),
                State = State.Ok,
                Measurement = 3
            },
        });
    
      // measure at 1/20/2017 02:00
      await client.UpdateValuesAsync(compoundStream.Id, new List<DerivedCompoundIndex>()
        {
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 02:00"),
                Recorded = DateTime.Parse("1/20/2017 02:00"),
                State = State.Ok,
                Measurement = 4
            },
        });
    
      // adjust earlier values at 1/20/2017 14:00
      await client.UpdateValuesAsync(compoundStream.Id, new List<DerivedCompoundIndex>()
        {
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 01:00"),
                Recorded = DateTime.Parse("1/20/2017 14:00"),
                State = State.Ok,
                Measurement = 5
            },
            new DerivedCompoundIndex()
            {
                Time = DateTime.Parse("1/20/2017 02:00"),
                Recorded = DateTime.Parse("1/20/2017 14:00"),
                State = State.Ok,
                Measurement = 6
            },
        });
    
      var from = new Tuple<DateTime, DateTime>(DateTime.Parse("1/20/2017 01:00"), DateTime.Parse("1/20/2017 00:00"));
      var to = new Tuple<DateTime, DateTime>(DateTime.Parse("1/20/2017 02:00"), DateTime.Parse("1/20/2017 14:00"));
    
      var compoundValues = await client.GetWindowValuesAsync<DerivedCompoundIndex, DateTime, DateTime>(compoundStream.Id, from, to);
    
      foreach (DerivedCompoundIndex value in compoundValues)
         Console.WriteLine("{0}:{1} {2}", value.Time, value.Recorded, value.Measurement);
    
      // Output:
      // 1/20/2017 1:00:00 AM:1/20/2017 12:00:00 AM 0
      // 1/20/2017 1:00:00 AM:1/20/2017 1:00:00 AM 2
      // 1/20/2017 1:00:00 AM:1/20/2017 2:00:00 PM 5
      // 1/20/2017 2:00:00 AM:1/20/2017 12:00:00 AM 1
      // 1/20/2017 2:00:00 AM:1/20/2017 1:00:00 AM 3
      // 1/20/2017 2:00:00 AM:1/20/2017 2:00:00 AM 4
      // 1/20/2017 2:00:00 AM:1/20/2017 2:00:00 PM 6
```

**Note:** The `GetWindowValuesAsync()` call specifies an expected return type and the index types as generic parameters.
