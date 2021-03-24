---
uid: SdsUOMQuantityAPI
---

# SdsUomQuantity API

The REST APIs provide programmatic access to read and write SDS data. The APIs in this section interact with SdsUomQuantitys. For more information, see [SdsUomQuantity](xref:unitsOfMeasure#sdsuomquantity).
*****

## `Get Quantity`

Returns the quantity corresponding to the specified quantity Id within a given namespace.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Quantities/{quantityId}
```

**Parameters**  
``string namespaceId``  
The namespace; either default or diagnostics.

`string quantityId`  
The quantity identifier.

**Response**  
The response includes a status code and a response body.

**Response body**  
The requested SdsUomQuantity.

Example response body for quantityId = "Length":

```json
HTTP/1.1 200
Content-Type: application/json

{
    "Id": "Length",
    "Name": "Length",
    "BaseUom": {
        "Id": "meter",
        "Abbreviation": "m",
        "Name": "meter",
        "DisplayName": "meter",
        "QuantityId": "Length",
        "ConversionFactor": 1
    },
    "Dimensions": [
        1,
        0,
        0,
        0,
        0,
        0,
        0
    ]
}
```

*****

## `Get Quantities`

Returns a list of all quantities available within a given namespace.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Quantities?skip={skip}&count={count}
```

**Parameters**  
``string namespaceId``  
The namespace; either default or diagnostics.

`int skip`  
An optional parameter representing the zero-based offset of the first SdsUomQuantity to retrieve. If not specified, a default value of 0 is used.

`int count`  
An optional parameter representing the maximum number of SdsUomQuantity to retrieve. If not specified, a default value of 100 is used.

**Response**  
The response includes a status code and a response body.

**Response body**  
A list of SdsUomQuantity objects.

Example response body:
  
```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Id": "Angular Velocity",
        "Name": "Angular Velocity",
        "BaseUom": {
            "Id": "radian per second",
            "Abbreviation": "rad/s",
            "Name": "radian per second",
            "DisplayName": "radian per second",
            "QuantityId": "Angular Velocity",
            "ConversionFactor": 1
        },
        "Dimensions": [
            0,
            0,
            -1,
            0,
            0,
            0,
            0
        ]
    },
    {
        "Id": "Area",
        "Name": "Area",
        "BaseUom": {
            "Id": "square meter",
            "Abbreviation": "m2",
            "Name": "square meter",
            "DisplayName": "square meter",
            "QuantityId": "Area",
            "ConversionFactor": 1
        },
        "Dimensions": [
            2,
            0,
            0,
            0,
            0,
            0,
            0
        ]
    },
]
```

*****

## `Get Quantity Uom`

Returns the unit of measure associated with the specified uomId belonging to the quantity with the specified quantityId.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Quantities/{quantityId}/Units/{uomId}
```

**Parameters**  
``string namespaceId``  
The namespace; either default or diagnostics.

`string quantityId`  
The quantity identifier.

`string uomId`  
The unit of measure identifier.

**Response**  
The response includes a status code and a response body.

**Response body**  
The requested SdsUom

Example response for quantityId = "Length" and uomId ="mile":

```json
HTTP/1.1 200
Content-Type: application/json

{
    "Id": "mile",
    "Abbreviation": "mi",
    "Name": "mile",
    "DisplayName": "mile",
    "QuantityId": "Length",
    "ConversionFactor": 1609.344
}
```

*****

## `Get Quantity Uoms`

Returns the list of units of measure that belongs to the quantity with the specified quantityId.

**Request**

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Quantities/{quantityId}/Units
```

**Parameters**  
``string namespaceId``  
The namespace; either default or diagnostics.

`string quantityId`  
The quantity identifier.

**Response**  
The response includes a status code and a response body.

**Response body**  
A collection of SdsUom objects for the specified quantity.

Example response for quantityId = "Electric Current":

```json
HTTP/1.1 200
Content-Type: application/json

[
    {
        "Id": "milliampere",
        "Abbreviation": "mA",
        "Name": "milliampere",
        "DisplayName": "milliampere",
        "QuantityId": "Electric Current",
        "ConversionFactor": 0.001
    },
    {
        "Id": "ampere",
        "Abbreviation": "A",
        "Name": "ampere",
        "DisplayName": "ampere",
        "QuantityId": "Electric Current",
        "ConversionFactor": 1
    }
]
```
