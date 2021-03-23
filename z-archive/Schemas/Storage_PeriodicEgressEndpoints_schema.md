---
uid: storage_PeriodicEgressEndpoints_schema
---

# Sample periodic egress configuration

```json
[{
        "Id": "OCS Data",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "default",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<OCS OMF endpoint>",
        "ClientId": "<clientid>",
        "ClientSecret": "<clientsecret>",
        "UserName": null,
        "Password": null,
        "DebugExpiration": null,
        "TokenEndpoint": null,
        "ValidateEndpointCertificate": true
    },
    {
        "Id": "PI Web API Data",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "default",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<yourserver>/piwebapi/omf/",
        "ClientId": null,
        "ClientSecret": null,
        "UserName": "<username>",
        "Password": "<password>",
        "DebugExpiration": null,
        "TokenEndpoint": null,
        "ValidateEndpointCertificate": true
    },
    {
        "Id": "OCS Diagnostics",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "diagnostics",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<OCS OMF endpoint>",
        "ClientId": "<clientid>",
        "ClientSecret": "<clientsecret>",
        "UserName": null,
        "Password": null,
        "DebugExpiration": null,
        "TokenEndpoint": null,
        "ValidateEndpointCertificate": true
    },
    {
        "Id": "PI Web API Diagnostics",
        "ExecutionPeriod": "00:00:50",
        "Name": null,
        "NamespaceId": "diagnostics",
        "Description": null,
        "Enabled": true,
        "Backfill": false,
        "EgressFilter": "",
        "StreamPrefix": "<makeunique>",
        "TypePrefix": "<makeunique>",
        "Endpoint": "https://<yourserver>/piwebapi/omf/",
        "ClientId": null,
        "ClientSecret": null,
        "UserName": "<username>",
        "Password": "<password>",
        "DebugExpiration": null,
        "TokenEndpoint": null,
        "ValidateEndpointCertificate": true
    }
]
```

## Periodic egress configuration properties

| Property                            | Type      | Required     | Nullable | Defined by                                |
| ----------------------------------- | --------- | ------------ | -------- | ----------------------------------------- |
| Backfill               | `boolean` | Optional     | No       | PeriodicEgressConfiguration (this schema) |
| ClientId               | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| ClientSecret      | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| DebugExpiration | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| Description         | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| EgressFilter       | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| Enabled                | `boolean` | Optional     | No       | PeriodicEgressConfiguration (this schema) |
| Endpoint             | `string`  | **Required** | No       | PeriodicEgressConfiguration (this schema) |
| ExecutionPeriod | `string`  | **Required** | No       | PeriodicEgressConfiguration (this schema) |
| Id                          | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| Name                      | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| NamespaceId        | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| Password             | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| StreamPrefix      | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| TokenEndpoint     | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| TypePrefix           | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| UserName             | `string`  | Optional     | Yes      | PeriodicEgressConfiguration (this schema) |
| ValidateEndpointCertificate | `boolean` | Optional | No | PeriodicEgressConfiguration (this schema) |


**Note:** All of the following _requirements_ need to be fulfilled.

### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

### Requirement 2

`object` with following properties:

| Property                      | Type    | Required     |
| ----------------------------- | ------- | ------------ |
| `Backfill`                    | boolean | Optional     |
| `ClientId`                    | string  | Optional     |
| `ClientSecret`                | string  | Optional     |
| `DebugExpiration`             | string  | Optional     |
| `Description`                 | string  | Optional     |
| `EgressFilter`                | string  | Optional     |
| `Enabled`                     | boolean | Optional     |
| `Endpoint`                    | string  | **Required** |
| `ExecutionPeriod`             | string  | **Required** |
| `Id`                          | string  | Optional     |
| `Name`                        | string  | Optional     |
| `NamespaceId`                 | string  | Optional     |
| `Password`                    | string  | Optional     |
| `StreamPrefix`                | string  | Optional     |
| `TokenEndpoint`               | string  | Optional     |
| `TypePrefix`                  | string  | Optional     |
| `UserName`                    | string  | Optional     |
| `ValidateEndpointCertificate` | boolean | Optional     |
