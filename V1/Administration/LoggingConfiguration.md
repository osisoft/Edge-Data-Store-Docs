---
uid: loggingConfiguration
---

# Edge Data Store logging

Logging is used for diagnosing deployment or production issues, and it can be set dynamically without restarting the system.

## Edge Data Store logging configuration

Edge Data Store and all loaded components provide the ability to configure logging at the component level.  The following is an example logging configuration:

```json
{
  "LogLevel": "Information",
  "LogFileSizeLimitBytes": 34636833,
  "LogFileCountLimit": 31
}
```
