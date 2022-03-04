---
uid: SdsUOMAPI
---

# SdsUom API

The REST APIs provide programmatic access to read and write SDS data. The APIs in this section interact with SdsUoms. For more information, see [SdsUom](xref:unitsOfMeasure#sdsuom).

## `Get Uom`

Returns the unit of measure corresponding to the specified uomId within a given namespace.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Units/{uomId}
```

**Parameters**  
`string namespaceId`  
The namespace; either default or diagnostics.

`string uomId`  
The unit of measure identifier.

**Response**  
The response includes a status code and a response body.

**Response body**  
The requested SdsUom.

Example response body for uomId = "ounce":

```json
HTTP/1.1 200
Content-Type: application/json

{
    "Id": "ounce",
    "Abbreviation": "oz",
    "Name": "ounce",
    "DisplayName": "ounce",
    "QuantityId": "Mass",
    "ConversionFactor": 0.028349523
}
```

*****

## `Get Uoms`

Returns a list of all available units of measure in the system.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Units?skip={skip}&count={count}
```

**Parameters**  
`string namespaceId`  
The namespace; either default or diagnostics.

`int skip`  
An optional parameter representing the zero-based offset of the first SdsUomQuantity to retrieve. If not specified, a default value of 0 is used.

`int count`  
An optional parameter representing the maximum number of SdsUomQuantity to retrieve. If not specified, a default value of 100 is used.

**Response**  
The response includes a status code and a response body.

**Response body**  
A list of SdsUom objects.

Example response body:

```json
HTTP/1.1 200
Content-Type: application/json
[
    {
        "Id": "count",
        "Abbreviation": "count",
        "Name": "count",
        "DisplayName": "count",
        "QuantityId": "Quantity",
        "ConversionFactor": 1
    },
    {
        "Id": "Ampere hour",
        "Abbreviation": "Ah",
        "Name": "Ampere hour",
        "DisplayName": "Ampere hour",
        "QuantityId": "Electric Charge",
        "ConversionFactor": 3600
    },
    {
        "Id": "coulomb",
        "Abbreviation": "C",
        "Name": "coulomb",
        "DisplayName": "coulomb",
        "QuantityId": "Electric Charge",
        "ConversionFactor": 1
    }
]
```

*****

## Associate a unit of measure with an SdsType

At SdsType creation, you can associate an SdsUom with an SdsTypeProperty. For more information, see [SdsTypeProperty](xref:sdsTypeProperty).

## Associate a unit of measure with an SdsStream

At SdsStream creation, you can override any unit of measure associated with an SdsTypeProperty belonging to the SdsType of the stream. This enables the reuse of an SdsType that may have default unit information associated with it already. For more information, see [SdsStream](xref:sdsStreams).
