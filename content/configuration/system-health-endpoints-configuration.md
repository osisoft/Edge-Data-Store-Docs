---
uid: HealthEndpointsConfiguration
---

# Health endpoints configuration

To monitor the status of Edge Data Store, configure health information egress for its components to an OMF endpoint capable of receiving health messages. Health data is transmitted at a one minute interval.

## Configure system health endpoints

To configure system health endpoints, follow these steps:

1. Using any text editor, create a JSON file containing system health endpoints.

    - For content structure, see [System health endpoints example](#system-health-endpoints-example).

1. Update the parameters as needed. For a table of all available parameters, see [Parameters](#parameters).

1. Save the file with the name _System_HealthEndpoints.config.json_.

1. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/System/HealthEndpoints`, updating the port number if needed.

    Example using curl (run this command from the same directory where the file is located):

    ```bash
    curl -d "@System_HealthEndpoints.json" -H "Content-Type: application/json" http://localhost:5590/api/v1/configuration/System/HealthEndpoints
    ```

## Parameters

The following parameters are available for configuring system health endpoints.

| Parameter                                                   | Required  | Type     | Nullable | Description                                   |
| ----------------------------------------------------------- | --------- | -------- | -------- | -------------------------------------------- |
| **Buffering**                                                   | Optional  | reference| No       | Sets the buffering type for messages to this endpoint. <br> Options are memory, disk, or none. The default is none. |
| **ClientId**                                                  | Optional  | `string` | Yes        | The Client ID used for authentication to OSIsoft Cloud Services. |
| **ClientSecret**                                                | Optional  | `string` | Yes      | The Client Secret used for authentication to OSIsoft Cloud Services. |
| **Endpoint**                                                    | Required  | `string` | Yes      | The URL of the ingress point which accepts OMF health messages.|
| **Id**                                                          | Optional  | `string` | Yes      | The ID of the health endpoint configuration. <br> The ID can be any alphanumeric string; for example, Endpoint1. If you do not specify an ID, Edge Data Store generates one automatically.|
| **MaxBufferSizeMB**                                             | Optional  | `integer`| No       | The limit on the maximum megabytes of data to buffer for messages to this endpoint if an integer is > 0. This parameter is useful if you want to limit memory or disk usage growth in the event of disconnection to the endpoint. If the buffer is full, old messages will be discarded for new messages. The default is 0. |
| **Password**                                                    | Optional  | `string` | Yes      | The password used for authentication to PI Web API OMF endpoint. |
| **UserName**                                                    | Optional  | `string` | Yes      | The user name used for authentication to PI Web API OMF endpoint. |
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
