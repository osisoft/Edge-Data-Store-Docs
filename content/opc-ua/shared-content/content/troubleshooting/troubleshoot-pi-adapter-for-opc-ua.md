---
uid: TroubleshootPIAdapterForOPCUA
---

# Troubleshoot PI Adapter for OPC UA

To troubleshoot issues with PI Adapter for OPC UA, you can check the adapter's configuration, connectivity, and logs, as detailed in the following sections. If you are unable to resolve issues with the adapter or need additional guidance, contact OSIsoft Technical Support.

## Check configurations

1. In the [data source configuration](xref:PIAdapterForOPCUADataSourceConfiguration), verify that the configured **EndpointURL** and, if specified, the **UserName** and **Password** are correct. Verify that OPC UA server trusts PI Adapter's certificate and vice versa.
2. In the [data selection configuration](xref:PIAdapterForOPCUADataSelectionConfiguration), verify that each configured data selection item below is correct.

    1. **NodeId** - Verify that the referenced nodeId exists on the server.
    2. **DataFilterId** - If configured, verify that the referenced data filter exists.

3. In the [egress endpoints configuration](xref:EgressEndpointsConfiguration), verify that each configured endpoint's **Endpoint** property and credentials are correct. For a PI server endpoint, verify **UserName** and **Password**, for an OCS endpoint, verify **ClientId** and **ClientSecret**.

## Check connectivity

1. Verify there are active connections to the data source and egress endpoints.
2. If you configured a health endpoint, use it to determine the status of the adapter.<br>For more information, see [Health and diagnostics](xref:HealthAndDiagnostics).

## Check logs

1. Check the adapter and endpoint logs to isolate issues.
2. Optional: Change the log level of the adapter to receive additional information and context.<br>For more information, see [Logging configuration](xref:LoggingConfiguration).
