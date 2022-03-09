---
uid: TroubleshootPIAdapterForModbusTCP
---

# Troubleshoot PI Adapter for Modbus TCP

PI Adapter for Modbus TCP provides troubleshooting features that enable you to verify adapter configuration, confirm connectivity, and view message logs. If you are unable to resolve issues with the adapter or need additional guidance, contact OSIsoft Technical Support through the [OSIsoft Customer Portal](https://my.osisoft.com/).

## Check configurations

Incorrect configurations can interrupt data flow and cause errors in values and ranges. Perform the following steps confirm correct configuration for your adapter.

1. Navigate to [data source configuration](xref:PIAdapterForModbusTCPDataSourceConfiguration) and verify that each configured device IP address and port are correct.
2. Navigate to [data selection configuration](xref:PIAdapterForModbusTCPDataSelectionConfiguration) and verify the following for each configured data selection item below:

    * **DeviceId** - The referenced device exists in the data source configuration. <br> A non-existent or incorrect **DeviceId** causes the adapter to not find the data source device.
    * **UnitId** - The correct UnitId number is referenced. <br> An incorrect UnitId number can cause the adapter to request data from a different or non-existent device.
    * **RegisterType** - The correct RegisterType number or string is referenced.<br>An incorrect RegisterType number or string can cause the adapter to not read the correct register groups.
    * **RegisterOffset** - The correct RegisterOffset number is referenced.<br> An incorrect RegisterOffset number can cause the adapter to request or incorrectly interpret data locations, which results in unexpected values or out-of-range errors.
    * **DataTypeCode** - The correct DataTypeCode number is referenced.<br> An incorrect DataTypeCode number can cause unexpected values or out-of-range errors.
    * **ScheduleId** - The referenced schedule exists. <br> A non-existent referenced schedule uses a default schedule instead.
    * **DataFilterId** - If configured, verify the referenced data filter exists.<br> A non-existent or incorrect DataFilterId  means that data filtering is not active.
    * **BitMap** - If configured, verify the BitMap is correct.<br> An incorrect bitmap can cause unexpected values.

3. Navigate to [egress endpoints configuration](xref:EgressEndpointsConfiguration) and verify each configured endpoint's **Endpoint** property and credentials are correct.

    * For a PI server endpoint, verify **UserName** and **Password**.
    * For an OCS endpoint, verify **ClientId** and **ClientSecret**.

## Check connectivity

Perform the following steps to verify active connections to the data source and egress endpoints.

1. Start PI Web API and verify that the PI point values are  updating or start OCS and verify that the stream values are updating.
2. If configured, use a health endpoint to determine the status of the adapter.<br>For more information, see [Health and diagnostics](xref:HealthAndDiagnostics).

## Check logs

Perform the following steps to view the adapter and endpoint logs to isolate issues for resolution.

1. Navigate to the logs directory:<br>
    Windows: `%ProgramData%\OSIsoft\Adapters\Modbus\Logs`<br>
    Linux: `/usr/share/OSIsoft/Adapters/Modbus/Logs`.
2. Optional: Change the log level of the adapter to receive more information and context.<br>For more information, see [Logging configuration](xref:LoggingConfiguration).

## Simulators

Download an online Modbus simulator as a data source to troubleshoot the adapter. For example, *Mod_RSSim*.
