---
uid: configureEgress
---

# Configure periodic data egress

Periodic data egress is a recurring task that sends the timeseries data collected by EDS to long term storage in either AVEVA Data Hub or PI Server. You can create multiple egress destinations and multiple periodic egress tasks. Periodic egress runs on a regular schedule to ensure that data is sent to long term storage.

Once the AVEVA Data Hub or PI Server destinations are prepared to receive OMF messages, configure data egress to create the connection to the destination and specify the details of the data egress, including the data to include and the frequency to send it. For more information on egress destinations, see [Prepare egress destinations](xref:PrepareEgressDestinations).

To support the reuse of common configuration blocks, EDS egress configuration is divided into four facets, which can be configured together or separately:

- `EgressEndpoints` - Describes the egress endpoint connectivity information

- `Schedules` - Describes the timing of data egress

- `DataSelectors` - Describes which data to egress and includes stream and data filtering

- `EgressConfigurations` - Ties together the three previous facets and includes settings for type and stream prefixing, backfill, and more

**Warnings:** 

  - You cannot add configurations manually because some parameters are stored to disk encrypted. You must use the REST endpoints to add/edit configurations. For additional endpoints, see [REST URLs](#rest-urls).

  - If you delete or remove an egress configuration and then recreate it with `Backfill` set to `true`, duplicate data will appear on any stream that was previously egressed successfully. New streams will not see duplicate data.

## Create egress configuration

To configure EDS for data egress:

1. Create a JSON file.

   - For content structure, see the following [Examples](#examples).

1. Update the parameters as needed. For a table of all available parameters, see [Parameters](#parameters).

1. Save the JSON file to any directory on the device where Edge Data Store is installed.

1. Use any tool capable of making HTTP requests to send the contents of the JSON file to the appropriate configuration endpoints:

| Use Case                              | Filename                       | Command  | Endpoint                                                                  |
|---------------------------------------|--------------------------------|-----------|--------------------------------------------------------------------------|
| Configures multiple egress facets     | **StorageEgress.json**         | PUT       | `http://localhost:5590/api/v1/configuration`                               |
| Creates EgressEndpoints only          | **EgressEndpoints.json**       | POST      | `http://localhost:5590/api/v1/configuration/storage/egressendpoints`       |
| Creates Schedules only                | **Schedules.json**             | POST      | `http://localhost:5590/api/v1/configuration/storage/schedules`             |
| Creates DataSelectors only            | **DataSelectors.json**         | POST      | `http://localhost:5590/api/v1/configuration/storage/dataselectors`         |
| Creates EgressConfigurations only     | **EgressConfigurations.json**  | POST      | `http://localhost:5590/api/v1/configuration/storage/egressconfigurations`  |

Example using cURL, which must be run from the directory where the JSON file is saved:

```bash
curl -d "@{Filename}" -H "Content-Type: application/json" -X {Command} {Endpoint}
```

**Note:** The @ symbol is a required prefix for this command. `{Filename}`, `{Command}` and `{Endpoint}` should be replaced by the corresponding filename, command, and endpoint.

- To configure multiple egress facets together:

```bash
curl -d "@StorageEgress.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration
```

- To configure only the EgressEndpoints facet:

```bash
curl -d "@EgressEndpoints.json" -H "Content-Type: application/json" -X POST http://localhost:5590/api/v1/configuration/storage/egressendpoints
```

## Parameters

The following table lists egress parameters for `EgressEndpoints`.

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **Id**                          | Required                  | string    | Unique identifier of the endpoint configuration                                  |
| **Endpoint**                    | Required                  | string    | Destination that accepts OMF v1.2 and older messages. Supported destinations include AVEVA Data Hub and PI Server. |
| **Username**                    | Required for PI Server endpoint  | string    | User name used for authentication to PI Web API OMF endpoint. If domain is required, the backslash must be escaped (for example, *domain*\\\\*username*). |
| **Password**                    | Required for PI Server endpoint  | string    | Password used for authentication to PI Web API OMF endpoint |
| **ClientId**                    | Required for AVEVA Data Hub endpoint | string    | Client ID used for authentication to AVEVA Data Hub OMF endpoint  |
| **ClientSecret**                | Required for AVEVA Data Hub endpoint | string    | Client Secret used for authentication with the AVEVA Data Hub OMF endpoint  |
| **DebugExpiration**             | Optional                  | string    | Enables logging of detailed information for each outbound HTTP request pertaining to this egress endpoint to disk. The value represents the date and time this logging will stop. Examples of valid strings representing date and time:  UTC: `yyyy-mm-ddThh:mm:ssZ`, Local: `yyyy-mm-ddThh:mm:ss`. For more information, see [Troubleshoot Edge Data Store](xref:troubleShooting). |
| **TokenEndpoint**               | Optional for AVEVA Data Hub endpoint | string    | Used to retrieve an AVEVA Data Hub token from an alternative endpoint. *This is not normally necessary with AVEVA Data Hub. Only use if directed to do so by customer support.* |
| **ValidateEndpointCertificate** | Optional                  | boolean   | Validate endpoint certificate (recommended). If `false`, egress accepts any endpoint certificate. Use for testing only with self-signed certificates. Defaults to `true`. |

The following table lists egress parameters for `Schedules`.

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **Id**                          | Required                  | string    | Unique identifier of the schedule configuration    |
| **Period**                      | Required                  | string    | Frequency of time between each egress action beginning at or after the **StartTime**. Must be a string in the following format `d.hh:mm:ss.##`. See **StartTime** for additional information. |
| **StartTime**                   | Optional                  | string    | The date and time when egress actions will begin. Valid formats are: UTC: `yyyy-mm-ddThh:mm:ssZ` and Local: `yyyy-mm-ddThh:mm:ss`. Use the **StartTime** parameter if you want data egress to begin at or after a specific time instead of beginning immediately. If you do not specify a **StartTime**, egress begins as soon as you submit the configuration and will occur again whenever the length of the **Period** completes. For example, a **Period** of `00:15:00` without a defined **StartTime** results in immediate data egress when you submit the configuration and then every 15 minutes thereafter. Conversely, if you use a **StartTime** of `2022-10-02T06:00:00`, a **Period** of `00:15:00`, and you submit your configuration at 6:07 on October 2, 2022, egress will begin at 6:15 and will continue every 15 minutes thereafter.  |

The following table lists egress parameters for `DataSelectors`.

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **Id**                          | Required                  | string    | Unique identifier of the data selector configuration |
| **StreamFilter**                | Optional                  | string    | A filter used to determine which streams and types are egressed. For more information on valid filters, see [Search in SDS](xref:sdsSearching). |
| **AbsoluteDeadband**            | Optional                  | string    | Specifies the absolute change in data value that will cause the current value to pass the filter test. At least one of **AbsoluteDeadband** or **PercentChange** must be specified. |
| **PercentChange**               | Optional                  | string    | Specifies the percent change from previous value that will cause the current value to pass the filter test. At least one of **AbsoluteDeadband** or **PercentChange** must be specified. |
| **ExpirationPeriod**            | Optional                  | string    | The length in time that can elapse after an event before automatically storing the next event. The expected format is `HH:MM:SS.###`. |

The following table lists egress parameters for `EgressConfigurations`.

| Parameter                       | Required                  | Type      | Description                                        |
|---------------------------------|---------------------------|-----------|----------------------------------------------------|
| **Id**                          | Optional                  | string    | Unique identifier of the configuration             |
| **Name**                        | Optional                  | string    | Friendly name                                      |
| **Description**                 | Optional                  | string    | Friendly description                               |
| **Enabled**                     | Optional                  | boolean   | An indicator of whether egress is enabled when the egress endpoint is loaded. Defaults to `true`. |
| **EndpointId**                  | Required                  | string    | Id of the endpoint selected for egress |
| **ScheduleId**                  | Required                  | string    | Id of the schedule selected for egress |
| **DataSelectorIds**             | Optional                  | array     | Ids of the data selectors for egress    |
| **NamespaceId**                 | Optional                  | string    | Represents the namespace that will be egressed. There are two available namespaces: `default` and `diagnostics`. The default namespace is `default`. |
| **Backfill**                    | Optional                  | boolean   | Indicates whether data will be backfilled. Data backfill occurs when you run the egress endpoint for the first time after application startup. This results in all data from the earliest to the latest stored index being egressed. Set to `true` to backfill data. Defaults to `false`. |
| **StreamPrefix**                | Optional                  | string    | Prefix applied to any streams that are egressed. A null string or a string containing only empty spaces will be ignored. The following restricted characters are not allowed: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % \| < > \{ } \` " |
| **TypePrefix**                  | Optional                  | string    | Prefix applied to any types that are egressed. A null string or a string containing only empty spaces will be ignored. The following restricted characters are not allowed: / : ? # [ ] @ ! $ & ' ( ) \ * + , ; = % \| < > \{ } \` " |

## Examples

The following are valid configuration examples for egress.

### Configure multiple egress facets in a single request

`PUT http://localhost:5590/api/v1/configuration`

Create configuration for egress of all data for all streams to AVEVA Data Hub every 15 seconds.

```json
{
    "Storage": {
        "EgressEndpoints": [
            {
                "Id": "Endpoint-AVEVA Data Hub",
                "Endpoint": "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
                "ClientId": "{clientId}",
                "ClientSecret": "{clientSecret}"
            }
        ],
        "Schedules": [
            {
                "Id": "Schedule-15sec",
                "Period": "00:00:15"
            }
        ],
        "EgressConfigurations": [
            {
                "Id": "AVEVA Data Hub",
                "EndpointId": "Endpoint-AVEVA Data Hub",
                "ScheduleId": "Schedule-15sec"
            }
        ]
    }
}
```

Create configuration for egress of some data for some streams, to AVEVA Data Hub and PI Server, every 2 days starting January 1st, 2022 at 9:00. EgressEndpoints/Schedules/DataSelectors definitions are shared.

```json
{
    "Storage": {
        "EgressEndpoints": [
            {
                "Id": "Endpoint-AVEVA Data Hub",
                "Endpoint": "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
                "ClientId": "{clientId}",
                "ClientSecret": "{clientSecret}"
            },
            {
                "Id": "Endpoint-PI",
                "Endpoint": "https://{webApiLocation}/piwebapi/omf/",
                "Username": "{username}",
                "Password": "{password}"
            }
        ],
        "Schedules": [
            {
            "Id": "Schedule1",
            "StartTime": "2022-01-01T09:00:00",
            "Period": "2.00:00:00"
            }
        ],
        "DataSelectors": [
            {
                "Id": "DataSelector1",
                "StreamFilter": "TypeId:TestType1",
                "AbsoluteDeadband": 50,
                "ExpirationPeriod": "12:00:00"
            },
            {
                "Id": "DataSelector2",
                "StreamFilter": "TypeId:TestType1",
                "PercentChange": 80
            }
        ],
        "EgressConfigurations": [
            {
                "Id": "AVEVA Data Hub",
                "EndpointId": "Endpoint-AVEVA Data Hub",
                "ScheduleId": "Schedule1",
                "DataSelectorIds": ["DataSelector1"]
            },
            {
                "Id": "PI",
                "EndpointId": "Endpoint-PI",
                "ScheduleId": "Schedule1",
                "DataSelectorIds": ["DataSelector1", "DataSelector2"]
            }
        ]
    }
}
```

### Create EgressEndpoints only

`POST http://localhost:5590/api/v1/configuration/storage/egressendpoints`

Add a single new egress endpoint to PI.

```json
{
    "Id": "Endpoint-PI",
    "Endpoint": "https://{webApiLocation}/piwebapi/omf/",
    "Username": "{username}",
    "Password": "{password}"
}
```

Add multiple new egress endpoints to AVEVA Data Hub and PI with the use of a domain in the username. All properties are explicitly listed.

```json
[
    {
        "Id": "Endpoint-AVEVA Data Hub",
        "Endpoint": "https://{OcsLocation}/api/Tenants/{tenantId}/Namespaces/{namespaceId}/omf",
        "ClientId": "{clientId}",
        "ClientSecret": "{clientSecret}",
        "Username": null,
        "Password": null,
        "TokenEndpoint": null,
        "ValidateEndpointCertificate": true,
        "DebugExpiration": null
    },
    {
        "Id": "Endpoint-PI-WithDomain",
        "Endpoint": "https://{webApiLocation}/piwebapi/omf/",
        "ClientId": null,
        "ClientSecret": null,
        "Username": "{domain}\\{username}",
        "Password": "{password}",
        "TokenEndpoint": null,
        "ValidateEndpointCertificate": true,
        "DebugExpiration": null
    }
]
```

### Create Schedules only

`POST http://localhost:5590/api/v1/configuration/storage/schedules`

Add a single new schedule for egress every 15 seconds.

```json
{
    "Id": "Schedule-15sec",
    "Period": "00:00:15"
}
```

Add multiple new schedules for egress every minute and every hour starting January 1st, 2022 at 9:00. All properties are explicitly listed.

```json
[
    {
        "Id": "Schedule-1min",
        "StartTime": null,
        "Period": "00:01:00"
    },
    {
        "Id": "Schedule-1hr",
        "StartTime": "2022-01-01T09:00:00",
        "Period": "01:00:00"
    }
]
```

### Create DataSelectors only

`POST http://localhost:5590/api/v1/configuration/storage/dataselectors`

  Add single new data selector for egress of data filtered by percent change of 10 for streams whose Id contains "Modbus" or "Opc".

```json
{
    "Id": "DataFilterByPercentChange-StreamFilterById",
    "StreamFilter": "Id:*Modbus* OR Id:*Opc*",
    "PercentChange": 10
}
```

Add a single new data selector for data egress filtered by an absolute deadband of 5 and expiration period of 10 minutes for all streams. All properties are explicitly listed.

```json
{
    "Id": "DataFilterByAbsoluteDeadbandWithExpiration",
    "StreamFilter": null,
    "AbsoluteDeadband": 5,
    "PercentChange": null,
    "ExpirationPeriod": "00:10:00"
}
```

Add multiple new data selectors for egress of all data for streams with a specific `TypeId` value and streams with a field that begins with `Unique`.

```json
[
    {
        "Id": "StreamFilterByTypeId",
        "StreamFilter": "TypeId:myType",
        "AbsoluteDeadband": 0
    },
    {
        "Id": "StreamFilterByFieldName",
        "StreamFilter": "Unique*",
        "PercentChange": 0
    }
]
```

### Create EgressConfigurations only

`POST http://localhost:5590/api/v1/configuration/storage/egressconfigurations`

Add a single new configuration for egress of all data for all streams to AVEVA Data Hub every 15 seconds.

```json
{
    "Id": "AVEVA Data Hub",
    "EndpointId": "Endpoint-AVEVA Data Hub",
    "ScheduleId": "Schedule-15sec"
}
```

Add a single new configuration for egress of all data for all streams to PI every 15 seconds and include both the type and stream prefix. All properties are explicitly listed.

```json
{
    "Id": "PI",
    "Name": null,
    "Description": null,
    "Enabled": true,
    "EndpointId": "Endpoint-PI",
    "ScheduleId": "Schedule-15sec",
    "DataSelectorIds": null,
    "NamespaceId": "default"
    "Backfill": false,
    "StreamPrefix": "1ValidPrefix.",
    "TypePrefix": "AlsoValid_",
}
```

Add a single new configuration for egress of all data for streams with a specific `TypeId` value, to AVEVA Data Hub every 15 seconds.

```json
{
    "EndpointId": "Endpoint-AVEVA Data Hub",
    "ScheduleId": "Schedule-15sec",
    "DataSelectorIds": ["StreamFilterByTypeId"]
}
```

Add a single new configuration for egress of all data for streams containing a field that begins with `Unique` but with data filtered by percent change of 10 for streams whose Id contains `Modbus` or `Opc` to PI Server every minute.

```json
{
    "EndpointId": "Endpoint-PI",
    "ScheduleId": "Schedule-1min",
    "DataSelectorIds": ["StreamFilterByFieldName", "DataFilterByPercentChange-StreamFilterById"]
}
```

Add multiple new configurations for egress with backfill, diagnostics data, or PI Server endpoint with domain in username. `EgressEndpoints`, `Schedules`, and `DataSelectors` definitions are shared.

```json
[
    {
        "EndpointId": "Endpoint-AVEVA Data Hub",
        "ScheduleId": "Schedule-15sec",
        "Backfill": true
    },
    {
        "EndpointId": "Endpoint-AVEVA Data Hub",
        "ScheduleId": "Schedule-1hr",
        "DataSelectorIds": ["DataFilterByAbsoluteDeadbandWithExpiration"],
        "NamespaceId": "diagnostics"
    },
    {
        "EndpointId": "Endpoint-PI-WithDomain",
        "ScheduleId": "Schedule-1hr",
        "DataSelectorIds": ["StreamFilterByTypeId", "DataFilterByAbsoluteDeadbandWithExpiration"]
    }
]
```

### REST URLs

The following table shows examples of REST URLS. The `{egressFacet}` parameter can be any of the four egress facets: `EgressEndpoints`, `Schedules`, `DataSelectors`, or `EgressConfigurations`.

| Relative URL                                    | HTTP verb | Action               |
|-------------------------------------------------|-----------|----------------------|
| `api/v1/configuration/storage/{egressFacet}`      | `GET`       | Gets all configured objects of the *egressFacet*. |
| `api/v1/configuration/storage/{egressFacet}`      | `DELETE`    | Deletes all configured objects of the *egressFacet*. |
| `api/v1/configuration/storage/{egressFacet}`      | `POST`      | Adds an array of objects to the *egressFacet*, fails if any object already exists. |
| `api/v1/configuration/storage/{egressFacet}`      | `POST`      | Adds a single object to the *egressFacet*, fails if the object already exists. |
| `api/v1/configuration/storage/{egressFacet}`      | `PUT`       | Replaces all objects in the *egressFacet*. |
| `api/v1/configuration/storage/{egressFacet}/{id}` | `GET`       | Gets the configured object with *id* in the *egressFacet*. |
| `api/v1/configuration/storage/{egressFacet}/{id}` | `DELETE`    | Deletes the configured object with *id* in the *egressFacet*. |
| `api/v1/configuration/storage/{egressFacet}/{id}` | `PUT`       | Replaces the object with *id* in the *egressFacet*, fails if the object does not exist. |
| `api/v1/configuration/storage/{egressFacet}/{id}` | `PATCH`     | Allows partial updating of the configured object with *id* in the *egressFacet*. |
