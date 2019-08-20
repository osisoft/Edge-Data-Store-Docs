---
uid: sdsStreamViews
---

# Stream Views

An SdsStreamView provides a way to map Stream data requests from one data type to another. You can apply a Stream View to any read or GET operation. SdsStreamView is used to specify the mapping between source and target types.

SDS attempts to determine how to map Properties from the source to the destination. When the mapping is straightforward, such as when the properties are in the same position and of the same data type, or when the properties have the same name, SDS will map the properties automatically.

When SDS is unable to determine how to map a source property, the property is removed. If SDS encounters a target property that it cannot map to, the property is added and configured with a default value.

To map a property that is beyond the ability of SDS to map on its own, you should define an SdsStreamViewProperty and add it to the SdsStreamView’s Properties collection.

The following table shows the required and optional SdsStreamView fields. Fields that are not included are reserved for internal SDS use. For more information on search limitations, see [Searching](xref:sdsSearching).

| Property     | Type                   | Optionality | Searchability | Details |
|--------------|------------------------|-------------|------------|---------|
| Id           | String                 | Required    | Yes        |Identifier for referencing the stream view |
| Name         | String                 | Optional    | Yes        |Friendly name |
| Description  | String                 | Optional    | Yes        |Description text |
| SourceTypeId | String                 | Required    | Yes        |Identifier of the SdsType of the SdsStream |
| TargetTypeId | String                 | Required    | Yes        |Identifier of the SdsType to convert events to |
| Properties   | IList\<SdsStreamViewProperty\> | Optional    | Yes, with limitations  |Property level mapping |

**Rules for the Stream View Identifier (SdsStreamView.Id)**

1. Is not case sensitive
2. Can contain spaces
3. Cannot contain forward slash ("/")
4. Can contain a maximum of 100 characters

## Properties / SdsStreamViewProperty

The SdsStreamView Properties collection provides detailed instructions for specifying the mapping of event properties. Each SdsStreamViewProperty in the properties collection defines the mapping of an event’s property. SdsStreamView properties are required only when property mapping is not straightforward. Additionally, if you do not want a type property mapped, it is not necessary to create an SdsStreamView property for it.

The following table shows the required and optional SdsStreamViewProperty fields.

| Property | Type    | Optionality | Details |
|----------|---------|-------------|---------|
| SourceId | String  | Required    | Identifier of the SdsTypeProperty from the source SdsType Properties list |
| TargetId | String  | Required    | Identifier of the SdsTypeProperty from the target SdsType Properties list |
| SdsStreamView  | SdsStreamView | Optional    | Additional mapping instructions for derived types |

The SdsStreamView field supports nested Properties.

## SdsStreamViewMap

When an SdsStreamView is added, SDS defines a plan mapping. Plan details are retrieved as an SdsStreamViewMap. The SdsStreamViewMap provides a detailed Property-by-Property definition of the mapping.

The following table shows the SdsStreamViewMap fields. The SdsStreamViewMap cannot be written to SDS, so required and optional have no meaning.

| Property     | Type                     | Optionality  | Details |
|--------------|--------------------------|--------------|---------|
| SourceTypeId | String                   | Required     | Identifier of the SdsType of the SdsStream |
| TargetTypeId | String                   | Required     | Identifier of the SdsType to convert events to |
| Properties   | IList\<SdsStreamViewMapProperty\>| Optional     | Property level mapping |

### Properties / SdsStreamViewMapProperty

The SdsStreamViewMapProperty is similar an SdsStreamViewProperty but adds a Mode detailing one or more actions taken on
the property.

The following table shows the SdsStreamViewMapProperty fields. The SdsStreamViewMap cannot be written; it can only be
retrieved from SDS, so required and optional have no meaning.

| Property     | Type        | Details |
|--------------|-------------|---------|
| SourceTypeId | String      | Identifier of the SdsType of the SdsStream |
| TargetTypeId | String      | Identifier of the SdsType to convert events to |
| Mode         | SdsStreamViewMode | Aggregate of actions applied to the properties. SdsStreamViewModes are combined via binary arithmetic |
| SdsStreamViewMap   | SdsStreamViewMap  | Mapping for derived types |

The available SdsStreamViewModes are shown in the following table.

| Name                   | Value  | Description |
|------------------------|--------|-------------|
| None                   | 0x0000 | No action   |
| FieldAdd               | 0x0001 | Add a property matching the specified SdsTypeProperty |
| FieldRemove            | 0x0002 | Remove the property matching the specified SdsTypeProperty |
| FieldRename            | 0x0004 | Rename the property matching the source SdsTypeProperty to the target SdsTypeProperty |
| FieldMove              | 0x0008 | Move the property from the location in the source to the location in the target|
| FieldConversion        | 0x0016 | Converts the source property to the target type |
| InvalidFieldConversion | 0x0032 | Cannot perform the specified mapping |

## Changing Stream Type

Stream Views can be used to change the Type defining a Stream. You cannot modify the SdsType; types are immutable. But you can map a stream from its current type to a new type.

To update a Stream's Type, define an SdsStreamView and PUT the stream view to the following:

```text
PUT api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Type?streamViewId={streamViewId}
```

For details, see [Update Stream Type](xref:sdsStreams-update-stream-type).

## Working with SdsStreamViews

When working with Stream Views either invoke HTTP directly or use some of the sample code. Both Python and JavaScript samples have SdsStreamView definitions.

The JSON for a simple mapping between a source type with identifier Sample and a target type with identifier Sample1 would appear as follows.

```json
{  
  "Id":"StreamView",
  "Name":"StreamView",
  "SourceTypeId":"Simple",
  "TargetTypeId":"Simple1"
}
```

The SdsStreamViewMap would appear as follows.

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

# SdsStreamView API

The REST APIs provide programmatic access to read and write SDS data. The APIs in this section interact with SdsStreamViews. See [Stream Views](#stream-views) for general SdsStreamView information.
*****

## `Get Stream View`

Returns the stream view corresponding to the specified streamViewId within a given namespace.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}
```

**Parameters**  
``string namespaceId``  
default or diagnostics

`string streamViewId`  
The stream view identifier  

**Response**  
The response includes a status code and a response body.

**Response body**  
The requested SdsStreamView.

Example response body:

```json
HTTP/1.1 200
Content-Type: application/json
{  
   "Id":"StreamView",
   "Name":"StreamView",
   "SourceTypeId":"Simple",
   "TargetTypeId":"Simple3",
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
         "TargetId":"Value"
      }
   ]
}
```

*****

## `Get Stream View Map`

Returns the stream view map corresponding to the specified streamViewId within a given namespace.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}/Map
```

**Parameters**  
``string namespaceId``  
default or diagnostics

`string streamViewId`  
The stream view identifier  

**Response**  
 The response includes a status code and a response body.

**Response body**  
The requested SdsStreamView.

Example response body:

```json
HTTP/1.1 200
Content-Type: application/json

{  
   "SourceTypeId":"Simple",
   "TargetTypeId":"Simple3",
   "Properties":[  
      {  
         "SourceId":"Time",
         "TargetId":"Time"
      },
      {  
         "SourceId":"Measurement",
         "TargetId":"Value",
         "Mode":20
      },
      {  
         "SourceId":"State",
         "Mode":2
      },
      {  
         "TargetId":"State",
         "Mode":1
      }
   ]
}
```

*****

## `Get Stream Views`

Returns a list of stream views within a given namespace.

If specifying the optional search query parameter, the list of stream views returned will match
the search criteria. If the search query parameter is not specified, the list will include
all stream views in the Namespace. See [Searching](xref:sdsSearching) for information about specifying those respective parameters.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews?query={query}&skip={skip}&count={count}&orderby={orderby}
```

**Parameters**  
``string namespaceId``  
default or diagnostics

`string query`  
An optional parameter representing a string search. For information about specifying the search parameter, see [Searching](xref:sdsSearching).

`int skip`  
An optional parameter representing the zero-based offset of the first SdsStreamView to retrieve. If not specified, a default value of 0 is used.

`int count`  
An optional parameter representing the maximum number of SdsStreamViews to retrieve. If not specified, a default value of 100 is used.

`string orderby`  
An optional parameter representing sorted order which SdsStreamViews will be returned. A field name is required. The sorting is based   on the stored values for the given field (of type string). For example, ``orderby=name`` would sort the returned results by the ``name`` values (ascending by default). Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by using values ``asc`` or ``desc``, respectively. For example, ``orderby=name desc`` would sort the returned results by the ``name`` values, descending. If no value is specified, there is no sorting of results.

**Response**  
The response includes a status code and a response body.

**Response body**  
A collection of zero or more SdsStreamViews.

Example response body:

```json
HTTP/1.1 200
Content-Type: application/json
[  
  {  
     "Id":"StreamView",
     "Name":"StreamView",
     "SourceTypeId":"Simple",
     "TargetTypeId":"Simple3"
  },
  {  
     "Id":"StreamViewWithProperties",
     "Name":"StreamViewWithProperties",
     "SourceTypeId":"Simple",
     "TargetTypeId":"Simple3",
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
           "TargetId":"Value"
        }
     ]
  }
]
```

*****

## `Get or Create Stream View`

If a stream view with a matching identifier already exists, the stream view passed in is compared with the existing stream view. If the stream views are identical, a Found (302) status is returned and the stream view. If the stream views are different, the Conflict (409) error is returned.

If no matching identifier is found, the specified stream view is created.

**Request**

```text
POST api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}
```

**Parameters**  
``string namespaceId``  
default or diagnostics

`string streamViewId`  
The stream view identifier. The identifier must match the ``SdsStreamView.Id`` field.

**Request body**  
The request content is the serialized SdsStreamView.

**Response**  
The response includes a status code and a response body.

**Response body**  
The newly created or matching SdsStreamView.
*****

## `Create or Update Stream View`

Creates or updates the definition of a stream view.

**Request**

```text
PUT api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}
```

**Parameters**  
``string namespaceId``  
default or diagnostics

`string streamViewId`  
The stream view identifier

**Request body**  
The request content is the serialized SdsStreamView.

**Response**  
The response includes a status code and a response body.

**Response body**  
The newly created or updated SdsStreamView.
*****

## `Delete Stream View`

Deletes a stream view from the specified tenant and namespace.

**Request**

```text
DELETE api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}
```

**Parameters**  
``string namespaceId``  
default or diagnostics

`string streamViewId`  
The stream view identifier

**Response**  
The response includes a status code.
*****
