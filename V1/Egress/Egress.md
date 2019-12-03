---
uid: egress
---

# Data egress configuration

Edge Data Store provides an egress mechanism to copy and transfer data to another device or destination. Data is transferred through OMF. Supported destinations are OSIsoft Cloud Services or a PI Server.

Configuration of egress includes specifying zero or more endpoints. An egress endpoint represents a destination to which data will be sent. Each egress endpoint is comprised of the properties specified in the [Parameters](#parameters) section. It is executed independently of all other egress endpoints, and is expected to accept OMF messages. More than one endpoint for the same destination is allowed.

> **Note:** Some types, and consequently containers and data, cannot be egressed. For more information, see [Egress Execution Details](#egress-execution-details).

One tenant and two namespaces are supported in the Edge Data Store. The tenant is default, and the two namespaces are default (where adapter and OMF data is written) and diagnostics. Diagnostics is where the system and its components write information that can be used locally or egressed to a remote PI server or OCS for monitoring. To egress both namespaces two egress definitions are required.

## Configure data egress

Prior to configuring egress on the Edge Data Store, follow [Destination Preparation](#destination-preparation) steps to make available one or more OMF destinations.

> **Note:** You cannot add egress configurations manually, because some parameters are stored to disk encrypted. You must use the REST endpoints to add/edit egress configuration. For additional endpoints, see [REST Urls](#rest-urls).

Complete the following to create new egress endpoints:

1. Using any text editor, create a file that contains one or more egress endpoints in JSON form
    - For content structure, see the following [Examples](#examples). 
    - For a table of all available egress parameters, see [Parameters](#parameters).
2. Save the file.
3. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/storage/periodicegressendpoints/`

- Example using cURL:

```bash
curl -v -d "@Storage_PeriodicEgressEndspoints.config.json" -H "Content-Type: application/json" "http://localhost:5590/api/v1/configuration/storage/periodicegressendpoints"
```

> **Note** The @ symbol is a required prefix for the above command.

### Parameters

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **Backfill**                    | Optional                  | bool      | An indicator of whether data should be backfilled. Enabling the backfill flag will result in all data from the earliest index to the latest stored index being egressed. Backfilling occurs for each stream, including when a new stream is added. Once backfilling is complete for a stream, any out-of-order data is not egressed.  Defaults to false. |
| **ClientId**                    | Required for OCS endpoint | string    | Used for authentication with the OCS OMF endpoint. |
| **ClientSecret**                | Required for OCS endpoint | string    | Used for authentication with the OCS OMF endpoint. |
| **DebugExpiration**             | Optional                  | string    | A property that enables persistence of detailed information, for each outbound HTTP request pertaining to this egress endpoint, to disk. The value of this property represents the date and time this detailed information should stop being persisted. For more information, see [Troubleshooting](../Troubleshooting/Troubleshooting.md). |
| **Description**                 | Optional                  | string    | Friendly description |
| **EgressFilter**                | Optional                  | string    | A filter used to determine which streams and types are egressed. For more information on valid filters, see [Searching](../Sds/Searching.md). |
| **Enabled**                     | Optional                  | bool      | An indicator of whether egress is enabled when the egress endpoint is loaded. Defaults to true. |
| **Endpoint**                    | Required                  | string    | Destination that accepts OMF v1.1 messages. Supported destinations include OCS and PI. |
| **ExecutionPeriod**             | Required                  | string    | Frequency of time between each egress action. Must be a string in the following format d.hh:mm:ss.## |
| **Id**                          | Optional                  | string    | Unique identifier |
| **Name**                        | Optional                  | string    | Friendly name |
| **NamespaceId**                 | Optional                  | string    | Represents the namespace that will be egressed. There are two available namespaces: default; diagnostics. Default namespace is “default”. |
| **Password**                    | Required for PI endpoint  | string    | Used for Basic authentication to the PI Web API OMF endpoint. |
| **StreamPrefix**                | Optional                  | string    | Prefix applied to any streams that are egressed. A null string or a string containing only empty spaces will be ignored. The following restricted characters will not be allowed: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % | < > { } ` " |
| **TokenEndpoint**               | Optional for OCS endpoint | string    | Used to retrieve an OCS token from an alternative endpoint. *This is not normally necessary with OCS. Only use if directed to do so by customer support*. |
| **TypePrefix**                  | Optional                  | string    | Prefix applied to any types that are egressed. A null string or a string containing only empty spaces will be ignored. The following restricted characters will not be allowed: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % | < > { } ` " |
| **Username**                    | Required for PI endpoint  | string    | Used for Basic authentication to the PI Web API OMF endpoint. If domain is required the backslash must be escaped (i.e. *domain*\\\\*username*).  |
| **ValidateEndpointCertificate** | Optional                  | bool      | Used to disable verification of destination certificate. Use for testing only with self-signed certificates. Defaults to true. |

### Examples

The following are valid egress configuration examples.

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

**Egress data to OCS - all streams, every 15 seconds, including backfilling.**

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
    "NamespaceId" : "default",
    "TokenEndpoint" : null,
    "ValidateEndpointCertificate" : true
}]
```

**Egress data to PI - streams whose Id contains "Modbus" or "Opc", every 1 minute. Includes use of domain for username.**

```json
[{
    "Id": "PI",
    "ExecutionPeriod" : "00:01:00",
    "EgressFilter" : "Id:*Modbus* OR Id:*Opc*",
    "Endpoint" : "https://{webApiLocation}/piwebapi/omf/",
    "Username" : "{domain}\\{username}",
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
