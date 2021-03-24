---
uid: ComponentLoggingConfiguration
---

# Component-level logging configuration

Component-level logging collects information about how the components of Edge Data Store are performing. Each message in the log displays the message severity level, timestamp, and the message itself. By default, EDS captures Information, Warning, and Error messages in the message log.

**Note:** The individual logging files of EDS and the components are the following:<br>
  - Edge Data Store: _System_Logging.json_
  - Storage: _Storage_Logging.json_
  - OSIsoft Adapter for OPC UA: _OpcUa1_Logging.json_
  - OSIsoft Adapter for Modbus TCP: _Modbus1_Logging.json_ <br><br>
If you have more than one OSIsoft Adapter of the same kind configured, the default file name will incrementally change, for example _OpcUa2_Logging.json_

## Configure logging

To adjust the message logging behavior, complete the following:

1. Using any text editor, open the _componentId_Logging.json_ file that you want.
2. Change the values as needed, so it looks similar to the [Logging example](#logging-example).
3. Use any tool capable of making HTTP requests to execute a POST command with the contents of that file to the respective endpoint.

    **Note:**  Replace `<ComponentId>` with the ComponentId of the adapter instance or Storage component, for example _OpcUa1_.

      Example using curl (run this command from the same directory where the file is located):

      ```bash
      curl -d "@componentId_Logging.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/<ComponentId>/Logging
      ```

**Note:** The other endpoints are the following:<br>
  - Edge Data Store: `http://localhost:5590/api/v1/configuration/System/Logging`
  - Storage: `http://localhost:5590/api/v1/configuration/Storage/Logging`
  - OSIsoft Adapter for OPC UA: `http://localhost:5590/api/v1/configuration/OpcUa1/Logging`
  - OSIsoft Adapter for Modbus TCP: `http://localhost:5590/api/v1/configuration/Modbus1/Logging`

### Log levels

The logLevel sets the minimum severity for messages to be included in the logs. Messages with a severity below the level set are not included. The log levels in their increasing order of severity are as follows: Trace, Debug, Information, Warning, Error, Critical.

Table: General guidelines for setting the log level.

| **Level**                | **Description**|      
|--------------------------|-----------|
|Trace         | Logs that contain the most detailed messages. These messages may contain sensitive application data like actual received values and should not be enabled in a production environment. |
| Debug | Logs that can be used to troubleshoot data flow issues by recording metrics and detailed flow related information. |
| Information | Logs that track the general flow of the application. Any non-repetitive general information (like version information relating to the software at startup, what external services are being used, data source connection string, number of measurements, egress URL, change of state "Starting", "Stopping", or configuration) can be useful for diagnosing potential application errors.  |
| Warning | Logs that highlight an abnormal or unexpected event in the application flow, but does not otherwise cause the application execution to stop. Warning messages can indicate an unconfigured data source state, that a communication with backup failover instance has been lost, an insecure communication channel in use, or any other event that could require attention, but that does not impact data flow. |
| Error | Logs that highlight when the current flow of execution is stopped due to a failure. These should indicate a failure in the current activity, not an application-wide failure. This can indicate an invalid configuration, unavailable external endpoint, internal flow error, and so on.|
| Critical | Logs that describe an unrecoverable application or system crash, or a catastrophic failure that requires immediate attention. This can indicate application wide failures like beta timeout expired, unable to start self-hosted endpoint, unable to access vital resource (for example, Data Protection key file), and so on. |

## Parameters for logging

The following parameters are available for configuring logging.

| Parameter                   | Required | Type      | Nullable | Description |
| --------------------------- | ---------| --------  | -------- | ----------- |
| **LogFileCountLimit**       | Optional | `integer` | Yes      |  The maximum number of log files that the service will create for the component. It must be a positive integer.            |
| **LogFileSizeLimitBytes**   | Optional | `integer` | Yes      | The maximum size in bytes of log files that the service will create for the component. It must be a positive integer.            |
| **LogLevel**                | Optional | reference | No       | The log level settings that you want. The following options are available: <br> **Verbose** - Captures all messages: Verbose, Debug, Information, Warning and Error <br> **Debug** - Captures most messages: Debug, Information, Warning and Error <br> **Information** - Captures most messages: Information, Warning and Error <br> **Warning** - Captures only Warning and Error messages <br> **Error** - Captures Error messages only |

## Logging example

```bash
{
"LogLevel": "Information",
"LogFileSizeLimitBytes": 34636833,
"LogFileCountLimit": 31
}
```
