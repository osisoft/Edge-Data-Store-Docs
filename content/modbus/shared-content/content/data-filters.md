---
uid: ModbusDataFiltersConfiguration
---

# Data filters

You can configure PI adapters to perform data filtering to save network bandwidth. Every data item in the data selection configuration can be assigned the `Id` of a data filter. The adapter filters data for those data items based on the data filter configuration.

**Note:** If you enable data filters and data quality changes, both the old and current data quality values are passed on.

## Configure data filters

Complete the following steps to configure data filters. Use the `PUT` method in conjunction with the `http://localhost:5590/api/v1/configuration/<ComponentId>/DataFilters` REST endpoint to initialize the configuration.

1. Using a text editor, create an empty text file.

2. Copy and paste an example configuration for data filters into the file.

    For sample JSON, see [Data filters example](#data-filters-example).

3. Update the example JSON parameters for your environment.

    For a table of all available parameters, see [Data filters parameters](#data-filters-parameters).

4. Save the file. For example, as `ConfigureDataFilters.json`.

5. Open a command line session. Change directory to the location of `ConfigureDataFilters.json`.

6. Enter the following curl command or EdgeCmd to initialize the data filters configuration.

    ### [curl](#tab/tabid-1)
    
    ```bash
    curl -d "@ConfigureDataFilters.json" -H "Content-Type: application/json" -X PUT "http://localhost:5590/api/v1/configuration/Modbus1/DataFilters"
    ```
    
    ### [EdgeCmd](#tab/tabid-2)
    
    ```
    edgecmd set dataFilters -cid Modbus1 -file ConfigureDataFilters.json
    ```
    ***
    
    **Note:** If you installed the adapter to listen on a non-default port, update `5590` to the port number in use. For a list of other REST operations you can perform, like updating or deleting a data filters configuration, see [REST URLs](#rest-urls).

On successful execution, the change that you have made to data filters takes effect immediately during runtime.

## Data filters parameters

The following parameters are available for configuring data filters:

| Parameter                | Required | Type      | Description |
| ------------------------ | -------- | --------- | ----------- |
|**Id**              | Required | `string` | Unique identifier for the data filter. <br><br>Allowed value: any string identifier<br> |
|**AbsoluteDeadband** | Optional | `double` | Specifies the absolute change in data value that should cause the current value to pass the filter test. <br> **Note:** You must specify `AbsoluteDeadband` or `PercentChange`.<br><br>Allowed value: double value representing absolute deadband number<br>Default value: `null` |
|**PercentChange**     | Optional | `double` | Specifies the percent change from previous value that should cause the current value to pass the filter test. <br> **Note:** You must specify `AbsoluteDeadband` or `PercentChange`.<br><br>Allowed value: double value representing percent change<br>Default value: `null` |
|**ExpirationPeriod**     | Optional | `timespan` | The length in time that can elapse after an event before automatically sending the next event, regardless of whether the next event passes the filter or not. The expected format is HH:MM:SS.### or SSS.* <br><br>Allowed value: any timespan <br>Default value: `null`|

**\* Note:** For example, `"ExpirationPeriod": 5:00` and `"ExpirationPeriod": 300` both specify an expiration period of 5 minutes and 0 seconds.

## Data filters example

```code
[
  {
    "Id": "DuplicateData",
    "AbsoluteDeadband": 0,
    "PercentChange": null,
    "ExpirationPeriod": "01:00:00"
  }
]
```

## REST URLs

| Relative URL | HTTP verb | Action |
| ------------ | --------- | ------ |
| api/v1/configuration/_ComponentId_/DataFilters      | `GET`       | Gets all configured data filters. |
| api/v1/configuration/_ComponentId_/DataFilters      | `DELETE`    | Deletes all configured data filters. |
| api/v1/configuration/_ComponentId_/DataFilters      | `POST`      | Adds an array of data filters or a single data filter. Fails if any data filter already exists. |
| api/v1/configuration/_ComponentId_/DataFilters      | `PUT`       | Replaces all data. |
| api/v1/configuration/_ComponentId_/DataFilters      | `PATCH`     | Allows partial updating of configured data filter. |
| api/v1/configuration/_ComponentId_/DataFilters/*id* | `GET`       | Gets configured data filter by `Id`. |
| api/v1/configuration/_ComponentId_/DataFilters/*id*| `DELETE`     | Deletes configured data filter by `Id`. |
| api/v1/configuration/_ComponentId_/DataFilters/*id* | `PUT`       | Replaces data filter by `Id`. Fails if data filter does not exist. |

**Note:** Replace *ComponentId* with the `Id` of your adapter component.
