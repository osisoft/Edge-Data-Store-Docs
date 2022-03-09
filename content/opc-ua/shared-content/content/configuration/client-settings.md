---
uid: PIAdapterForOPCUAClientSettingsConfiguration
---

# Client settings

The client settings configuration is automatically generated when a new data source is added. If you experience problems with timeouts or when OPC UA limits are exceeded in terms of browse or subscription operation, you can change the client settings configuration.

## Generate default OPC UA client settings configuration file

If a valid data source exists, the adapter is running, and you do not want to configure OPC UA client settings, you can choose to generate a default OPC UA client settings file.

Complete the following steps to generate the default client settings file:

1. Add an OPC UA adapter with a unique `ComponentId`. For more information, see [System components configuration](xref:SystemComponentsConfiguration).
  
2. Configure a valid OPC UA data source. For more information, see [PI Adapter for OPC UA data source configuration](xref:PIAdapterForOPCUADataSourceConfiguration).

   Once you complete these steps, a default OPC UA client settings configuration file is generated in the configuration directory for the corresponding platform.
  
   The following are example locations of the file created. In this example, it is assumed that the `ComponentId` of the OPC UA component is OpcUa1:

   Windows: `%programdata%\OSIsoft\Adapters\OpcUa\Configuration\OpcUa1_ClientSettings.json`
  
   Linux: `/usr/share/OSIsoft/Adapters/OpcUa/Configuration/OpcUa1_ClientSettings.json`

## Configure OPC UA client settings

Complete the following steps to configure OPC UA client settings. Use the `PUT` method in conjunction with the `api/v1/configuration/<ComponentId>/ClientSettings` REST endpoint to initialize the configuration.

1. Using a text editor, create an empty text file.

2. Copy and paste an example configuration for OPC UA client settings into the file.

    For sample JSON, see [OPC UA client settings example](#opc-ua-client-settings-example).

3. Update the example JSON parameters for your environment.

    For a table of all available parameters, see [OPC UA client settings parameters](#opc-ua-client-settings-parameters).

4. Save the file. For example, as `ConfigureClientSettings.json`.

5. Open a command line session. Change directory to the location of `ConfigureClientSettings.json`.

6. Enter the following cURL command (which uses the `PUT` method) to initialize the client settings configuration.

    ```bash
    curl -d "@ConfigureClientSettings.json" -H "Content-Type: application/json" -X PUT "http://localhost:5590/api/v1/configuration/OpcUa1/ClientSettings"
    ```

    **Notes:**
  
    * If you installed the adapter to listen on a non-default port, update `5590` to the port number in use.
    * If you use a component ID other than `OpcUa1`, update the endpoint with your chosen component ID.
    * For a list of other REST operations you can perform, like updating or deleting a client settings configuration, see [REST URLs](#rest-urls).
    <br/>
    <br/>

## OPC UA client settings schema

The full schema definition for the OPC UA client settings configuration is in the `OpcUa_ClientSettings_schema.json` file located in one of the following folders:

Windows: `%ProgramFiles%\OSIsoft\Adapters\OpcUa\Schemas`

Linux: `/opt/OSIsoft/Adapters/OpcUa/Schemas`

## OPC UA client settings parameters

The following parameters are available for configuring OPC UA client settings:

**Note**: All intervals, delays, and timeouts require the string to be formatted like this:<br> `[d:]h:mm:ss[.FFFFFFF]` where the items in brackets are optional.<br> d = days, h = hours, mm = minutes, ss = seconds, F = fractional portion of a second.<br><br> Example: `"05:07:10:40.150"` for 5 days, 7 hours, 10 minutes, 40 seconds, and .150 seconds.

| Parameter     | Required | Type | Description |
|---------------|----------|------|-------------|
| **maxBrowseReferencesToReturn**      | Optional | `integer` | Maximum number of references returned from browse call. <br><br>Minimum value: `0`<br>Maximum value: `4294967295`<br>Default value: `0`  |
| **browseBlockSize**      | Optional | `integer` | Maximum number of nodes to browse in one call. <br><br>Minimum value: `1`<br>Maximum value: `4294967295`<br>Default value:  `10`|
| **readBlockSize**      | Optional | `integer` | Maximum number of variables to read in one call. <br><br>Minimum value: `0`<br>Maximum value: `4294967295`<br>Default value: `1000` |
| **reconnectDelay**      | Optional | `TimeSpan` | Delay between reconnection attempts. *<br>Does not apply to the initial connection, only reconnections.<br><br> Allowed value: cannot be negative <br>Default value: `0:00:30`|
| **recreateSubscriptionDelay**      | Optional | `TimeSpan` | Delay between successful reconnection and subsequent subscription recreation. * <br><br>Allowed value: cannot be negative <br> Default value: `0:00:10`|
| **sessionRequestTimeout**      | Optional | `TimeSpan` | Default request timeout. * <br><br>Allowed value: greater than `00:00:05`<br>Default value: `0:02:00`|
| **connectionTimeout**      | Optional | `TimeSpan` | Connection timeout. * <br><br>Allowed value: greater than `00:00:05`<br>Default value: `0:00:30` |
| **sessionAllowInsecureCredentials**      | Optional | `boolean` | When set to true credentials can be communicated over unencrypted channel. <br><br>Allowed value: `true` or `false`<br>Default value: `false` |
| **sessionMaxOperationsPerRequest**      | Optional | `integer` | Default maximum operation per request. <br><br>Minimum value: `0`<br>Maximum value: `4294967295`<br>Default value: `1000`|
| **browseTimeout**      | Optional | `TimeSpan` | Browse operation timeout. * <br><br>Allowed value: greater than `00:00:05`<br>Default value: `0:01:00`|
| **readTimeout**      | Optional | `TimeSpan` | Read operation timeout. * <br><br>Allowed value: greater than `00:00:05`<br>Default value: `0:00:30` |
| **maxMonitoredItemsPerCall**      | Optional | `integer` | Maximum number of monitored items that can be added to subscription in one call. <br><br>Minimum value: `1`<br>Maximum value: `4294967295`<br>Default value: `1000`|
| **maxNotificationsPerPublish**      | Optional | `integer` | Maximum notification messages in one publish message. <br><br>Minimum value: `0`<br>Maximum value: `4294967295`<br>Default value: `0` |
| **publishingInterval**      | Optional | `TimeSpan` | Publishing interval of the subscription. * <br><br> Allowed value: cannot be negative <br> Default value: `0:00:01`|
| **createMonitoredItemsTimeout**      | Optional | `TimeSpan` | Create monitored items timeout. * <br><br>Allowed value: greater than `00:00:05`<br>Default value: `0:00:30`|
| **samplingInterval**      | Optional | `TimeSpan` | Monitored item sampling interval. * <br><br>Allowed value: cannot be negative <br>Default value: `0:00:00:5` |
| **monitoredItemDataChangeTrigger** | Optional | `string` | Determines on what conditions a subscription sends new values to the adapter.<br><br> Allowed values: `Status`, `StatusValue`, `StatusValueTimestamp` <br>Default value: `StatusValue`
| **monitoredItemQueueSize**      | Optional | `integer` | Monitored item queue size. <br><br>Minimum value: `1`<br> Maximum value: `4294967295` <br>Default value: `2`|
| **maxInternalQueueSize**      | Optional | `integer` | Maximum number of items that can be in the adapter internal queue. <br><br>Minimum value: `1000`<br>Maximum value: `2147483647`<br>Default value: `500000` |
| **HistoryReadBlockSize**      | Optional | `integer` | Maximum number of nodes for history to read in one call. <br><br>Minimum value: `1`<br>Maximum value: `4294967295`<br>Default value: `10` |
| **HistoryReadTimeout**      | Optional | `TimeSpan` | History read operation timeout. * <br><br>Allowed value: greater than `00:00:05`<br>Default value: `0:01:00` |

**\* Note:** You can also specify timespans as numbers in seconds. For example, `"reconnectDelay": 25` specifies 25 seconds, or `"reconnectDelay": 125.5` specifies 2 minutes and 5.5 seconds.

## OPC UA client settings example

```json
{
    "MaxBrowseReferencesToReturn": 0,
    "BrowseBlockSize": 10,
    "ReconnectDelay": "0:00:30",
    "RecreateSubscriptionDelay": "0:00:10",
    "ReadBlockSize": 1000,
    "SessionRequestTimeout": "0:02:00",
    "ConnectionTimeout": "0:00:30",
    "ReadTimeout": "0:00:30",
    "SessionAllowInsecureCredentials": false,
    "SessionMaxOperationsPerRequest": 1000,
    "BrowseTimeout": "0:01:00",
    "MaxMonitoredItemsPerCall": 1000,
    "MaxNotificationsPerPublish": 0,
    "PublishingInterval": "0:00:01",
    "CreateMonitoredItemsTimeout": "0:00:30",
    "MonitoredItemDataChangeTrigger": "StatusValue",
    "SamplingInterval": "0:00:00.5",
    "MonitoredItemQueueSize": 2,
    "MaxInternalQueueSize": 500000,
    "HistoryReadBlockSize": 10,
    "HistoryReadTimeout": "0:01:00"
}  
```

## REST URLs      

| Relative URL | HTTP verb | Action |
| ------------ | --------- | ------ |
| api/v1/configuration/_ComponentId_/ClientSettings  | GET | Retrieves the OPC UA client settings configuration. |
| api/v1/configuration/_ComponentId_/ClientSettings  | PUT | Configures or updates the OPC UA client settings  configuration. |
| api/v1/configuration/_ComponentId_/ClientSettings | DELETE | Deletes the OPC UA client settings  configuration. |
| api/v1/configuration/_ComponentId_/ClientSettings | PATCH | Allows partial updating of configured client settings fields. |

**Note:** Replace _ComponentId_ with the Id of your OPC UA component, for example OpcUa1.
