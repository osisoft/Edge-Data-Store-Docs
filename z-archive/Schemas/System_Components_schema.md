---
uid: system_Components_schema
---

# Sample Edge Data Store components configuration

 ```json
[
  {
    "ComponentId": "OpcUa1",
    "ComponentType": "OpcUa"
  },
  {
    "ComponentId": "Modbus1",
    "ComponentType": "Modbus"
  },
  {
    "ComponentId": "Storage",
    "ComponentType": "EDS.Component"
  }
]
 ```

# Edge Data Store components configuration properties

| Property                        | Type     | Required | Nullable | Group                              |
| ------------------------------- | -------- | -------- | -------- |----------------------------------- |
| ComponentId     | `string` | Optional | Yes      |`#/definitions/EdgeComponentConfig` |
| ComponentType | `string` | Optional | Yes      |`#/definitions/EdgeComponentConfig` |


# Edge Data Store configuration properties

| Property                                            | Type      | Required | Nullable | Defined by                     |
| --------------------------------------------------- | --------- | -------- | -------- | ------------------------------ |
| ComponentConfigurations | reference <br> `#/definitions/EdgeComponentConfig` | Optional | Yes      | EdgeDataStoreConfig (this schema) |


**Note:** All of the following _requirements_ need to be fulfilled.

## Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

## Requirement 2

`object` with following properties:

| Property                  | Type  | Required |
| ------------------------- | ----- | -------- |
| `ComponentConfigurations` | reference <br> `#/definitions/EdgeComponentConfig` | Optional |
