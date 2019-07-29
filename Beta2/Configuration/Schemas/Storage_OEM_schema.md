---
uid: storage_OEM_schema
---

# Storage OEM configuration schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                         |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [Storage_OEM_schema.json](Storage_OEM_schema.json) |

# OEMConfiguration properties

| Property                                        | Type      | Required | Nullable | Defined by                     |
| ----------------------------------------------- | --------- | -------- | -------- | ------------------------------ |
| [CheckpointRateInSec](#checkpointrateinsec)     | `integer` | Optional | No       | OEMConfiguration (this schema) |
| [EnableTransactionLog](#enabletransactionlog)   | `boolean` | Optional | No       | OEMConfiguration (this schema) |
| [TransactionLogLimitMB](#transactionloglimitmb) | `integer` | Optional | No       | OEMConfiguration (this schema) |

## CheckpointRateInSec

`CheckpointRateInSec`

- is optional
- type: `integer`
- defined in this schema

### CheckpointRateInSec type

`integer`

- minimum value: `0`
- maximum value: `2147483647`

## EnableTransactionLog

`EnableTransactionLog`

- is optional
- type: `boolean`
- defined in this schema

### EnableTransactionLog type

`boolean`

## TransactionLogLimitMB

`TransactionLogLimitMB`

- is optional
- type: `integer`
- defined in this schema

### TransactionLogLimitMB type

`integer`

- minimum value: `1`
- maximum value: `9223372036854780000`

**All** of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property                | Type    | Required |
| ----------------------- | ------- | -------- |
| `CheckpointRateInSec`   | integer | Optional |
| `EnableTransactionLog`  | boolean | Optional |
| `TransactionLogLimitMB` | integer | Optional |

#### CheckpointRateInSec

`CheckpointRateInSec`

- is optional
- type: `integer`

##### CheckpointRateInSec type

`integer`

- minimum value: `0`
- maximum value: `2147483647`

#### EnableTransactionLog

`EnableTransactionLog`

- is optional
- type: `boolean`

##### EnableTransactionLog type

`boolean`

#### TransactionLogLimitMB

`TransactionLogLimitMB`

- is optional
- type: `integer`

##### TransactionLogLimitMB type

`integer`

- minimum value: `1`
- maximum value: `9223372036854780000`
