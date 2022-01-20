---
uid: HealthEndpointsConfiguration
---

# Health endpoints configuration

To monitor the status of Edge Data Store, configure health information egress for its components to an OMF endpoint capable of receiving health messages. Health data is transmitted at a one minute interval.

## Configure system health endpoints

Complete the following steps to configure system health endpoints:

1. Using any text editor, create a JSON file containing system health endpoints.
    - For content structure, see [System health endpoints example](#system-health-endpoints-example).  
2. Update the parameters as needed. For a table of all available parameters, see [Parameters](#parameters).
3. Save the file with the name _System_HealthEndpoints.config.json_.
4. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/System/HealthEndpoints`, updating the port number if needed.

    Example using curl (run this command from the same directory where the file is located):

    ```bash
    curl -d "@System_HealthEndpoints.json" -H "Content-Type: application/json" http://localhost:5590/api/v1/configuration/System/HealthEndpoints
    ```

## Parameters

The following parameters are available for configuring system health endpoints.

NOTE: Parameters "Buffering" and "MaxBufferSizeMb" have been removed from the JSON. Configure buffering at (xref:BufferingConfiguration).
(To Editor, this page should be very similar to this now https://github.com/osisoft/PI-Adapter/blob/main/shared-content/configuration/health-endpoints.md)

| Parameter                                                   | Required  | Type     | Nullable | Description                                   |
| ----------------------------------------------------------- | --------- | -------- | -------- | -------------------------------------------- |
| **ClientId**                                                    | Optional  | `string` | Yes      | The Client ID used for authentication to OSIsoft Cloud Services. |
| **ClientSecret**                                                | Optional  | `string` | Yes      | The Client Secret used for authentication to OSIsoft Cloud Services. |
| **Endpoint**                                                    | Required  | `string` | Yes      | The URL of the ingress point which accepts OMF health messages.|
| **Id**                                                          | Optional  | `string` | Yes      | The ID of the health endpoint configuration. <br> The ID can be any alphanumeric string; for example, Endpoint1. If you do not specify an ID, Edge Data Store generates one automatically.|
| **Password**                                                    | Optional  | `string` | Yes      | The password used for authentication to PI Web API OMF endpoint. |
| **UserName**                                                    | Optional  | `string` | Yes      | The user name used for authentication to PI Web API OMF endpoint. |
| **TokenEndpoint**                                               | Optional  | `string` | Yes      | Retrieves an OCS token from an alternative endpoint <br><br>Allowed value: well-formed http or https endpoint string <br>Default value: `null` |
| **ValidateEndpointCertificate**                                 | Optional  | `Boolean`| No       | The OSIsoft Adapter validates the endpoint certificate if set to true (recommended). If set to false, the OSIsoft Adapter accepts any endpoint certificate. OSIsoft strongly recommends using disabled endpoint certificate validation for testing purposes only. |

## System health endpoints example

```json
[{
        "endpoint": "https://<pi web api server>/piwebapi/omf/",
        "UserName": "<username>",
        "Password": "<password>",
        "buffering": "none",
        "maxBufferSizeMB": 0
    },
    {
        "Endpoint": "https://<OCS OMF endpoint>",
        "ClientId": "<clientid>",
        "ClientSecret": "<clientsecret>",
        "buffering": "disk",
        "maxBufferSizeMB": 0
    }
]
```
