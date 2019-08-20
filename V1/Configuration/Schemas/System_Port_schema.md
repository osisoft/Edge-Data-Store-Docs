---
uid: system_Port_schema
---

# Sample system port configuration file

```json
{
  "Port": 5590
}
```

# System port schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                         |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [System_Port_schema.json](System_Port_schema.json) |

# PortConfiguration properties

| Property      | Type      | Required | Nullable | Defined by                      |
| ------------- | --------- | -------- | -------- | ------------------------------- |
| [Port](#port) | `integer` | Optional | No       | PortConfiguration (this schema) |

## Port

`Port`

- is optional
- type: `integer`
- defined in this schema

### Port type

`integer`

- minimum value: `1024`
- maximum value: `65535`

**All** of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property | Type    | Required |
| -------- | ------- | -------- |
| `Port`   | integer | Optional |

#### Port

`Port`

- is optional
- type: `integer`

##### Port type

`integer`

- minimum value: `1024`
- maximum value: `65535`
