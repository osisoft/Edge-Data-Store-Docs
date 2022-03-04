---
uid: sdsStreamViewsAPI
---

# SdsStreamView API

The REST APIs provide programmatic access to read and write SDS data. The APIs in this section interact with SdsStreamViews. For general SdsStreamView information, see [Stream views](xref:sdsStreamViews).

## `Get Stream View`

Returns the stream view corresponding to the specified streamViewId within a given namespace.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews/{streamViewId}
```

**Parameters**  
`string namespaceId`  
The namespace; either default or diagnostics.

`string streamViewId`  
The stream view identifier.  

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
`string namespaceId`  
The namespace; either default or diagnostics.

`string streamViewId`  
The stream view identifier.  

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
all stream views in the Namespace. See [Search in SDS](xref:sdsSearching) for information about specifying those respective parameters.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/StreamViews?query={query}&skip={skip}&count={count}&orderby={orderby}
```

**Parameters**  
`string namespaceId`  
The namespace; either default or diagnostics.

`string query`  
An optional parameter representing a string search. For information about specifying the search parameter, see [Search in SDS](xref:sdsSearching).

`int skip`  
An optional parameter representing the zero-based offset of the first SdsStreamView to retrieve. If not specified, a default value of 0 is used.

`int count`  
An optional parameter representing the maximum number of SdsStreamViews to retrieve. If not specified, a default value of 100 is used.

`string orderby`  
An optional parameter representing sorted order which SdsStreamViews will be returned. A field name is required. The sorting is based   on the stored values for the given field (of type string). For example, `orderby=name` would sort the returned results by the `name` values (ascending by default). Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by using values `asc` or `desc`, respectively. For example, `orderby=name desc` would sort the returned results by the `name` values, descending. If no value is specified, there is no sorting of results.

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
`string namespaceId`  
The namespace; either default or diagnostics.

`string streamViewId`  
The stream view identifier. The identifier must match the **SdsStreamView.Id** field.

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
`string namespaceId`  
The namespace; either default or diagnostics.

`string streamViewId`  
The stream view identifier.

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
`string namespaceId`  
The namespace; either default or diagnostics.

`string streamViewId`  
The stream view identifier.

**Response**  
The response includes a status code.
