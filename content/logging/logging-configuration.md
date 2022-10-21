---
uid: LoggingConfig
---

# Configure logging

Use the logging configuration to collect information about how Edge Data Store and its components are performing. Set the severity level for the messages to capture, anywhere from critical errors only to debugging messages for troubleshooting.

Edge Data Store writes daily log messages to flat text files in the following locations:

  - Windows: `%ProgramData%\OSIsoft\EdgeDataStore\Logs`

  - Linux: `/usr/share/OSIsoft/EdgeDataStore/Logs`

Each message in the log displays the message severity level, timestamp, and the message itself. 

## Configure logging

To change the message logging behavior:

1. Using any text editor, open the log configuration file that you want.

1. Change the values as needed so it looks similar to the [Logging example](#example-logging-configuration).

1. Use any tool capable of making HTTP requests to execute a `POST` command with the contents of that file to the respective endpoint.

    **Note:**  Replace `<ComponentId>` with the `ComponentId` of the adapter instance or Storage component, for example `OpcUa1`.

      Example using curl (run this command from the same directory where the file is located):

      ```bash
      curl -d "@componentId_Logging.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/<ComponentId>/Logging
      ```

The component endpoints are the following:

  - Edge Data Store: `http://localhost:5590/api/v1/configuration/System/Logging`

  - Storage: `http://localhost:5590/api/v1/configuration/Storage/Logging`

  - OSIsoft Adapter for OPC UA: `http://localhost:5590/api/v1/configuration/OpcUa1/Logging`

  - OSIsoft Adapter for Modbus TCP: `http://localhost:5590/api/v1/configuration/Modbus1/Logging`

## Logging schema

The full schema definition for the logging configuration is in the component specific logging file:

  - Edge Data Store: `System_Logging.json`

  - Storage: `Storage_Logging.json`

  - OSIsoft Adapter for OPC UA: `OpcUa1_Logging.json`

  - OSIsoft Adapter for Modbus TCP: `Modbus1_Logging.json`
  
If you have more than one adapter of the same kind configured, the default file name incrementally changed, for example, `OpcUa2_Logging.json`.

The component specific logging files are located in the following folders:

  - Windows: `%ProgramFlies%\OSIsoft\EdgeDataStore\Schemas`

  - Linux: `/usr/share/OSIsoft/EdgeDataStore/Schemas`

## Parameters for logging

The following parameters are available for configuring logging.

| Parameter                   | Required | Type      | Nullable | Description |
| --------------------------- | ---------| --------  | -------- | ----------- |
| **LogFileCountLimit**       | Optional | `integer` | Yes      |  The maximum number of log files that the service will create for the component. It must be a positive integer.  <br> Minimum value: `1` <br> Maximum value: `2147483647` <br> Default value: `31`     |
| **LogFileSizeLimitBytes**   | Optional | `integer` | Yes      | The maximum size in bytes of log files that the service will create for the component. It must be a positive integer.     <br> Minimum value: `1000` <br> Maximum value: `9223372036854775807`  <br> Default value: `34636833`   |
| **LogLevel**                | Optional | reference | No       | The log level settings that you want. The following options are available: <br> `Verbose` - Captures all messages: Verbose, Debug, Information, Warning and Error <br> `Debug` - Captures most messages: Debug, Information, Warning and Error <br> `Information` - Captures most messages: Information, Warning and Error <br> `Warning` - Captures only Warning and Error messages <br> `Error` - Captures Error messages only |

### Log levels

The logLevel sets the minimum severity for messages to be included in the logs. Messages with a severity below the level set are not included. The log levels in their increasing order of severity are as follows: `Trace`, `Debug`, `Information`, `Warning`, `Error`, `Critical`.

The following table has general guidelines for setting the log level.

| **Level**                | **Description**|
|--------------------------|-----------|
| Trace         | Logs that contain the most detailed messages. These messages may contain sensitive application data like actual received values and should not be enabled in a production environment. |
| Debug | Logs that can be used to troubleshoot data flow issues by recording metrics and detailed flow-related information. |
| Information | Logs that track the general flow of the application. Any non-repetitive general information (like version information relating to the software at startup, what external services are being used, data source connection string, number of measurements, egress URL, change of state "Starting", "Stopping", or configuration) can be useful for diagnosing potential application errors.  |
| Warning | Logs that highlight an abnormal or unexpected event in the application flow, but does not otherwise cause the application execution to stop. Warning messages can indicate a data source state that is not configured, that a communication with backup failover instance has been lost, an insecure communication channel in use, or any other event that could require attention, but that does not impact data flow. |
| Error | Logs that highlight when the current flow of execution is stopped due to a failure. These should indicate a failure in the current activity, not an application-wide failure. This can indicate an invalid configuration, unavailable external endpoint, internal flow error, and so on.|
| Critical | Logs that describe an unrecoverable application, system crash, or a catastrophic failure that requires immediate attention. This can indicate application wide failures like beta timeout expired, unable to start self-hosted endpoint, unable to access vital resource (for example, Data Protection key file), and so on. |

## Example logging configuration

By default, logging captures Information, Warning, Error, and Critical messages in the message logs. The following logging configuration is the installation default for a component:

```bash
{
"LogLevel": "Information",
"LogFileSizeLimitBytes": 34636833,
"LogFileCountLimit": 31
}
```
