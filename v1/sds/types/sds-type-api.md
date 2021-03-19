---
uid: sdsTypeAPI
---

# SdsType API

The REST APIs provide programmatic access to read and write SDS data. The following APIs interact with SdsTypes. See [Types](xref:sdsTypes) for general SdsType information.
*****

## `Get Type`

Returns the type corresponding to the specified typeId within a given namespace.

**Request**
  
```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Types/{typeId}
```

**Parameters**  
``string namespaceId``  
The namespace; either default or diagnostics.

`string typeId`  
The type identifier.

**Response**  
The response includes a status code and a response body.

**Response body**  
The requested SdsType.

Example response body:

```json
HTTP/1.1 200
Content-Type: application/json

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
                "Id": "19a87a76-614a-385b-ba48-6f8b30ff6ab2",
                "Name": "DateTime",
                "SdsTypeCode": 16
            }
        },
        {
            "Id": "State",
            "Name": "State",
            "SdsType": {
                "Id": "e20bdd7e-590b-3372-ab39-ff61950fb4f3",
                "Name": "State",
                "SdsTypeCode": 609,
                "Properties": [
                    {
                        "Id": "Ok",
                        "Value": 0
                    },
                    {
                        "Id": "Warning",
                        "Value": 1
                    },
                    {
                        "Id": "Alarm",
                        "Value": 2
                    }
                ]
            }
        },
        {
            "Id": "Measurement",
            "Name": "Measurement",
            "SdsType": {
                "Id": "6fecef77-20b1-37ae-aa3b-e6bb838d5a86",
                "Name": "Double",
                "SdsTypeCode": 14
            }
        }
    ]
}
```

*****

## `Get Type Reference Count`

Returns a dictionary mapping the object name to the number of references held by streams, stream views, and parent types for the specified type. For more information on the use of types to define streams and stream views, see [Streams](xref:sdsStreams) and [Stream views](xref:sdsStreamViews). For further details about type referencing, see [Type reusability](xref:sdsTypeReusability).

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Types/{typeId}/ReferenceCount
```

**Parameters**  
``string namespaceId``  
The namespace; either default or diagnostics.

`string typeId`  
The type identifier.

**Response**  
The response includes a status code and a response body.

**Response body**  
A dictionary mapping object name to number of references.

Example response body:

```json
    {
        "SdsStream": 3,
        "SdsStreamView": 2,
        "SdsType": 1
    }
```

*****

## `Get Types`

Returns a list of types within a given namespace.

If you specify the optional search query parameter, the list of types returned will match the search criteria. If you do not specify the search query parameter, the list will include all types in the namespace. For information about specifying those respective parameters, see [Search in SDS](xref:sdsSearching).

**Note:** The results will also include types that were automatically created by SDS as a result of type referencing. For further details about type referencing, see [Type reusability](xref:sdsTypeReusability).

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Types?query={query}&skip={skip}&count={count}&orderby={orderby}
```

**Parameters**  
``string namespaceId``  
The namespace; either default or diagnostics.

`string query`  
An optional query string to match which SdsTypes will be returned. For information about specifying the query parameter, see [Search in SDS](xref:sdsSearching).

`int skip`  
An optional value representing the zero-based offset of the first SdsType to retrieve. If not specified, a default value of 0 is used.

`int count`  
An optional value representing the maximum number of SdsTypes to retrieve. If not specified, a default value of 100 is used.

`string orderby`  
An optional parameter representing sorted order which SdsTypes will be returned. A field name is required. The sorting is based on the stored values for the given field (of type string). For example, ``orderby=name`` would sort the returned results by the ``name`` values (ascending by default). Additionally, a value can be provided along with the field name to identify whether to sort ascending or descending, by using values ``asc`` or ``desc``, respectively. For example, ``orderby=name desc`` would sort the returned results by the ``name`` values, descending. If no value is specified, there is no sorting of results.

**Response**  
The response includes a status code and a response body.

**Response body**  
A collection of zero or more SdsTypes.

Example response body:

```json
HTTP/1.1 200
Content-Type: application/json

[
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
                    "Id": "19a87a76-614a-385b-ba48-6f8b30ff6ab2",
                    "Name": "DateTime",
                    "SdsTypeCode": 16
                }
            },
            {
                "Id": "State",
                "Name": "State",
                "SdsType": {
                    "Id": "e20bdd7e-590b-3372-ab39-ff61950fb4f3",
                    "Name": "State",
                    "SdsTypeCode": 609,
                    "Properties": [
                        {
                            "Id": "Ok",
                            "Value": 0
                        },
                        {
                            "Id": "Warning",
                            "Value": 1
                        },
                        {
                            "Id": "Alarm",
                            "Value": 2
                        }
                    ]
                }
            },
            {
                "Id": "Measurement",
                "Name": "Measurement",
                "SdsType": {
                    "Id": "6fecef77-20b1-37ae-aa3b-e6bb838d5a86",
                    "Name": "Double",
                    "SdsTypeCode": 14
                }
            }
        ]
    },
]
```

*****

## `Get or Create Type`

Creates the specified type. If a type with a matching identifier already exists, SDS compares the existing type with the type that was sent.

If the types are identical, a ``Found`` (302) error is returned with the Location header set to the URI where the type may be retrieved using a Get function.

If the types do not match, a ``Conflict`` (409) error is returned. **Note:** A ``Conflict`` (409) error will also be returned if the type contains reference to any existing type, but the referenced type definition in the body does not match the existing type. You may reference an existing type without including the reference type definition in the body by using only the Ids. For further details about type referencing, see [Type reusability](xref:sdsTypeReusability).

For a matching type (``Found``), clients that are capable of performing a redirect that includes the authorization header can automatically redirect to retrieve the type. However, most clients, including the .NET HttpClient, consider redirecting with the authorization token to be a security vulnerability.

When a client performs a redirect and strips the authorization header, SDS cannot authorize the request and returns ``Unauthorized`` (401). For this reason, OSIsoft recommends that when using clients that do not redirect with the authorization header, you should disable automatic redirect and perform the redirect manually.

**Request**  

```text
POST api/v1/Tenants/default/Namespaces/{namespaceId}/Types/{typeId}
```

**Parameters**  
``string namespaceId``  
The namespace; either default or diagnostics.

`string typeId`  
The type identifier. The identifier must match the `SdsType.Id` field in the request body.

**Request body**  
The request content is the serialized SdsType.

Example SdsType content:

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
                "Id": "19a87a76-614a-385b-ba48-6f8b30ff6ab2",
                "Name": "DateTime",
                "SdsTypeCode": 16
            }
        },
        {
            "Id": "State",
            "Name": "State",
            "SdsType": {
                "Id": "e20bdd7e-590b-3372-ab39-ff61950fb4f3",
                "Name": "State",
                "SdsTypeCode": 609,
                "Properties": [
                    {
                        "Id": "Ok",
                        "Value": 0
                    },
                    {
                        "Id": "Warning",
                        "Value": 1
                    },
                    {
                        "Id": "Alarm",
                        "Value": 2
                    }
                ]
            }
        },
        {
            "Id": "Measurement",
            "Name": "Measurement",
            "SdsType": {
                "Id": "6fecef77-20b1-37ae-aa3b-e6bb838d5a86",
                "Name": "Double",
                "SdsTypeCode": 14
            }
        }
    ]
}
```

**Response**  
The response includes a status code and a response body.

**Response body**  
The request content is the serialized SdsType. OSIsoft recommends that you use JSON.

Example Response body:

```json
HTTP/1.1 201
Content-Type: application/json

{
    "Id": "Simple",
    "Name": "Simple",
    "Description": null,
    "SdsTypeCode": 1,
    "IsGenericType": false,
    "IsReferenceType": false,
    "GenericArguments": null,
    "Properties": [
        {
            "Id": "Time",
            "Name": "Time",
            "Description": null,
            "Order": 0,
            "IsKey": true,
            "FixedSize": 0,
            "SdsType": {
                "Id": "19a87a76-614a-385b-ba48-6f8b30ff6ab2",
                "Name": "DateTime",
                "Description": null,
                "SdsTypeCode": 16,
                "IsGenericType": false,
                "IsReferenceType": false,
                "GenericArguments": null,
                "Properties": null,
                "BaseType": null,
                "DerivedTypes": null,
                "InterpolationMode": 0,
                "ExtrapolationMode": 0
            },
            "Value": null,
            "Uom": null,
            "InterpolationMode": null
        },
        {
            "Id": "State",
            "Name": "State",
            "Description": null,
            "Order": 0,
            "IsKey": false,
            "FixedSize": 0,
            "SdsType": {
                "Id": "e20bdd7e-590b-3372-ab39-ff61950fb4f3",
                "Name": "State",
                "Description": null,
                "SdsTypeCode": 609,
                "IsGenericType": false,
                "IsReferenceType": false,
                "GenericArguments": null,
                "Properties": [
                    {
                        "Id": "Ok",
                        "Name": null,
                        "Description": null,
                        "Order": 0,
                        "IsKey": false,
                        "FixedSize": 0,
                        "SdsType": null,
                        "Value": 0,
                        "Uom": null,
                        "InterpolationMode": null
                    },
                    {
                        "Id": "Warning",
                        "Name": null,
                        "Description": null,
                        "Order": 0,
                        "IsKey": false,
                        "FixedSize": 0,
                        "SdsType": null,
                        "Value": 1,
                        "Uom": null,
                        "InterpolationMode": null
                    },
                    {
                        "Id": "Alarm",
                        "Name": null,
                        "Description": null,
                        "Order": 0,
                        "IsKey": false,
                        "FixedSize": 0,
                        "SdsType": null,
                        "Value": 2,
                        "Uom": null,
                        "InterpolationMode": null
                    }
                ],
                "BaseType": null,
                "DerivedTypes": null,
                "InterpolationMode": 0,
                "ExtrapolationMode": 0
            },
            "Value": null,
            "Uom": null,
            "InterpolationMode": null
        },
        {
            "Id": "Measurement",
            "Name": "Measurement",
            "Description": null,
            "Order": 0,
            "IsKey": false,
            "FixedSize": 0,
            "SdsType": {
                "Id": "6fecef77-20b1-37ae-aa3b-e6bb838d5a86",
                "Name": "Double",
                "Description": null,
                "SdsTypeCode": 14,
                "IsGenericType": false,
                "IsReferenceType": false,
                "GenericArguments": null,
                "Properties": null,
                "BaseType": null,
                "DerivedTypes": null,
                "InterpolationMode": 0,
                "ExtrapolationMode": 0
            },
            "Value": null,
            "Uom": null,
            "InterpolationMode": null
        }
    ],
    "BaseType": null,
    "DerivedTypes": null,
    "InterpolationMode": 0,
    "ExtrapolationMode": 0
}
```

*****

## `Delete Type`

Deletes a type from the specified tenant and namespace. Note that a type cannot be deleted if any streams, stream views, or other types reference it.

**Request**

```text
DELETE api/v1/Tenants/default/Namespaces/{namespaceId}/Types/{typeId}
```

**Parameters**  
``string namespaceId``  
The namespace; either default or diagnostics.

`string typeId`  
The type identifier.

**Response**  
The response includes a status code.
*****
