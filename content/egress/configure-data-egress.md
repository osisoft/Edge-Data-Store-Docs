---
uid: configureEgress
---

# Configure data egress

Once the OCS or PI Server destinations are prepared to receive OMF messages, configure data egress endpoints to create the connection to the destination and specify the details of the data transfer.

**Note**: You cannot add egress configurations manually because some parameters are stored to disk encrypted. You must use the REST endpoints to add/edit egress configuration. For additional endpoints, see [REST URLs](#rest-urls).

**Warning**: If you delete or remove an egress configuration and then recreate it with `Backfill` set to `true`, duplicate data will appear on any stream that was previously egressed successfully. New streams will not see duplicate data.

## Create egress endpoints

To create new egress endpoints, follow these steps:

1. Create a JSON file containing one or more egress endpoints.

    - For content structure, see the following [Examples](#examples).

1. Update the parameters as needed. For a table of all available parameters, see [Parameters](#parameters).

1. Save the JSON file with the name `PeriodicEgressEndpoints.json` to any directory on the device where Edge Data Store is installed.

1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/storage/periodicegressendpoints/`

Example using cURL, which must be run from the directory where the JSON file is saved:

```bash
curl -d "@PeriodicEgressEndpoints.config.json" -H "Content-Type: application/json" "http://localhost:5590/api/v1/configuration/storage/periodicegressendpoints"
```

**Note**: The @ symbol is a required prefix for this command.

### Parameters

To support the reuse of common configuration blocks, EDS egress configuration is divided into four components:

* `Endpoints`: Describes the egress endpoint connectivity information

* `Schedules`: Describes the timing of data egress

* `DataSelectors`: Describes which data to egress and includes stream and data filtering

* `Egress Configuration`: Ties together the three previous components and includes settings for type and stream prefixing, backfill, and more

The following table lists egress parameters for `Endpoints`.

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **ClientId**                    | Required for OCS endpoint | string    | Used for authentication with the OCS OMF endpoint |
| **ClientSecret**                | Required for OCS endpoint | string    | Used for authentication with the OCS OMF endpoint |
| **DebugExpiration**             | Optional                  | string    | Enables logging of detailed information, for each outbound HTTP request pertaining to this egress endpoint, to disk. The value represents the date and time this detailed information should stop being saved. Examples of valid strings representing date and time:  UTC: "yyyy-mm-ddThh:mm:ssZ", Local: "mm-dd-yyyy hh:mm:ss". For more information, see [Troubleshoot Edge Data Store](xref:troubleShooting). |
| **Description**                 | Optional                  | string    | Friendly description |
| **Enabled**                     | Optional                  | Boolean      | An indicator of whether egress is enabled when the egress endpoint is loaded. Defaults to true. |
| **Endpoint**                    | Required                  | string    | Destination that accepts OMF v1.1 messages. Supported destinations include OCS and PI. |
| **Id**                          | Optional                  | string    | Unique identifier |
| **Name**                        | Optional                  | string    | Friendly name |
| **Password**                    | Required for PI endpoint  | string    | Used for Basic authentication to the PI Web API OMF endpoint |
| **TokenEndpoint**               | Optional for OCS endpoint | string    | Used to retrieve an OCS token from an alternative endpoint. *This is not normally necessary with OCS. Only use if directed to do so by customer support*. |
| **Username**                    | Required for PI endpoint  | string    | Used for Basic authentication to the PI Web API OMF endpoint. If domain is required, the backslash must be escaped (for example, *domain*\\\\*username*). |
| **ValidateEndpointCertificate** | Optional                  | Boolean   | Used to disable verification of destination certificate. Use for testing only with self-signed certificates. Defaults to true. |

The following table lists egress parameters for `Schedules`.

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **Id**                          | Optional                  | string    | Unique identifier |
| **ExecutionPeriod**             | Required                  | string    | Frequency of time between each egress action. Must be a string in the format d.hh:mm:ss.##. |

The following table lists egress parameters for `DataSelectors`.

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **Id**                          | Optional                  | string    | Unique identifier |
| **NamespaceId**                 | Optional                  | string    | Represents the namespace that will be egressed. There are two available namespaces: `default` and `diagnostics`. The default namespace is `default`. |
| **Backfill**                    | Optional                  | Boolean   | An indicator of whether data should be backfilled. Enabling the backfill flag will result in all data from the earliest index to the latest stored index being egressed. Data backfill occurs for each stream, including when you add a new stream. Once data backfill is complete for a stream, any out-of-order data is not egressed.  Defaults to `false`. |
| **EgressFilter**                | Optional                  | string    | A filter used to determine which streams and types are egressed. For more information on valid filters, see [Search in SDS](xref:sdsSearching). |

The following table lists egress parameters for `EgressConfiguration`.

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **EndpointId**                          | Optional                  | string    | Defines where data can be egressed |
| **DataSelectorId**                          | Optional                  | string or array    | Defines what data can be egressed |
| **ScheduleId**                          | Optional                  | string    | Defines when data can be egressed |
| **StreamPrefix**                | Optional                  | string    | Prefix applied to any streams that are egressed. A null string or a string containing only empty spaces will be ignored. The following restricted characters are not allowed: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % | < > { } ` " |
| **TypePrefix**                  | Optional                  | string    | Prefix applied to any types that are egressed. A null string or a string containing only empty spaces will be ignored. The following restricted characters are not allowed: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % | < > { } ` " |

### Examples

The following are valid egress configuration examples.

**Egress data to OCS. All streams, every 15 seconds.**

```json
[{
    "Id": "OCS",
    "ExecutionPeriod" : "00:00:15",
    "Endpoint" : "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
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
    "Endpoint" : "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
    "ClientId" : "{clientId}",
    "ClientSecret" : "{clientSecret}"
}]
```

**Egress data to OCS - all streams, every 15 seconds, including data backfill.**

```json
[{
    "Id": "OCS",
    "ExecutionPeriod" : "00:00:15",
    "Backfill" : true,
    "Endpoint" : "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
    "ClientId" : "{clientId}",
    "ClientSecret" : "{clientSecret}"
}]
```

**Egress diagnostic data to OCS - every 1 hour.**

```json
[{
    "Id": "OCS",
    "ExecutionPeriod" : "01:00:00",
    "Endpoint" : "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
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

The following table shows examples of REST URLS.

| Relative URL                                              | HTTP verb | Action               |
|-----------------------------------------------------------|-----------|----------------------|
| api/v1/configuration/storage/periodicegressendpoints      | GET       | Gets all configured egress endpoints. |
| api/v1/configuration/storage/periodicegressendpoints      | DELETE    | Deletes all configured egress endpoints. |
| api/v1/configuration/storage/periodicegressendpoints      | POST      | Adds an array of egress endpoints, fails if any endpoint already exists. |
| api/v1/configuration/storage/periodicegressendpoints      | POST      | Adds a single egress endpoint, fails if endpoint already exists. |
| api/v1/configuration/storage/periodicegressendpoints      | PUT       | Replaces all egress endpoints. |
| api/v1/configuration/storage/periodicegressendpoints/{id} | GET       | Gets configured endpoint with *id*. |
| api/v1/configuration/storage/periodicegressendpoints/{id} | DELETE    | Deletes configured endpoint with *id*. |
| api/v1/configuration/storage/periodicegressendpoints/{id} | PUT       | Replaces egress endpoint with *id*, fails if endpoint does not exist. |
| api/v1/configuration/storage/periodicegressendpoints/{id} | PATCH     | Allows partial updating of configured endpoint with *id*. |
