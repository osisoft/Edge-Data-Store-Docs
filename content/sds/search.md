---
uid: sdsSearching
---

# Search in SDS

Search text and fields across the Sequential Data Store to locate data. Search functionality for SdsStreams, SdsTypes, and SdsStreamViews is exposed through the REST API. The query syntax and the request parameters are the same; only the searchable properties are different.

Use the REST API to search SdsStreams, SdsTypes, and SdsStreamViews by specifying the optional `query` parameter, as shown in the following examples:

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams?query={query}&skip={skip}&count={count}
```

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Types?query={query}&skip={skip}&count={count}
```

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews?query={query}&skip={skip}&count={count}
```

## Search properties for SdsStreams

The searchable properties for SdsStreams are shown in the following table.

| Property          | Searchable  |
|-------------------|-------------|
| `Id`                | Yes         |
| `TypeId`            | Yes         |
| `Name`              | Yes         |
| `Description`       | Yes         |
| `Indexes`           | No          |
| `InterpolationMode` | No          |
| `ExtrapolationMode` | No          |
| `PropertyOverrides` | No          |

The Stream fields valid for search are identified in the fields table located on the [Streams](xref:sdsStreams) page. 

## Search properties for SdsTypes

Searchable properties for SdsTypes are shown in the following table. 

| Property          | Searchable |
|-------------------|------------|
| `Id`                | Yes        |
| `Name`              | Yes        |
| `Description`       | Yes        |
| `SdsTypeCode`       | No         |
| `InterpolationMode` | No         |
| `ExtrapolationMode` | No         |
| `Properties`        | Yes, with limitations |

The Type fields valid for search are identified in the fields table located on the [Types](xref:sdsTypes) page. The Properties field is searchable with limitations because each SdsTypeProperty of a given SdsType has its name and Id included in the Properties field. This includes nested SdsTypes of the given SdsType. Therefore, the searching of properties will distinguish SdsTypes by their respective lists of relevant SdsTypeProperty Ids and names.

## Search properties for SdsStreamViews

The searchable properties for SdsStreamViews are shown in the following table.

| Property     | Searchable |
|--------------|------------|
| `Id`           | Yes        |
| `Name`         | Yes        |
| `Description`  | Yes        |
| `SourceTypeId` | Yes        |
| `TargetTypeId` | Yes        |
| `Properties`   | Yes, with limitations |

The Stream View fields valid for search are identified in the fields table located on the [Stream views](xref:sdsStreamViews) page. The Properties field is searchable with limitations because SdsStreamViewProperty objects are not searchable. Only the SdsStreamViewProperty's SdsStreamView is searchable by Id, SourceTypeId, and TargetTypeId, which are used to return the top-level SdsStreamView object. This includes nested SdsStreamViewProperties.

## Search operation

By default, the search operation compares all searchable fields of the search objects to the query parameter specified. When a match is found, the searchable object is included in the search results.

For example, if a namespace contains the following streams:

streamId | Name  | Description
------------ | --------- | ----------------
stream1      | tempA     | The temperature from DeviceA
stream2      | pressureA | The pressure from DeviceA
stream3      | calcA     | calculation from DeviceA values

Using the stream data above, the following table shows the results of a call to get streams with different `Query` values:

QueryString      | Streams returned
------------------  | ----------------------------------------
`temperature`     | Only stream1 returned.
`calc*`           | Only stream3 returned.
`DeviceA*`        | All three streams returned.
`humidity*`       | No streams returned.

## Additional search parameters

Additional search parameters are used to manage large numbers of search results or to focus the results of the search. Additional search parameters are:

- `skip`

- `count`

- `orderby`

The `skip` and `count` parameters determine which items are returned when a large number of them match the `query` criteria. `count` indicates the maximum number of items returned. The maximum value of the `count` parameter is 1000. `skip` indicates the number of matched items to skip over before returning matching items. Use the skip parameter when more items match the search criteria than can be returned in a single call.

The `orderby` parameter returns the search result in sorted order and is supported for searching both streams and types. By default, the `orderby` parameter sorts results in ascending order. Specify `desc` after the orderby field value to change to descending order. It can be used in conjunction with `query`, `skip`, and `count` parameters.

The following examples show various ways to use the `orderby` parameter.

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=name

GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=id asc

GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=name desc

GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure&orderby=name desc&skip=10&count=20
```
