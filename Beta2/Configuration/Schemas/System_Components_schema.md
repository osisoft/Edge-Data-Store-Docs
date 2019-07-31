---
uid: system_Components_schema
---

# Sample Edge System components configuration

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

# Edge System components schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                                     |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [System_Components_schema.json](System_Components_schema.json) |

# EdgeSystemConfig definitions

| Property                        | Type     | Group                               |
| ------------------------------- | -------- | ----------------------------------- |
| [ComponentId](#componentid)     | `string` | `#/definitions/EdgeComponentConfig` |
| [ComponentType](#componenttype) | `string` | `#/definitions/EdgeComponentConfig` |

## ComponentId

`ComponentId`

- is optional
- type: `string`
- defined in this schema

### ComponentId type

`string`, nullable

## ComponentType

`ComponentType`

- is optional
- type: `string`
- defined in this schema

### ComponentType type

`string`, nullable

# EdgeSystemConfig properties

| Property                                            | Type      | Required | Nullable | Defined by                     |
| --------------------------------------------------- | --------- | -------- | -------- | ------------------------------ |
| [ComponentConfigurations](#componentconfigurations) | reference | Optional | Yes      | EdgeSystemConfig (this schema) |

## ComponentConfigurations

`ComponentConfigurations`

- is optional
- type: reference
- defined in this schema

### ComponentConfigurations type

Array type: reference

All items must be of the type:

- []() – `#/definitions/EdgeComponentConfig`

**All** of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property                  | Type  | Required |
| ------------------------- | ----- | -------- |
| `ComponentConfigurations` | array | Optional |

#### ComponentConfigurations

`ComponentConfigurations`

- is optional
- type: reference

##### ComponentConfigurations type

Array type: reference

All items must be of the type:

- []() – `#/definitions/EdgeComponentConfig`
