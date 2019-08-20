---
uid: troubleShooting
---

# Edge Data Store troubleshooting

If you encounter errors while using or developing against Edge Data Store, you have both local and remote means of diagnosing issues.

Edge Data Store supports a diagnostics namespace that is used to store streams containing diagnostic information from Edge Data Store itself. As with any other stream data stored in the Edge Storage component, you can egress this to either PI Web API or OSIsoft Cloud Services to monitor the state of a system remotely.

In addition, all components in Edge Data Store support OMF Health messages that can be configured using the Health Endpoint configuration so that OMF Health messages are sent to remote PI Web API or OSIsoft Cloud Service endpoints to support remote monitoring of devices.

## Ingress

### Ingress logging

You can find log messages related to egress in the Storage logs. If you set the the log level temporarily to **Trace**, most information for troubleshooting will be output.

### Ingress debugging

In order to troubleshoot problems between an OMF application and Edge Storage, enable debugging. If you set an appropriate value for the *IngressDebugExpiration* property in an storage runtime configuration, debugging will be enabled for all incoming OMF messages, and HTTP request and response content will be stored to disk for review. The property represents the date and time when debugging should no longer be enabled. You can also disable debugging if you set the value to *null*.

Examples of valid strings representing date and time:

    Utc: “yyyy-mm-ddThh:mm:ssZ”

    Local: “mm-dd-yyyy hh:mm:ss”

The content of the OMF message, including the headers will be written to the Logs Directory. For an active application this can become quite large. As a result, debug information is stored to disk in a separate format that usual log messages. A single file will be written to the usual Logs directory for every incoming OMF Type, Container, and Data message.

## Egress

### Egress logging

You can find log messages related to egress in the Storage logs. If you set the the log level temporarily to **Trace**, most information for troubleshooting will be output.

### Egress debugging

In order to troubleshoot problems between Edge Data Store and the destination, enable debugging. If you set an appropriate value for the *DebugExpiration* property in an egress configuration, debugging for that destination will be enabled, and HTTP request and response content will be stored to disk for review. The property represents the date and time when debugging should no longer be enabled. You can also disable debugging if you set the value to *null*.

Examples of valid strings representing date and time:

    Utc: “yyyy-mm-ddThh:mm:ssZ”

    Local: “mm-dd-yyyy hh:mm:ss”

The content length of each request/response and the overall number of requests/responses, can be quite large. As a result, debug information is stored to disk in a separate location than the typical log messages. Debug folders/files will be created under the Edge Data Store data folder. The debug folder/file structure is:

    Windows: %programdata%\OSIsoft\EdgeSystem\Storage\egressdump\{tenantId}\{namespaceId}\{egressId}\{omfType}\{Ticks}-{Guid}-{Req/Res}.txt

    Linux: /usr/share/OSIsoft/EdgeSystem/Storage/egressdump/{tenantId}/{namespaceId}/{egressId}/{omfType}/{Ticks}-{Guid}-{Req/Res}.txt

*omfType* represents Type/Container/Data;
*Ticks* represents the tick count for the Utc DateTime when it was decided that the message would be written to disk;
*Guid* represents a unique Guid for each request/response pair;
*Req/Res* whether it was the HTTP request or response.
