---
uid: systemloggingConfiguration
---

# System-level logging configuration

Edge Data Store writes daily log messages to flat text files in the following locations:

- Windows: `%ProgramData%/OSIsoft/EdgeDataStore/Logs`

- Linux: `/usr/share/OSIsoft/EdgeDataStore/Logs`

Each message in the log displays the message severity level, timestamp, and the message itself.

## Default logging configuration and schema

By default, logging captures Information, Warning, Error, and Critical messages in the message logs.
The following logging configuration is the default for a component on install:

```json
{
  "logLevel": "Information",
  "logFileSizeLimitBytes": 34636833,
  "logFileCountLimit": 31   
}
```

The schema file specifies how to formally describe the configuration parameters for message logging.
It is located in:

- Windows: `%ProgramFiles%/OSIsoft/EdgeDataStore/Schema`

- Linux: `/opt/OSIsoft/EdgeDataStore/Schema`

## Change logging configuration

To change the logging configuration, follow these steps:

1. Edit the message logging configuration JSON file that you want to update the parameters as needed. For example, the `System_Logging.json` file:

    ```json
    {
      "logLevel": "Warning",
      "logFileSizeLimitBytes": 16777216,
      "logFileCountLimit": 30   
    }
    ```

1. Save the file.

1. Use any tool capable of making HTTP requests to execute a PUT command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/System/Logging`.

      Example using curl (run this command from the same directory where the file is located):

      ```bash
      curl -d "@System_Logging.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/System/Logging
      ```

    On successful execution, the log level change takes effect immediately during runtime. The other configurations (log file size and file count) get updated after Edge Data Store is restarted.

    **Note:**  Any parameter not specified in the updated configuration file will revert to the default schema value.

### Log levels

The logLevel sets the minimum severity for messages to be included in the logs. Messages with a severity below the level set are not included. The log levels in their increasing order of severity are as follows: `Trace`, `Debug`, `Information`, `Warning`, `Error`, `Critical`.

The following table has general guidelines for setting the log level.

| **Level**                | **Description**|
|--------------------------|-----------|
|Trace         | Logs that contain the most detailed messages. These messages may contain sensitive application data like actual received values and should not be enabled in a production environment. |
| Debug | Logs that can be used to troubleshoot data flow issues by recording metrics and detailed flow related information. |
| Information | Logs that track the general flow of the application. Any non-repetitive general information (like version information relating to the software at startup, what external services are being used, data source connection string, number of measurements, egress URL, change of state "Starting", "Stopping", or configuration) can be useful for diagnosing potential application errors.  |
| Warning | Logs that highlight an abnormal or unexpected event in the application flow, but does not otherwise cause the application execution to stop. Warning messages can indicate a data source state that is not configured, that a communication with backup failover instance has been lost, an insecure communication channel in use, or any other event that could require attention, but that does not impact data flow. |
| Error | Logs that highlight when the current flow of execution is stopped due to a failure. These should indicate a failure in the current activity, not an application-wide failure. This can indicate an invalid configuration, unavailable external endpoint, internal flow error, and so on.|
| Critical | Logs that describe an unrecoverable application or system crash, or a catastrophic failure that requires immediate attention. This can indicate application wide failures like beta timeout expired, unable to start self-hosted endpoint, unable to access vital resource (for example, Data Protection key file), and so on. |

## Parameters for logging

The following parameters are available for configuring logging.

| Parameter                   | Required | Type      | Nullable | Description |
| --------------------------- | ---------| --------  | -------- | ----------- |
| **LogFileCountLimit**       | Optional | `integer` | Yes      | The maximum number of log files that the service will create for the component. It must be a positive integer.             |
| **LogFileSizeLimitBytes**   | Optional | `integer` | Yes      | The maximum size in bytes of log files that the service will create for the component. It must be a positive integer.            |
| **LogLevel**                | Optional | reference | No       | The log level settings that you want. The following options are available: <br> **Verbose** - Captures all messages: Verbose, Debug, Information, Warning and Error <br> **Debug** - Captures most messages: Debug, Information, Warning and Error <br> **Information** - Captures most messages: Information, Warning and Error <br> **Warning** - Captures only Warning and Error messages <br> **Error** - Captures Error messages only |
