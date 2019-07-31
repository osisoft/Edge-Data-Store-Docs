---
uid: egress
---

# Egress from Edge System

Edge System provides an egress mechanism to copy and transfer data to another device or destination. Data is transferred through OMF. Supported destinations are OSIsoft Cloud Services or a PI server.

Configuration of egress includes specifying zero or more endpoints. An egress endpoint represents a destination to which data will be sent. Each egress endpoint is comprised of the properties specified in the [Parameters](#Parameters) section, is executed independently of all other egress endpoints, and is expected to accept OMF messages. More than one endpoint for the same destination is allowed. 

> **Note:** Some types, and consequently containers and data, cannot be egressed. See [Egress Execution Details](#egress-execution-details) for more inforamtion.

## Configuration

### Procedure

> **Note:** You cannot add egress configurations manually, because some parameters are stored to disk encrypted. You must use the REST endpoints to add/edit egress configuration. See [REST Urls](#rest-urls) for additional endpoints.

Complete the following to create new egress endpoints:

1. Using any text editor, create a file that contains one or more egress endpoints in JSON form
    - See [Examples](#Examples) section below for content structure
    - See [Parameters](#Parameters) section below for a table of all available egress parameters
2. Save the file.
3. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/storage/periodicegressendpoints/`
    - Example using cURL:

        ```bash
        curl -v -d "@Storage_PeriodicEgressEndspoints.config.json" -H "Content-Type: application/json" -X POST "http://localhost:5590/api/v1/configuration/storage/periodicegressendpoints"
        ```

### Parameters

| Parameter           | Required                  | Type      | Description                                        |
|---------------------|---------------------------|-----------|----------------------------------------------------|
| **Id**              | Required                  | string    | Unique identifier |
| **ExecutionPeriod** | Required                  | string    | Frequency of time between each egress action. Must be a string in the following format d.hh:mm:ss.## |
| **Endpoint**        | Required                  | string    | Destination that accepts OMF v1.1 messages. Supported destinations include OCS and PI. |
| **ClientId**        | Required for OCS endpoint | string    | Used for authentication with the OCS OMF endpoint. |
| **ClientSecret**    | Required for OCS endpoint | string    | Used for authentication with the OCS OMF endpoint. |
| **Username**        | Required for PI endpoint  | string    | Used for Basic authentication to the PI Web API OMF endpoint. |
| **Password**        | Required for PI endpoint  | string    | Used for Basic authentication to the PI Web API OMF endpoint. |
| **Name**            | Optional                  | string    | Friendly name |
| **Description**     | Optional                  | string    | Friendly description |
| **Enabled**         | Optional                  | bool      | An indicator of whether egress is enabled when the egress endpoint is loaded. Defaults to true. |
| **Backfill**        | Optional                  | bool      | An indicator of whether data should be backfilled. Backfilling will occur when the egress endpoint is run for the first time after application startup. Enabling backfilling will result in all data from the earliest index to the latest stored index being egressed, after applying the egress filter. Defaults to false. |
| **EgressFilter**    | Optional                  | string    | A filter used to determine which streams and types are egressed. See [Searching](../Sds/Searching.md) for more information on valid filters. |
| **StreamPrefix**    | Optional                  | string    | Prefix applied to any streams that are egressed. A null string or a string containing only empty spaces will be ignored. The following restricted characters will not be allowed: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % | < > { } ` " |
| **TypePrefix**      | Optional                  | string    | Prefix applied to any types that are egressed. A null string or a string containing only empty spaces will be ignored. The following restricted characters will not be allowed: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % | < > { } ` " |
| **DebugExpiration** | Optional                  | string    | A property that enables persistence of detailed information, for each outbound HTTP request pertaining to this egress endpoint, to disk. The value of this property represents the date and time this detailed information should stop being persisted. See [Troubleshooting](../Troubleshooting/Troubleshooting.md) for more information. |
| **NamespaceId**     | Optional                  | string    | Represents the namespace that will be egressed. There are two available namespaces: default; diagnostics. Default namespace is “default”. |

### Examples

Find various examples below of valid egress configurations.

**Egress data to OCS. All streams, every 15 seconds.**

```json
[{
    "Id": "OCS",
    "ExecutionPeriod" : "00:00:15",
    "Endpoint" : " https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
    "ClientId" : "{clientId}",
    "ClientSecret" : "{clientSecret}"
}]
```

**Egress data to OCS - streams with a specific TypeId value, every 15 seconds.**

```json
[{
    "Id": "OCS",
    "ExecutionPeriod" : "00:00:15",
    "EgressFilter" : "TypeId:myType",
    "Endpoint" : " https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
    "ClientId" : "{clientId}",
    "ClientSecret" : "{clientSecret}"
}]
```

**Egress data to OCS - all streams, every 15 seconds, including backfilling which occurs on first run or restart.**

```json
[{
    "Id": "OCS",
    "ExecutionPeriod" : "00:00:15",
    "Backfill" : true,
    "Endpoint" : " https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
    "ClientId" : "{clientId}",
    "ClientSecret" : "{clientSecret}"
}]
```

**Egress diagnostic data to OCS - every 1 hour.**

```json
[{
    "Id": "OCS",
    "ExecutionPeriod" : "01:00:00",
    "Endpoint" : " https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
    "ClientId" : "{clientId}",
    "ClientSecret" : "{clientSecret}",
    "NamespaceId" : "diagnostics"
}]
```

**Egress data to PI - all streams, every 15 seconds, including both type and stream prefix. All properties explicitly listed.**

```json
[{
    "Id": "PI",
    "Name" : null,
    "Description" : null,
    "ExecutionPeriod" : "00:00:15",
    "Enabled" : true,
    "Backfill" : false,
    "EgressFilter" : null,
    "Endpoint" : "https://{webApiLocation}/piwebapi/omf/",
    "ClientId" : null,
    "ClientSecret" : null,
    "Username" : "{username}",
    "Password" : "{password}",
    "StreamPrefix" : "1ValidPrefix.",
    "TypePrefix" : "AlsoValid_",
    "DebugExpiration" : null,
    "NamespaceId" : "default"
}]
```

**Egress data to PI - streams whose Id contains "Modbus" or "Opc", every 1 minute.**

```json
[{
    "Id": "PI",
    "ExecutionPeriod" : "00:01:00",
    "EgressFilter" : "Id:*Modbus* OR Id:*Opc*",
    "Endpoint" : "https://{webApiLocation}/piwebapi/omf/",
    "Username" : "{username}",
    "Password" : "{password}"
}]
```

**Egress data to PI - streams containing a field that begins with "Unique", every 1 hour.**

```json
[{
    "Id": "PI",
    "ExecutionPeriod" : "01:00:00",
    "EgressFilter" : "Unique*",
    "Endpoint" : "https://{webApiLocation}/piwebapi/omf/",
    "Username" : "{username}",
    "Password" : "{password}"
}]
```

### REST URLs

| Relative URL                                              | HTTP verb | Action               |
|-----------------------------------------------------------|-----------|----------------------|
| api/v1/configuration/storage/periodicegressendpoints      | GET       | Gets all configured egress endpoints |
| api/v1/configuration/storage/periodicegressendpoints      | DELETE    | Deletes all configured egress endpoints |
| api/v1/configuration/storage/periodicegressendpoints      | POST      | Add an array of egress endpoints, will fail if any endpoint already exists |
| api/v1/configuration/storage/periodicegressendpoints      | POST      | Add a single egress endpoints, will fail if endpoint already exists |
| api/v1/configuration/storage/periodicegressendpoints      | PUT       | Replace all egress endpoints |
| api/v1/configuration/storage/periodicegressendpoints/{id} | GET       | Get configured endpoint with *id* |
| api/v1/configuration/storage/periodicegressendpoints/{id} | DELETE    | Delete configured endpoint with *id* |
| api/v1/configuration/storage/periodicegressendpoints/{id} | PUT       | Replace egress endpoint with *id*, will fail if endpoint doesn't exist |
| api/v1/configuration/storage/periodicegressendpoints/{id} | PATCH     | Allows partial updating of configured endpoint with *id* |

## Egress execution details

After configuration for an egress endpoint is added, egress execution will periodically occur for that endpoint. Egress is handled individually per configured endpoint. On the first execution types and containers will be egressed; subsequently only new or changed types/containers will be egressed. Only streams with a single, timeseries-based index can be egressed; a single HTTP request is made per type and container.  Type creation must be successful in order to perform container creation; likewise container creation must be successful in order to perform data egress. A failed creation will result in a 5 minute wait before re-attempting egress. 

**Note**  Type and container creation succeed or fail as a whole (e.g. if a single type fails to be created then type creation is considered to have failed). Data egress, however, is performed independently for each stream.

For data collection and egress, in-memory and on-disk storage are used to track the last successfully-egressed data event, per stream. Batches of 200 events are egressed at a time (per HTTP request). Data is egressed in order and includes events in the future. 

**Note**  When an event with a future timestamp is successfully egressed, only values after the associated timestamp of that event will be egressed.
